import fs from 'fs';
import { join } from 'path';

export type Post = {
  slug: string;
  title: string;
  date: string;
  link: string;
	weight: number;
	draft: boolean;
};

const basedir = join(process.cwd(), "content");

const getAllSlugs = (content: string, subdir: string = "", slugs = []) => {

	const bd = join(basedir, content, subdir)
  var files = fs.readdirSync(bd)

	files.forEach(file => {
		if( fs.statSync(join(bd, file)).isDirectory()) {
			var s = getAllSlugs(content, join(subdir, file))
			slugs = slugs.concat(s)
		} else {
			var fn = file.replace(/\.mdx$/, '')
			fn = join(subdir, fn)
			slugs.push(fn)
		}
	})

  return slugs;
};

const getPageBySlug = async (content: string, slug: string): Promise<Post> => {
	if (slug === "") {
		slug = "index"
	}

	// hacky...
	// need to better detemine with fs.statSync or something
	// or perhaps pass the slug with index, and then remove here? (rather than above)
	// since we only export the getAllPages func, we ought to be able to do cleanup here
	const pageModule = await import(`@/content/${content}/${slug}.mdx`);

  return {
    slug,
		draft: pageModule.meta.draft,
    title: pageModule.meta.title,
    date: pageModule.meta.date,
    weight: pageModule.meta.weight,
    link: `/${content}/${slug}`,
  };
};

export const getAllPages = async (content: string) => {
  const slugs = getAllSlugs(content);
	console.log("slugs:", slugs)

  var pages = await Promise.all(slugs.map((slug) => getPageBySlug(content, slug)));

	// if not dev | draft mode
	pages = pages.filter(page => page.draft)

  // Sort pages by date in descending order
  pages.sort((page1, page2) => (page1.weight > page2.weight ? -1 : 1));

  return pages;
};

