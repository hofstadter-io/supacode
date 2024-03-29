import "./globals.css";

import classnames from 'classnames';
import { Inter } from "next/font/google";
const inter = Inter({ subsets: ["latin"] });

import { Providers } from "./providers";
import Navbar from "@/src/components/ui/navbars/default";
import Footer from "@/src/components/ui/footers/default";

import ThemeChanger from "@/src/components/ui/themes/changer";
{% if .App.auth.enabled %}
import UserMenu from "@/src/components/ui/navbars/user-menu";
{% else %}
import PrefMenu from "@/src/components/ui/navbars/pref-menu";
{% end %}

const navbar = {
	brand: {
		name: "{% .App.name %}",
		href: "/",
	},

	links: [{
		title: "Docs",
		href: "/docs"
	},{
		title: "Posts",
		href: "/posts"
	},{
		title: "About",
		href: "/about"
	}],

	{% if .App.auth.enabled %}
	dropdown: <UserMenu ThemeChanger={ThemeChanger} />
	{% else %}
	dropdown: <PrefMenu ThemeChanger={ThemeChanger} />
	{% end %}
}

export const metadata = {
  title: "myapp",
  description: "Generated by: hof create supacode",
};

export default function RootLayout({
  children,
	{% if .App.auth.enabled %}
	authModal,
	{% end %}
}: {
  children: React.ReactNode,
	{% if .App.auth.enabled %}
	authModal: React.ReactNode,
	{% end %}
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={classnames(
				inter.className, 
				"min-h-screen antialiased",
				"transition-all",
				)}>
        <Providers>

          <div className="flex flex-col min-h-screen delay-1000">
            <Navbar {...navbar}/>

						{% if .App.auth.enabled %}
						<div className="authModal">
						{authModal}
						</div>
						{% end %}

            <div className="flex flex-row grow w-screen">
                {children}
            </div>

            <Footer copyright="{% .App.name %}"/>
          </div>

        </Providers>
      </body>
    </html>
  );
}
