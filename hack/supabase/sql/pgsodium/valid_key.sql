create view
  pgsodium.valid_key as
select
  key.id,
  key.name,
  key.status,
  key.key_type,
  key.key_id,
  key.key_context,
  key.created,
  key.expires,
  key.associated_data
from
  pgsodium.key
where
  (
    key.status = any (
      array[
        'valid'::pgsodium.key_status,
        'default'::pgsodium.key_status
      ]
    )
  )
  and case
    when key.expires is null then true
    else key.expires > now()
  end;
