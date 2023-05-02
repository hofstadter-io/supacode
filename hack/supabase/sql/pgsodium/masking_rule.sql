-- has 2 data items (pgsodium & vault)

create view
  pgsodium.masking_rule as
with
  const as (
    select
      'encrypt +with +key +id +([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})'::text as pattern_key_id,
      'encrypt +with +key +column +([\w\"\-$]+)'::text as pattern_key_id_column,
      '(?<=associated) +\(([\w\"\-$, ]+)\)'::text as pattern_associated_columns,
      '(?<=nonce) +([\w\"\-$]+)'::text as pattern_nonce_column,
      '(?<=decrypt with view) +([\w\"\-$]+\.[\w\"\-$]+)'::text as pattern_view_name
  ),
  rules_from_seclabels as (
    select
      sl.objoid as attrelid,
      sl.objsubid as attnum,
      c.relnamespace::regnamespace as relnamespace,
      c.relname,
      a.attname,
      format_type(a.atttypid, a.atttypmod) as format_type,
      sl.label as col_description,
      (
        regexp_match(sl.label, k.pattern_key_id_column, 'i'::text)
      ) [1] as key_id_column,
      (
        regexp_match(sl.label, k.pattern_key_id, 'i'::text)
      ) [1] as key_id,
      (
        regexp_match(sl.label, k.pattern_associated_columns, 'i'::text)
      ) [1] as associated_columns,
      (
        regexp_match(sl.label, k.pattern_nonce_column, 'i'::text)
      ) [1] as nonce_column,
      coalesce(
        (
          regexp_match(sl2.label, k.pattern_view_name, 'i'::text)
        ) [1],
        (c.relnamespace::regnamespace || '.'::text) || quote_ident('decrypted_'::text || c.relname::text)
      ) as view_name,
      100 as priority
    from
      const k,
      pg_seclabel sl
      join pg_class c on sl.classoid = c.tableoid
      and sl.objoid = c.oid
      join pg_attribute a on a.attrelid = c.oid
      and sl.objsubid = a.attnum
      left join pg_seclabel sl2 on sl2.objoid = c.oid
      and sl2.objsubid = 0
    where
      a.attnum > 0
      and c.relnamespace::regnamespace::oid <> 'pg_catalog'::regnamespace::oid
      and not a.attisdropped
      and sl.label ~~* 'ENCRYPT%'::text
      and sl.provider = 'pgsodium'::text
  )
select distinct
  on (
    rules_from_seclabels.attrelid,
    rules_from_seclabels.attnum
  ) rules_from_seclabels.attrelid,
  rules_from_seclabels.attnum,
  rules_from_seclabels.relnamespace,
  rules_from_seclabels.relname,
  rules_from_seclabels.attname,
  rules_from_seclabels.format_type,
  rules_from_seclabels.col_description,
  rules_from_seclabels.key_id_column,
  rules_from_seclabels.key_id,
  rules_from_seclabels.associated_columns,
  rules_from_seclabels.nonce_column,
  rules_from_seclabels.view_name,
  rules_from_seclabels.priority
from
  rules_from_seclabels
order by
  rules_from_seclabels.attrelid,
  rules_from_seclabels.attnum,
  rules_from_seclabels.priority desc;
