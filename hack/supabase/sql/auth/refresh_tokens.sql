create table
  auth.refresh_tokens (
    instance_id uuid null,
    id bigint not null default nextval('auth.refresh_tokens_id_seq'::regclass),
    token character varying(255) null,
    user_id character varying(255) null,
    revoked boolean null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    parent character varying(255) null,
    session_id uuid null,
    constraint refresh_tokens_pkey primary key (id),
    constraint refresh_tokens_token_unique unique (token),
    constraint refresh_tokens_session_id_fkey foreign key (session_id) references auth.sessions (id) on delete cascade
  ) tablespace pg_default;

create index if not exists refresh_tokens_instance_id_idx on auth.refresh_tokens using btree (instance_id) tablespace pg_default;

create index if not exists refresh_tokens_instance_id_user_id_idx on auth.refresh_tokens using btree (instance_id, user_id) tablespace pg_default;

create index if not exists refresh_tokens_parent_idx on auth.refresh_tokens using btree (parent) tablespace pg_default;

create index if not exists refresh_tokens_session_id_revoked_idx on auth.refresh_tokens using btree (session_id, revoked) tablespace pg_default;
