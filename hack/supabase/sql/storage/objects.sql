create table
  storage.objects (
    id uuid not null default uuid_generate_v4 (),
    bucket_id text null,
    name text null,
    owner uuid null,
    created_at timestamp with time zone null default now(),
    updated_at timestamp with time zone null default now(),
    last_accessed_at timestamp with time zone null default now(),
    metadata jsonb null,
    path_tokens array null,
    version text null,
    constraint objects_pkey primary key (id),
    constraint objects_bucketId_fkey foreign key (bucket_id) references storage.buckets (id),
    constraint objects_owner_fkey foreign key (owner) references auth.users (id)
  ) tablespace pg_default;

create unique index bucketid_objname on storage.objects using btree (bucket_id, name) tablespace pg_default;

create index if not exists name_prefix_search on storage.objects using btree (name text_pattern_ops) tablespace pg_default;

create trigger update_objects_updated_at before
update on storage.objects for each row
execute function storage.update_updated_at_column ();
