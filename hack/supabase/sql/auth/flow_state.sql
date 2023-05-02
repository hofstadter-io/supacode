create table
  auth.flow_state (
    id uuid not null,
    user_id uuid null,
    auth_code text not null,
    code_challenge_method auth.code_challenge_method not null,
    code_challenge text not null,
    provider_type text not null,
    provider_access_token text null,
    provider_refresh_token text null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    authentication_method text not null,
    constraint flow_state_pkey primary key (id)
  ) tablespace pg_default;

create index if not exists idx_auth_code on auth.flow_state using btree (auth_code) tablespace pg_default;

create index if not exists idx_user_id_auth_method on auth.flow_state using btree (user_id, authentication_method) tablespace pg_default;
