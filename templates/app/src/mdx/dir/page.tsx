import React from 'react';
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

  return (
    <div>
			<h1>{% .Dir.name %}...</h1>
			{ pages.map((page) => {
				return <p key={page.title}>{page.title} - { page.weight }</p>
			}) }
    </div>
  );
};

export default {% .Dir.name %};
