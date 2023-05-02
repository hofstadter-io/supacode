create view
  vault.decrypted_secrets as
select
  secrets.id,
  secrets.name,
  secrets.description,
  secrets.secret,
  case
    when secrets.secret is null then null::text
    else case
      when secrets.key_id is null then null::text
      else convert_from(
        pgsodium.crypto_aead_det_decrypt (
          decode(secrets.secret, 'base64'::text),
          convert_to(
            (
              (secrets.id::text || secrets.description) || secrets.created_at::text
            ) || secrets.updated_at::text,
            'utf8'::name
          ),
          secrets.key_id,
          secrets.nonce
        ),
        'utf8'::name
      )
    end
  end as decrypted_secret,
  secrets.key_id,
  secrets.nonce,
  secrets.created_at,
  secrets.updated_at
from
  vault.secrets;
