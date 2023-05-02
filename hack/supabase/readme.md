This directory contains the SQL in an initial Supabase app 
setup through the hosted platform.

Default Extensions: (IDs may not be accurate)

- Pg_graphql
- Pg_stat_statements
- Pg_crypto
- Pg_jwt
- Pg_sodium
- Pl/gsSQL
- uuid_ossp


Roles managed by Supabase:

- anon
- authenticated
- authenticator
- dashboard_user
- pgbouncer
- pgsodium_keyholder
- pgsodium_keyiduser
- pgsodium_keymaker
- service_role
- supabase_admin
- supabase_auth_admin
- supabase_replication_admin
- supabase_storage_admin

Other database roles:

- pgtle_admin
- postgres
- supabase_read_only_user

Triggers:

| Schema | Name | Table | Function | Events |
| ---    | ---  | ---   | ---      | ---    |
| pgsodium | key_encrypt_secret_trigger_raw_key | key | key_encrypt_secret_raw_key | (BEFORE INSERT) (BEFORE UPDATE)|
| vault | secrets_encrypt_secret_trigger_secret | secrets | secrets_encrypt_secret_secret |(BEFORE INSERT) (BEFORE UPDATE)|
| storage | update_objects_updated_at | objects | update_updated_at_column | (BEFORE UPDATE) |

