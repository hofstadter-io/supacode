package {{ .name }}

import (
	"github.com/hofstadter-io/hof/schema/dm/fields"

	"github.com/hofstadter-io/supacode/gen"
	"github.com/hofstadter-io/supacode/schema"
)

// Generator definition
Generator: gen.Generator & {
	Name: "{{ .name }}"
	Outdir:      "out"
	"Datamodel": Datamodel
	"App": App
}

App: schema.Application & {
	Name:    "{{ .name }}"
	Module:  "{{ .repo }}"
}

// The models we want in our database as tables & columns
Datamodel: schema.Datamodel & {
	$hof: metadata: name: "Datamodel"
	// these are the models for the application
	// they map onto database tables
	Models: {
		// Actual Models
		User: {
			Fields: {
				sql.CommonFields

				email:    fields.Email & sql.Varchar
				password: fields.Password & sql.Varchar
				active:   fields.Bool
				verified: fields.Bool

				// this is the new field
				username: sql.Varchar

				// relation fields
				Profile: fields.UUID
				Profile: Relation: {
					Name:  "Profile"
					Type:  "has-one"
					Other: "Models.UserProfile"
				}
				Posts: fields.UUID
				Posts: Relation: {
					Name:  "Posts"
					Type:  "has-many"
					Other: "Models.Post"
				}
			}
		}
	}
}
