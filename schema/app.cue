package schema

import "github.com/hofstadter-io/hof/schema/dm/sql"

Datamodel: sql.Datamodel & {
	@datamodel()
}

App: {
	name: string
	...

	auth: {
		enabled: bool | *true
		oauth: [p=string]: OAuth & {
			id:       p
			provider: string | *p
		}
	}

	database: {
		enabled: bool | *true
	}

	content: {
		mdxFallback: bool | *false
		mdxCodehike: bool | *true
	}

	search: {
		enabled: bool | *true
	}

	mdxPages: {
		[d=string]: {
			name: string | *d
			dir:  string | *d
			path: string | *"/\(d)"
		}
	}

	mdxDirs: {
		[d=string]: {
			name: string | *d
			dir:  string | *d
			path: string | *"/\(d)"
		}
	}
}

OAuth: {
	id:       string
	provider: string
	scopes?:  string
	url?:     string

	// used for user authorization
	authReq: bool | *true

	// used to request permissions
	permReq: bool | *false
}
