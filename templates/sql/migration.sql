{{ if .Snapshot }}
{{ template "sql/snapshot-table.sql" (dict "DM" .DM "Snapshot" .Snapshot) }}
{{ else }}
{{ template "sql/latest-table.sql" (dict "DM" .DM) }}
{{ end }}

