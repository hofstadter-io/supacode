create table
  auth.audit_log_entries (
    instance_id uuid null,
    id uuid not null,
    payload json null,
    created_at timestamp with time zone null,
    ip_address character varying(64) not null default ''::character varying,
    constraint audit_log_entries_pkey primary key (id)
  ) tablespace pg_default;

create index if not exists audit_logs_instance_id_idx on auth.audit_log_entries using btree (instance_id) tablespace pg_default;
