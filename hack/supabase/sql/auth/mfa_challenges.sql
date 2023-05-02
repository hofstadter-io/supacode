create table
  auth.mfa_challenges (
    id uuid not null,
    factor_id uuid not null,
    created_at timestamp with time zone not null,
    verified_at timestamp with time zone null,
    ip_address inet not null,
    constraint mfa_challenges_pkey primary key (id),
    constraint mfa_challenges_auth_factor_id_fkey foreign key (factor_id) references auth.mfa_factors (id) on delete cascade
  ) tablespace pg_default;
