create table
  pgsodium.key (
    id uuid not null default gen_random_uuid (),
    status pgsodium.key_status null default 'valid'::pgsodium.key_status,
    created timestamp with time zone not null default current_timestamp,
    expires timestamp with time zone null,
    key_type pgsodium.key_type null,
    key_id bigint null default nextval('pgsodium.key_key_id_seq'::regclass),
    key_context bytea null default '\x7067736f6469756d'::bytea,
    name text null,
    associated_data text null default 'associated'::text,
    raw_key bytea null,
    raw_key_nonce bytea null,
    parent_key uuid null,
    comment text null,
    user_data text null,
    constraint key_pkey primary key (id),
    constraint pgsodium_key_unique_name unique (name),
    constraint key_parent_key_fkey foreign key (parent_key) references pgsodium.key (id),
    constraint key_key_context_check check ((length(key_context) = 8)),
    constraint pgsodium_raw check (
      case
        when (raw_key is not null) then (
          (key_id is null)
          and (key_context is null)
          and (parent_key is not null)
        )
        else (
          (key_id is not null)
          and (key_context is not null)
          and (parent_key is null)
        )
      end
    )
  ) tablespace pg_default;

create index if not exists key_status_idx on pgsodium.key using btree (status)
where
  (
    status = any (
      array[
        'valid'::pgsodium.key_status,
        'default'::pgsodium.key_status
      ]
    )
  ) tablespace pg_default;

create unique index key_status_idx1 on pgsodium.key using btree (status)
where
  (status = 'default'::pgsodium.key_status) tablespace pg_default;

create unique index key_key_id_key_context_key_type_idx on pgsodium.key using btree (key_id, key_context, key_type) tablespace pg_default;

create trigger key_encrypt_secret_trigger_raw_key before insert
or
update of raw_key on pgsodium.key for each row
execute function pgsodium.key_encrypt_secret_raw_key ();
