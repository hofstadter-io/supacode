package flows

dev: {
	@flow(dev)

	hof: {
		@task(os.Watch)
		globs: ["*.cue"]
		handler: {
			event?: _
			compile: {
				@task(os.Exec)
				cmd: ["hof", "gen", "@supacode"]
				exitcode: _
			}
			now: {
				dep: compile.exitcode
				n:   string @task(gen.Now)
				s:   "\(n) (\(dep))"
			}
			alert: {
				@task(os.Stdout)
				dep:  now.s
				text: "hof regen: \(now.s)\n"
			}
		}
	}

	npm: {
		@task(os.Exec)
		cmd: ["npm", "run", "dev"]
	}
}
