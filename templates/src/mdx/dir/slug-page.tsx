import { ResolvingMetadata } from 'next';
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
	const pageModule = await import(`@/content/{% .Dir.dir %}/${slug}.mdx`);
  const { meta } = pageModule;

  const parentMetadata = await parent;

  return createMetadata(
    {
      title: meta.title,
      description: meta.description,
      path: `{% .Dir.path %}/${params.slug}`,
    },
    parentMetadata,
    { openGraph: { type: 'article' } }
  );
};

export async function generateStaticParams() {
  const entries = await getAllPages("{% .Dir.dir %}");

  return entries.map((entry) => ({
    slug: entry.slug,
  }));
}

const Post = async ({ params }: PostProps) => {
	var s = params.slug
	if (s === "") {
		console.log("SHOULD NOT GET HERE")
		return (<h1>should not get here</h1>)
	}
	
	const pageModule = await import(`@/content/{% .Dir.dir %}/${s}.mdx`);
  const { meta, default: Content } = pageModule;

  return (
    <article>
      <header className="mt-14 mb-8 text-center">
        <h1>{meta.title}</h1>
      </header>

      <section>
        <Content />
      </section>
    </article>
  );
};

export default Post;
