create table
  auth.identities (
    id text not null,
    user_id uuid not null,
    identity_data jsonb not null,
    provider text not null,
    last_sign_in_at timestamp with time zone null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    email text null,
    constraint identities_pkey primary key (provider, id),
    constraint identities_user_id_fkey foreign key (user_id) references auth.users (id) on delete cascade
  ) tablespace pg_default;

create index if not exists identities_user_id_idx on auth.identities using btree (user_id) tablespace pg_default;

create index if not exists identities_email_idx on auth.identities using btree (email text_pattern_ops) tablespace pg_default;
