import Link from '@/src/components/link'

import OAuth from '@/src/components/auth/oauth-button'

const providers = [
	{% range $name, $value := .App.auth.oauth %}{% if $value.authReq -%}
	"{% $name %}",
	{% end %}{% end %}
]

export default function Signin() {
	return (
		<div className="flex flex-col items-center">
			<h1>Sign in to {% .App.name %}</h1>

			{ providers.map(provider => (
				<OAuth provider={provider} className="m-2 p-2 px-8 border border-slate-800"/>
			))}

			<Link href="/signup" className="mt-8">Create a new account</Link>
		</div>
	)
}

