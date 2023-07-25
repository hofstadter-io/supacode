package demo

import (
	"github.com/hofstadter-io/supacode/gen"
	"github.com/hofstadter-io/supacode/schema"
)

// Generator definition
demo: gen.Generator & {
	@gen(demo)

	Name:        "demo"
	Outdir:      "./out"
	"Datamodel": Datamodel
	"App":       App
}

App: schema.App & {
	Name:   "demo"
	Module: "github.com/hofstadter-io/supacode-demo"
}

// The models we want in our database as tables & columns
// the actual contents for this demo come from ChatGPT
Datamodel: schema.Datamodel & {
	@datamodel()
	#hof: metadata: name: "Datamodel"
}
