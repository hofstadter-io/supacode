import fs from 'fs';
import { compileMDX } from 'next-mdx-remote/rsc'

type PostProps = {
  params: { slug: string[] };
};

type Post = {
	title: string,
	weight: number,
	draft: boolean,
}

const Post = async ({ params: { slug } }: PostProps) => {
	const fn = `content/{% .Dir.dir %}/${slug.join("/")}.mdx`
	const source = await fs.promises.readFile(fn, 'utf8')
	const { content, frontmatter: meta } = await compileMDX<Post>({
		source,
		options: { parseFrontmatter: true },
		components: {},
	})	

  return (
    <article>
      <header className="mt-14 mb-8 text-center">
        <h1>{meta.title}</h1>
				{meta.weight} / {meta.draft}
      </header>

      <section>{content}</section>
    </article>
  );
};

export default Post;
