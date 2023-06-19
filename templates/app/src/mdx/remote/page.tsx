import React from 'react';
import Link from 'next/link';

import { ResolvingMetadata } from 'next';
import { createMetadata } from '@/src/lib/metadata';

import { getAllPages } from '@/src/lib/mdx-content';

export const generateMetadata = async (
  props: unknown,
  parent: ResolvingMetadata
) => {
  const parentMetadata = await parent;
  return createMetadata(
    {
      title: '{% .Dir.name %}',
      path: '{% .Dir.path %}',
    },
    parentMetadata
  );
};

const {% .Dir.name %} = async () => {
  const pages = await getAllPages("{% .Dir.dir %}");

	console.log("pages:", pages)

  return (
    <div>
			<h1>{% .Dir.name %}...</h1>
			{ pages.map((page) => {
				return <ListItem key={page.slug} page={page} />
			}) }
    </div>
  );
};

const ListItem = ({ page }) => {
	return (
		<div className="flex flex-col">
			<Link href={`${page.link}`}>{page.title} - { page.weight }</Link>
		</div>
	)
}

export default {% .Dir.name %};
