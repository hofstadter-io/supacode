package creators

import (
	"github.com/hofstadter-io/hof/schema/common"
	"github.com/hofstadter-io/hof/schema/gen"
)

Creator: gen.#Generator & {
	@gen(creator)

	Create: {
		Message: {
			let name = Input.name
			Before: "Creating a new Supacode project"
			After: """
				Your new app is ready, run 'make first' to get started!
				Be sure to check out the Readme too.
				"""
		}

		Args: [...string]
		if len(Args) > 0 {
			Input: name: Args[0]
		}
		if len(Args) > 1 {
			Input: repo: Args[1]
		}

		Input: {
			name: string
			repo: string | *"github.com/demo/\(name)"
		}

	}

	In: {
		Create.Input
		...
	}

	Out: [...gen.#File] & [
		for file in [
					// "debug.yaml",
					"cue.mod/module.cue",
					"gen.cue",
					"Makefile",
		] {TemplatePath: file, Filepath: file},
	]

	Templates: [{
		Globs: ["creators/templates/**/*"]
		TrimPrefix: "creators/templates/"
	}]
	Statics: []
	Partials: []

	EmbeddedTemplates: {
		"debug.yaml": {
			Content: """
				{{ yaml . }}
				"""
		}
	}
}
