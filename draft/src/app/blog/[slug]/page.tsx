import { ResolvingMetadata } from 'next';
import Image from 'next/image';
import { createMetadata } from '@/src/lib/metadata';
import { getAllPages } from '@/src/lib/mdx-content';

type PostProps = {
  params: { slug: string };
};

//
// Broken currently
// https://github.com/vercel/next.js/issues/50471
//

// For some reason this is showing an error but the build still passes
export const dynamicParams = false;

export const generateMetadata = async (
  { params }: PostProps,
  parent: ResolvingMetadata
) => {
	var slug = params.slug;
	if (slug === "") {
		slug = "index"
	}

	var pageModule = null;
	try {
		pageModule = await import(`@/content/blog/${slug}.mdx`);
	} catch {
		pageModule = await import(`@/content/blog/${slug}/index.mdx`);
	}
  const { meta } = pageModule;

  const parentMetadata = await parent;

  return createMetadata(
    {
      title: meta.title,
      description: meta.description,
      path: `/blog/${params.slug}`,
    },
    parentMetadata,
    { openGraph: { type: 'article' } }
  );
};

export async function generateStaticParams() {
  const posts = await getAllPages("blog");

  return posts.map((post) => ({
    slug: post.slug,
  }));
}

const Post = async ({ params }: PostProps) => {
	var s = params.slug
	console.log("Post:", s)
	if (s === "") {
		s = "index"
	}
	
	var pageModule = null;
	try {
		pageModule = await import(`@/content/blog/${s}.mdx`);
	} catch {
		pageModule = await import(`@/content/blog/${s}/index.mdx`);
	}
  const { meta, default: Content } = pageModule;

  return (
    <article>
      <header className="mt-14 mb-8 text-center">
        <h1>{meta.title}</h1>
      </header>

      <section className="prose text-lg dark:prose-dark max-w-none">
        <Content />
      </section>
    </article>
  );
};

export default Post;

