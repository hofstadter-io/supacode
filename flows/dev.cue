package flows

dev: {
	@flow(dev)

	//supabaseStart: {
	//  @task(os.Exec)
	//  cmd: ["npm", "exec", "supabase", "start"]
	//  exitcode: _
	//}

	hof: {
		// dep: supabaseStart

		@task(os.Watch)
		globs: [
			"*.cue",
			"cue.mod/pkg/github.com/hofstadter-io/supacode/**/*.*",
		]
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
		// dep: supabaseStart
		@task(os.Exec)
		cmd: ["npm", "run", "dev"]
		exitcode: _
	}

}

stop: {
	@flow(stop)

	supabaseStop: {
		@task(os.Exec)
		cmd: ["npm", "exec", "supabase", "stop"]
	}
}

newPage: {
	@flow(new/page)
}
