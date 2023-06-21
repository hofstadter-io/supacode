import "./globals.css";

import classnames from 'classnames';
import { Inter } from "next/font/google";
const inter = Inter({ subsets: ["latin"] });

import { Providers } from "./providers";
import Navbar from "./navbar";
import Footer from "./footer";

import Tree from "@/src/components/content-tree/component";
import SiteTree from "./site-tree.json";

export const metadata = {
  title: "myapp",
  description: "Generated by: hof create supacode",
};

export default function RootLayout({
  children,
	authModal,
}: {
  children: React.ReactNode,
	authModal: React.ReactNode,
}) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className={classnames(
				inter.className, 
				"min-h-screen antialiased",
				)}>
        <Providers>

          <div className="flex flex-col">
            <Navbar />

						<div className="authModal">
						{authModal}
						</div>

            <div className="flex flex-row flex-1 w-screen">
                {children}
            </div>

            <Footer />
          </div>

        </Providers>
      </body>
    </html>
  );
}