package flows

dev: {
	@flow(dev)

	first: {
		@task(os.Exec)
		cmd: ["hof", "gen", "@supacode"]
		exitcode: _
	}
	hof: {
		dep: first

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
		dep: first
		@task(os.Exec)
		cmd: ["npm", "run", "dev"]
		exitcode: _
	}
}

// TODO, take some args or tags and lookup what to do for start/stop by args(s)
// hof flow @start ... should support multiple things
postgres: {
	start: {
		@flow(pg/start)

		docker: {
			@task(os.Exec)
			cmd: ["docker", "compose", "up", "postgres", "-d"]
		}
	}
	stop: {
		@flow(pg/stop)

		docker: {
			@task(os.Exec)
			cmd: ["docker", "compose", "stop", "postgres"]
		}
	}

}

prisma: {
	sync: {
		@flow(prisma/sync)

		gen: {
			@task(os.Exec)
			cmd: ["npm", "exec", "prisma", "generate"]
			stdin: true
		}

		mig: {
			@task(os.Exec)
			cmd: ["npm", "exec", "prisma", "migrate", "dev"]
			stdin: true
		}
	}
}

supabase: {
	start: {
		@flow(supabase/start)

		supabaseStop: {
			@task(os.Exec)
			cmd: ["npm", "exec", "supabase", "start"]
		}
	}
	stop: {
		@flow(supabase/stop)

		supabaseStop: {
			@task(os.Exec)
			cmd: ["npm", "exec", "supabase", "stop"]
		}
	}
}

newPage: {
	// @flow(new/page)
}
