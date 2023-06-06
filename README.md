# supacode

### develop full-stack apps, the hof way

1. let hof manage the data model and repeatitive code
2. focus on the core features of your app

### You get an updatable, high quality code base to develop with.

1. start from a core data model and configuration
2. hof generate the majority of boilerplate, helpers, and extras
3. add or customize the logic, interfaces, and integrations
4. evolve the data model, the generated and custom code are automatically updated

As you develop your data model and application,
hof will help you automate the code changes,
ensuring consistency and maintaining standards.
You custom code can live within or next to
the generated application code.

__Edit any part, hof will make sure the right thing happens.__

### Built on:

- [Supabase](https://supabase.com)
- [React](https://react.dev/)
- [NextJS](https://nextjs.org/docs)
- [RadixUI](https://www.radix-ui.com/)
- [TailwindCSS](https://tailwindcss.com/docs/utility-first)

Various self & saas providers are possible for core application features
like auth, user management, chat, email, billing, deployment, and devops.


## Create a new app

Ensure you have the [hof cli installed](https://docs.hofstadter.io/getting-started/install/)

```
# create a new application from supacode
hof create github.com/hofstadter-io/supacode myapp

# navigate to the new application
cd myapp

# run the first time setup
hof flow @first
```

This will walk you through the process of creating a new supacode application.

[insert screencast]

You should now have a running starter application

## Development, the hof way

Now that you have your base application, you can
start developing your core features.

### start dev mode

```
hof flow @dev
```

Running this command starts up development mode.

- supabase containers are started
- application hot-reload mode is started
- hof code gen hot-reload mode is started

Now, as you edit files in any part of the stack,
the appropriate recompilation and live update will happen.
There is a hot-reload stack, such that:

1. [hof -> code]: Changes to the data model trigger hof code regen
2. [code -> app]: Changes to the code trigger app recompilation


### work on app

When developing with hof,
you work from both sides of the code generation.

__(before)__ by modifying the data model and supacode app configuration.

[code gen here]

__(after)__ by filling in code details or writing any custom code.

hof will ensure when you change either, the correct steps are taken
to update your application code, the running server, and connected clients.

#### 1. edit the data model

Your core data model is the source-of-truth
definition for the entities, objects, and relations
in your application.
As you update this, hof will regenerate the code,
the application will see updates and hot-reload itself.


#### 2. edit the application code

You can edit and modify hof's generated code and other outputs directly.
When you again edit the data model, your changes will be automatically
merged with the new generated code.

You can also add any extra files you like, use them to

- make use of the helpers and libraries generated from your datamodel
- use custom libraries in the generated code implementation

