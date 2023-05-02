create table
  auth.saml_providers (
    id uuid not null,
    sso_provider_id uuid not null,
    entity_id text not null,
    metadata_xml text not null,
    metadata_url text null,
    attribute_mapping jsonb null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    constraint saml_providers_pkey primary key (id),
    constraint saml_providers_entity_id_key unique (entity_id),
    constraint saml_providers_sso_provider_id_fkey foreign key (sso_provider_id) references auth.sso_providers (id) on delete cascade,
    constraint entity_id not empty check ((char_length(entity_id) > 0)),
    constraint metadata_url not empty check (
      (
        (metadata_url = null::text)
        or (char_length(metadata_url) > 0)
      )
    ),
    constraint metadata_xml not empty check ((char_length(metadata_xml) > 0))
  ) tablespace pg_default;

create index if not exists saml_providers_sso_provider_id_idx on auth.saml_providers using btree (sso_provider_id) tablespace pg_default;
