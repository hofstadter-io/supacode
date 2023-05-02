-- one record

create view
  extensions.pg_stat_statements_info as
select
  pg_stat_statements_info.dealloc,
  pg_stat_statements_info.stats_reset
from
  pg_stat_statements_info () pg_stat_statements_info (dealloc, stats_reset);
