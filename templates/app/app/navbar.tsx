'use client';

import React from 'react';
import * as NavigationMenu from '@radix-ui/react-navigation-menu';

const NavigationMenuDemo = () => {
  return (
		<NavigationMenu.Root className="p-6 bg-blue">
			<NavigationMenu.List className="flex flex-row justify-between">
        <NavigationMenu.Item>
          <NavigationMenu.Link href="/">
						{% .App.Name %}
          </NavigationMenu.Link>
        </NavigationMenu.Item>

				<div className="flex flex-row">
					{% range .Datamodel.Models %}
						<NavigationMenu.Item className="mx-3">
							<NavigationMenu.Trigger>{% .Name %}</NavigationMenu.Trigger>
							<NavigationMenu.Content>{% .Name %} stuff...</NavigationMenu.Content>
						</NavigationMenu.Item>
					{% end %}
				</div>

        <NavigationMenu.Item>
          <NavigationMenu.Link href="/profile">
						Profile
          </NavigationMenu.Link>
        </NavigationMenu.Item>

				<NavigationMenu.Indicator className="NavigationMenuIndicator" />
			</NavigationMenu.List>

			{/* NavigationMenu.Content will be rendered here when active */}
			<NavigationMenu.Viewport />
		</NavigationMenu.Root>
  );
};

export default NavigationMenuDemo;
