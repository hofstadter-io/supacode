import Tree from "@/src/components/content-tree/component";
import Nodes from "./tree.json";

export default function Layout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
		<div className="flex flex-row min-h-full w-full">
			<Tree nodes={Nodes} className="menu menu-lg max-w-xs w-full min-h-full border-r border-slate-800 m-0"/>
			<div className="p-8 flex-1 max-w-2xl prose dark:prose-invert">
				{children}
			</div>
		</div>
  );
}

