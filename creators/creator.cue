package creators

import (
	"github.com/hofstadter-io/hof/schema/common"
	"github.com/hofstadter-io/hof/schema/gen"
)

Creator: gen.Generator & {
	@gen(creator)

	ModuleName: ""

	Create: {
		Message: {
			let name = Input.name
			Before: "Creating a new Supacode project"
			After:  """
				Your new app "\(name)" is ready, run 'make first' to get started!
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
			repo: string
		}

		Prompt: [{
			Name:       "name"
			Type:       "input"
			Prompt:     "What is your CLI named"
			Required:   true
			Validation: common.NameLabel
		}, {
			Name:       "repo"
			Type:       "input"
			Prompt:     "Git repository"
			Default:    "github.com/user/\(Input.name)"
			Validation: common.NameLabel
		}]

		PostExec: {
			@flow(post-exec)

			init: {
				@task(os.Exec)
				_script: """
					pwd && ls
					hof mod tidy
					hof flow @first
					"""
				cmd: ["bash", "-c", _script]
			}
		}
	}

	In: {
		Create.Input
		...
	}

	Out: [...gen.File] & [{
		Filepath: "cue.mod/module.cue"
		Val: {
			module: In.repo
			"cue":  "0.5.0"

			require: {
				"github.com/hofstadter-io/hof":      "v0.6.8-rc.4"
				"github.com/hofstadter-io/supacode": "v0.0.2"
			}
		}
	},

		for file in [
					// "debug.yaml",
					"gen.cue",
					"Readme.md",
					"Makefile",
		] {TemplatePath: file, Filepath: file},
	]

	Templates: [{
		Globs: [
			"./creators/templates/**",
		]
		TrimPrefix: "./creators/templates/"
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
