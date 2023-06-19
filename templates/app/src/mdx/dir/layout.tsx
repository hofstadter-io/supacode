export default function Layout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
	<div className="p-8 prose dark:prose-invert">
		{children}
	</div>
  );
}

