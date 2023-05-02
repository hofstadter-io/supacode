create view
  pgsodium.decrypted_key as
select
  key.id,
  key.status,
  key.created,
  key.expires,
  key.key_type,
  key.key_id,
  key.key_context,
  key.name,
  key.associated_data,
  key.raw_key,
  case
    when key.raw_key is null then null::bytea
    else case
      when key.parent_key is null then null::bytea
      else pgsodium.crypto_aead_det_decrypt (
        key.raw_key,
        convert_to(key.id::text || key.associated_data, 'utf8'::name),
        key.parent_key,
        key.raw_key_nonce
      )
    end
  end as decrypted_raw_key,
  key.raw_key_nonce,
  key.parent_key,
  key.comment
from
  pgsodium.key;
