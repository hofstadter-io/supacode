create table
  auth.saml_relay_states (
    id uuid not null,
    sso_provider_id uuid not null,
    request_id text not null,
    for_email text null,
    redirect_to text null,
    from_ip_address inet null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    constraint saml_relay_states_pkey primary key (id),
    constraint saml_relay_states_sso_provider_id_fkey foreign key (sso_provider_id) references auth.sso_providers (id) on delete cascade,
    constraint request_id not empty check ((char_length(request_id) > 0))
  ) tablespace pg_default;

create index if not exists saml_relay_states_sso_provider_id_idx on auth.saml_relay_states using btree (sso_provider_id) tablespace pg_default;

create index if not exists saml_relay_states_for_email_idx on auth.saml_relay_states using btree (for_email) tablespace pg_default;
