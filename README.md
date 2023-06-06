# supacode

### develop full-stack apps, the hof way

1. let hof manage the data model and repeatitive code
2. focus on the core features of your app

### You get an updatable, high quality code base to develop with.

1. define a core data model and configuration
2. generate the majority of boilerplate, helpers, and extras
3. extend or customize the logic, interfaces, and integrations
4. evolve the data model and code, updates are automated

As you develop your data model and application,
edit any part and hof will make sure the right thing happens.

[insert screencast]

### Built on:

- [Supabase](https://supabase.com)
- [React](https://react.dev/)
- [NextJS](https://nextjs.org/docs)
- [RadixUI](https://www.radix-ui.com/)
- [TailwindCSS](https://tailwindcss.com/docs/utility-first)

Various self & saas providers are possible for core application features
like auth, user management, chat, email, billing, deployment, and devops.

### Tools you'll need

- [hof](https://docs.hofstadter.io/getting-started/install/)
- [node](https://nodejs.org)
- [docker](https://docs.docker.com)
- [supabase](https://supabase.com/docs/guides/getting-started/local-development) [cli](https://supabase.com/docs/guides/cli)

Supabase will be installed with your project development dependencies


## Create a new app


```sh
# create a new directory
mkdir myapp && cd myapp

# create a new application from supacode
hof create github.com/hofstadter-io/supacode myapp
```

This will walk you through the process of creating a new supacode application.
When done, you should have a running application.

## Development, the hof way

Now that you have your base application, you can
start developing your core features.

### start dev mode

```sh
hof flow @dev
```

Running this command starts up development mode.

- supabase containers are started
- application hot-reload mode is started
- hof code gen hot-reload mode is started

Now, as you edit files in any part of the stack,
the appropriate recompilation and live update will happen.
There is a hot-reload stack, such that:

1. __hof -> code__: Changes to the data model trigger hof code regen
2. __code -> app__: Changes to the code trigger app recompilation


### work on app

When developing with hof,
you work from both sides of the code generation.

```
(inputs)    edit the data model and supacode configuration
  vvv
[codegen]   hof (hot reload)
  vvv
(output)    edit code details or writing any custom code
  vvv
[running]   npx (hot reload)
```

When you change either the code gen inputs or outputs,
hof will ensure the correct steps are taken to
update your application code, the running server, and connected clients.

#### 1. edit the data model

Your core data model is the source-of-truth
definition for the entities, objects, and relations
in your application.
As you update this, hof will regenerate the code,
the application will see updates and hot-reload itself.


#### 2. edit the application code

You can modify and extend the generated code.
When you again edit the data model, your changes will be automatically
merged with the new generated code.
You can also add any extra files you like.

You can use generated and custom code in both directions:

- __gen -> custom__: use helpers and libraries for your datamodel
- __custom -> gen__: use custom code to fill in the implementation

__supacode__ has many good defaults for CRUD operations based on your data model.
As you update, these handlers will update along with the various integrations,
like auth and other features, which you configure as part of __supacode__'s inputs


