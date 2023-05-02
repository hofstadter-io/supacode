create table
  storage.buckets (
    id text not null,
    name text not null,
    owner uuid null,
    created_at timestamp with time zone null default now(),
    updated_at timestamp with time zone null default now(),
    public boolean null default false,
    avif_autodetection boolean null default false,
    file_size_limit bigint null,
    allowed_mime_types array null,
    constraint buckets_pkey primary key (id),
    constraint buckets_owner_fkey foreign key (owner) references auth.users (id)
  ) tablespace pg_default;

create unique index bname on storage.buckets using btree (name) tablespace pg_default;
