create table
  auth.sso_domains (
    id uuid not null,
    sso_provider_id uuid not null,
    domain text not null,
    created_at timestamp with time zone null,
    updated_at timestamp with time zone null,
    constraint sso_domains_pkey primary key (id),
    constraint sso_domains_sso_provider_id_fkey foreign key (sso_provider_id) references auth.sso_providers (id) on delete cascade,
    constraint domain not empty check ((char_length(domain) > 0))
  ) tablespace pg_default;

create index if not exists sso_domains_sso_provider_id_idx on auth.sso_domains using btree (sso_provider_id) tablespace pg_default;

create unique index sso_domains_domain_idx on auth.sso_domains using btree (lower(domain)) tablespace pg_default;
