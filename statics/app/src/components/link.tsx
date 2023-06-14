import Link from 'next/link';

export default function link(props: any) { 
	return ( <Link {...props} prefetch={false} /> )
}
