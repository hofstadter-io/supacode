-- this one has data

create table
  storage.migrations (
    id integer not null,
    name character varying(100) not null,
    hash character varying(40) not null,
    executed_at timestamp without time zone null default current_timestamp,
    constraint migrations_pkey primary key (id),
    constraint migrations_name_key unique (name)
  ) tablespace pg_default;
