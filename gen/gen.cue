package gen

import (
	"github.com/hofstadter-io/hof/schema/gen"

	"github.com/hofstadter-io/supacode/gen/app"
	"github.com/hofstadter-io/supacode/gen/sql"
	"github.com/hofstadter-io/supacode/schema"
)

// Generator definition
Generator: gen.Generator & {
	ModuleName: "github.com/hofstadter-io/supacode"

	// User inputs to this generator
	// -----------------------------

	Datamodel: schema.Datamodel
	App:       schema.App

	// Base output directory, defaults to current
	Outdir: string | *"./"

	gen.TemplateSubdirs & {#subdir: "common"}
	// gen.#EmptyTemplates
	// Statics: []

	Generators: {
		"app": app.Generator & {
			"Datamodel": Datamodel
			"App":       App
		}
		"sql": sql.Generator & {
			"Datamodel": Datamodel
		}
	}
}
