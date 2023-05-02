-- only table in this dir with records

create table
  auth.schema_migrations (
    version character varying(255) not null,
    constraint schema_migrations_pkey primary key (version)
  ) tablespace pg_default;
