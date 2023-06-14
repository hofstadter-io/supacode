'use client';

import React from 'react';
import Link from '@/src/components/link';

export default function UserDropdown ({ user, ThemeChanger }) {
	return (
		<div className="dropdown dropdown-end">
			<label tabIndex={0} className="btn btn-ghost btn-circle avatar">
				<div className="w-10 rounded-full">
					<img src="https://hofstadter.io/favicon.ico" />
				</div>
			</label>
			<ul tabIndex={0} className="mt-3 p-2 shadow menu menu-sm dropdown-content bg-base-100 rounded-box w-52">
				<li>
					<a href="/profile" className="justify-between">
						Profile
						<span className="badge badge-accent dark:badge-primary">New</span>
					</a>
				</li>
				<li><a>Settings</a></li>
				<li><ThemeChanger /></li>
				<li><Link href="/logout">Logout</Link></li>
			</ul>
		</div>
	)
}

