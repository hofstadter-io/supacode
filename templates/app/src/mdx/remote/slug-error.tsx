'use client'

import Link from '@/src/components/link'

export default function Error() {
	return (
		<div>
			<h1>Error: something went wrong :[</h1>
			<Link href="/">Go Home</Link>
		</div>
	)
}

//export default function Error() {
//  return (
//    <div>
//      <h1>Error: known issue</h1>
//      <p>
//        There is a known error with dynamic import MDX
//        in NextJS, see the following issue to learn more.

//        <Link href="https://github.com/vercel/next.js/issues/50471" target="_blank">github.com/vercel/next.js#50471</Link>
//      </p>
//    </div>
//  )
//}
