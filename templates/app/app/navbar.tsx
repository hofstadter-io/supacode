'use client';

import React from 'react';
import { Avatar, Dropdown, Navbar } from "flowbite-react";

const NavbarDemo = () => {
  return (
		<Navbar
			className="flex flex-row justify-between"
		>
			<Navbar.Brand href="/" className="">
				<img
					alt="Flowbite React Logo"
					className="mr-3 h-6 sm:h-9"
					src="https://flowbite.com/docs/images/logo.svg"
				/>
				<span className="self-center whitespace-nowrap text-xl font-semibold dark:text-white">
					Flowbite React
				</span>
			</Navbar.Brand>

			<Navbar.Collapse className="md:order-1 order-last">
				<Navbar.Link href="#" active>
					<p>Home</p>
				</Navbar.Link>
				<Navbar.Link href="#">
					About
				</Navbar.Link>
				<Navbar.Link href="#">
					Services
				</Navbar.Link>
				<Navbar.Link href="#">
					Pricing
				</Navbar.Link>
				<Navbar.Link href="#">
					Contact
				</Navbar.Link>
			</Navbar.Collapse>

			<div className="flex flex-row md:order-last order-2">
				<Navbar.Toggle className="mx-4 px-4"/>
				<Dropdown
					inline
					label={<Avatar alt="User settings" img="https://flowbite.com/docs/images/people/profile-picture-5.jpg" rounded/>}
				>
					<Dropdown.Header>
						<span className="block text-sm">
							Bonnie Green
						</span>
						<span className="block truncate text-sm font-medium">
							name@flowbite.com
						</span>
					</Dropdown.Header>
					<Dropdown.Item>
						Dashboard
					</Dropdown.Item>
					<Dropdown.Item>
						Settings
					</Dropdown.Item>
					<Dropdown.Item>
						Earnings
					</Dropdown.Item>
					<Dropdown.Divider />
					<Dropdown.Item>
						Sign out
					</Dropdown.Item>
				</Dropdown>
			</div>

		</Navbar>
  );
};

export default NavbarDemo;
