create table
  auth.sessions (
    id uuid not null,
    user_id uuid not null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    factor_id uuid null,
    aal auth.aal_level null,
    not_after timestamp with time zone null,
    constraint sessions_pkey primary key (id),
    constraint sessions_user_id_fkey foreign key (user_id) references auth.users (id) on delete cascade
  ) tablespace pg_default;

create index if not exists user_id_created_at_idx on auth.sessions using btree (user_id, created_at) tablespace pg_default;

create index if not exists sessions_user_id_idx on auth.sessions using btree (user_id) tablespace pg_default;
