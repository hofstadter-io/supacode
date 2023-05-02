create table
  auth.instances (
    id uuid not null,
    uuid uuid null,
    raw_base_config text null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    constraint instances_pkey primary key (id)
  ) tablespace pg_default;
