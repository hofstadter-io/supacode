-- almost 3000 records, only appears to have first two columns set
create view
  pgsodium.mask_columns as
select
  a.attname,
  a.attrelid,
  m.key_id,
  m.key_id_column,
  m.associated_columns,
  m.nonce_column,
  m.format_type
from
  pg_attribute a
  left join pgsodium.masking_rule m on m.attrelid = a.attrelid
  and m.attname = a.attname
where
  a.attnum > 0
  and not a.attisdropped
order by
  a.attnum;
