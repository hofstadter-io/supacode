'use client';

import React from 'react';
import * as Navbar from '@radix-ui/react-navigation-menu';

import './navbar.css';

const NavbarDemo = () => {
  return (
		<Navbar.Root className="p-3 px-5 bg-emerald-500">
			<Navbar.List className="flex flex-row justify-between">
        <Navbar.Item>
          <Navbar.Link href="/">
						{% .App.Name %}
          </Navbar.Link>
        </Navbar.Item>

				<div className="flex flex-row">
					{% range .Datamodel.Models %}
						<Navbar.Item>
							<Navbar.Trigger className="px-3">{% .Name %}</Navbar.Trigger>
							<Navbar.Content>{% .Name %} stuff...</Navbar.Content>
						</Navbar.Item>
					{% end %}
				</div>

				{/* test submenus */}
				<Navbar.Item>
					<Navbar.Trigger>Item two</Navbar.Trigger>
					<Navbar.Content>
						<Navbar.Sub defaultValue="sub1">
							<Navbar.List>
								<Navbar.Item value="sub1">
									<Navbar.Trigger>Sub item one</Navbar.Trigger>
									<Navbar.Content>
										Sub item one content
									</Navbar.Content>
								</Navbar.Item>
								<Navbar.Item value="sub2">
									<Navbar.Trigger>Sub item two</Navbar.Trigger>
									<Navbar.Content>
										Sub item two content
									</Navbar.Content>
								</Navbar.Item>
							</Navbar.List>
						</Navbar.Sub>
					</Navbar.Content>
				</Navbar.Item>

        <Navbar.Item>
          <Navbar.Link href="/profile">
						Profile
          </Navbar.Link>
        </Navbar.Item>

				<Navbar.Indicator className="NavbarIndicator" />
			</Navbar.List>

			{/* Navbar.Content will be rendered here when active */}
			<Navbar.Viewport className="NavbarViewport"/>
		</Navbar.Root>
  );
};

export default NavbarDemo;
