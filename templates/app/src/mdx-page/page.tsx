'use client'

import Content from './content.mdx';

export default function Page(props: any) {
  return (
    <div className="w-50">
      <Content { ...props } />
    </div>
  )
}
