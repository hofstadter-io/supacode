package chat

import (
	"encoding/json"

	"github.com/hofstadter-io/hof/schema/chat"

	// "github.com/hofstadter-io/supacode/chat/prompts"
)

dm: chat.Chat & {
	Name:        "dm"
	Description: "Talk to a hof to create and modify your application data model"
	Model:       string | *"gpt-3.5-turbo" @tag(model)

	Response: _

	bodyOutfile: string @tag(body)
	if bodyOutfile != _|_ {
		PostExec: {
			@flow()
			debug: {
				@task(os.WriteFile)
				filename: "body.json"
				contents: json.Indent(json.Marshal(Response), "", "  ")
				mode:     0o666
			}
		}
	}
}
