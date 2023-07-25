import type { Adapter } from 'next-auth/adapters';
import { NextAuthOptions, User, getServerSession } from "next-auth";
import { useSession } from "next-auth/react";
import { redirect } from "next/navigation";

import Providers from "next-auth/providers";

import { PrismaAdapter } from "@auth/prisma-adapter";
import { db } from "../db";

export const authConfig: NextAuthOptions = {
	adapter: PrismaAdapter(db) as Adapter,
	session: {
		maxAge: 30 * 24 * 60 * 60,  
	},
  providers: [
		{% if .App.auth.password.enabled %}
    Providers.CredentialsProvider({
      name: "Email",
      credentials: {
        email: {
          label: "Email",
          type: "email",
          placeholder: "user@domain.com",
        },
        password: {
          label: "Password",
          type: "password",
        },
      },
      async authorize(credentials) {
        if (!credentials || !credentials.email || !credentials.password) {
          return null;
        }

				const dbUser = await db.user.findFirst({
					where: { email: credentials.email },
				})
				console.log(credentials.email, dbUser)

        //// bcrypt credentials.password and compare, there should be a function for this
        //if (dbUser && dbUser.password === credentials.password) {
        //  // interesting pattern...
        //  const { password, ...cleanedUser } = dbUser;
        //  return cleanedUser as User;
        //}
				
        return null;
      },
    }),
		{% end %}

		{% range $name, $value := .App.auth.oauth %}
		Providers.{% title $value.provider %}Provider({
			id: "{% $value.id %}",
      clientId: process.env.{% SNAKE $value.provider %}_CLIENT_ID! as string,
      clientSecret: process.env.{% SNAKE $value.provider %}_CLIENT_SECRET! as string,

			{% if or $value.scopes $value.url %}
			authorization: { 
				params: { 
					{% with $value.scopes %}
					scope: "{% . %}",
					{% end %}
					{% with $value.url %}
					url: "{% . %}",
					{% end %}
				},
			},
			{% end %}
    }),
		{% end %}
  ],
	callbacks: {
		async session({ token, session }) {
			if (token) {
				session.user.id = token.id
				session.user.name = token.name
				session.user.email = token.email
				session.user.image = token.image
				session.user.username = token.username
			}
			return session
		},
		async jwt({ token, user, account, profile }) {	
			const dbUser = await db.user.findFirst({
				where: { email: token.email },
			})

			// if no existing user...
			if (!dbUser) {
				token.id = user!.id
				return token
			}

			// if user, but no username...
			if(!dbUser.username) {
				await db.user.update({
					where: {
						id: dbUser.id,
					},
					data: {
						username: dbUser.email
					}
				})
			}

			return {
				id: dbUser.id,
				name: dbUser.name,
				email: dbUser.email,
				image: dbUser.image,
				username: dbUser.username,
			}
		},
		redirect() {
			return '/'
		}
	},
}

/**
 * Takes a token, and returns a new token with updated
 * `accessToken` and `accessTokenExpires`. If an error occurs,
 * returns the old token and an error property
 */
async function refreshAccessToken(token) {
  try {
    const url =
      "https://oauth2.googleapis.com/token?" +
      new URLSearchParams({
        client_id: process.env.GOOGLE_CLIENT_ID,
        client_secret: process.env.GOOGLE_CLIENT_SECRET,
        grant_type: "refresh_token",
        refresh_token: token.refreshToken,
      })

    const response = await fetch(url, {
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      method: "POST",
    })

    const refreshedTokens = await response.json()

    if (!response.ok) {
      throw refreshedTokens
    }

    return {
      ...token,
      accessToken: refreshedTokens.access_token,
      accessTokenExpires: Date.now() + refreshedTokens.expires_in * 1000,
      refreshToken: refreshedTokens.refresh_token ?? token.refreshToken, // Fall back to old refresh token
    }
  } catch (error) {
    console.log(error)

    return {
      ...token,
      error: "RefreshAccessTokenError",
    }
  }
}
