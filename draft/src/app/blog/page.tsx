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
      title: 'Blog',
      path: '/blog',
    },
    parentMetadata
  );
};

const Blog = async () => {
  const posts = await getAllPages("blog");

	console.log(posts)

  return (
    <div className="flex-1 prose dark:prose-invert p-8">
			<h1>blog posts...</h1>
			{ posts.map((post) => {
				return <p key={post.title}>{post.title} - { post.weight }</p>
			}) }
    </div>
  );
};

export default Blog;
