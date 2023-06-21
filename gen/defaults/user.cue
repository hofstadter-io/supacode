package gen

import (
	"github.com/hofstadter-io/hof/schema/dm/fields"
	"github.com/hofstadter-io/hof/schema/dm/sql"
)

Default: {
	User: {
		Fields: {
			sql.CommonFields

			email:    fields.Email & sql.Varchar
			password: fields.Password & sql.Varchar
			active:   fields.Bool
			verified: fields.Bool

			// this is the new field
			username: sql.Varchar
		}
	}
}
