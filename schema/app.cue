package schema

import "github.com/hofstadter-io/hof/schema/dm/sql"

Datamodel: sql.Datamodel & {
	@datamodel()
}

App: {
	Name: string
	...
}
