'use client';

import React from 'react';

import { ThemeProvider } from '@wits/next-themes';

import { MDXProvider } from '@mdx-js/react'
import "@code-hike/mdx/dist/index.css"

{% if .App.auth.enabled %}
import { SessionProvider } from 'next-auth/react';
{% end %}

export function Providers({ children }) {
  return (
		<ThemeProvider attribute="class" defaultTheme="system" enableSystem>
			
			{% if .App.auth.enabled %}
			<SessionProvider>
			{% end %}

				<MDXProvider>
					{children}
				</MDXProvider>

			{% if .App.auth.enabled %}
			</SessionProvider>
			{% end %}
		</ThemeProvider>
	)
}


