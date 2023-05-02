create table
  auth.mfa_factors (
    id uuid not null,
    user_id uuid not null,
    friendly_name text null,
    factor_type auth.factor_type not null,
    status auth.factor_status not null,
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null,
    secret text null,
    constraint mfa_factors_pkey primary key (id),
    constraint mfa_factors_user_id_fkey foreign key (user_id) references auth.users (id) on delete cascade
  ) tablespace pg_default;

create unique index mfa_factors_user_friendly_name_unique on auth.mfa_factors using btree (friendly_name, user_id)
where
  (
    trim(
      both
      from
        friendly_name
    ) <> ''::text
  ) tablespace pg_default;

create index if not exists factor_id_created_at_idx on auth.mfa_factors using btree (user_id, created_at) tablespace pg_default;
