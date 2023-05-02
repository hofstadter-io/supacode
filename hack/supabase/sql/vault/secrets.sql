create table
  vault.secrets (
    id uuid not null default gen_random_uuid (),
    name text null,
    description text not null default ''::text,
    secret text not null,
    key_id uuid null default (pgsodium.create_key ()).id,
    nonce bytea null default pgsodium.crypto_aead_det_noncegen (),
    created_at timestamp with time zone not null default current_timestamp,
    updated_at timestamp with time zone not null default current_timestamp,
    constraint secrets_pkey primary key (id),
    constraint secrets_key_id_fkey foreign key (key_id) references pgsodium.key (id)
  ) tablespace pg_default;

create unique index secrets_name_idx on vault.secrets using btree (name)
where
  (name is not null) tablespace pg_default;

create trigger secrets_encrypt_secret_trigger_secret before insert
or
update of secret on vault.secrets for each row
execute function vault.secrets_encrypt_secret_secret ();
