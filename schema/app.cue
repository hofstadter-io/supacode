package schema

import "github.com/hofstadter-io/hof/schema/dm/sql"

Datamodel: sql.Datamodel & {
	@datamodel()
}

App: {
	Name: string
	...

	MDXPages: {
		[d=string]: {
			name: string | *d
			dir:  string | *d
			path: string | *"/\(d)"
		}
	}

	MDXDirs: {
		[d=string]: {
			name: string | *d
			dir:  string | *d
			path: string | *"/\(d)"
		}
	}
}
