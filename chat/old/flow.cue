package chat

import (
	"encoding/json"

	"github.com/hofstadter-io/hofmod-supacode/chat/prompts"
)

_start: {
	Datamodel: {
		Name: "Interludes"
	}
}

chat: {
	@flow(chat/dm)
	MakeCall

	method: "POST"
	path:   "/v1/chat/completions"
	data: {
		model:    "gpt-3.5-turbo"
		messages: prompts.DM & {

		}
	}
}

MakeCall: {

	method: string | *"GET"
	path:   string
	data: {}
	etl: {
		resp: {}
		out: _ | *resp
	}

	steps: {

		env: {
			@task(os.Getenv)
			OPENAI_API_KEY: string
		}

		call: {
			@task(api.Call)
			req: {
				host: "https://api.openai.com"
				headers: {
					"Content-Type": "application/json"
					Authorization:  "Bearer \(env.OPENAI_API_KEY)"
				}

				"method": method
				"path":   path
				"data":   data
			}
			resp: {
				body: _
			}
		}

		filter: etl & {resp: call.resp.body}

		out: {
			@task(os.Stdout)
			text: json.Indent(json.Marshal(filter.out), "", "  ") + "\n"
		}
	}
}
