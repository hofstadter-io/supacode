create table
  auth.sso_providers (
    id uuid not null,
    resource_id text null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    constraint sso_providers_pkey primary key (id),
    constraint resource_id not empty check (
      (
        (resource_id = null::text)
        or (char_length(resource_id) > 0)
      )
    )
  ) tablespace pg_default;

create unique index sso_providers_resource_id_idx on auth.sso_providers using btree (lower(resource_id)) tablespace pg_default;
