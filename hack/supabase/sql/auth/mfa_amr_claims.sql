create table
  auth.mfa_amr_claims (
    session_id uuid not null,
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null,
    authentication_method text not null,
    id uuid not null,
    constraint amr_id_pk primary key (id),
    constraint mfa_amr_claims_session_id_authentication_method_pkey unique (session_id, authentication_method),
    constraint mfa_amr_claims_session_id_fkey foreign key (session_id) references auth.sessions (id) on delete cascade
  ) tablespace pg_default;
