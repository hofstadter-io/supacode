{{ snake .Field.Name }} {{ if .Field.sqlType -}}
{{ .Field.sqlType }}{{ else }}{{ .Field.Type -}}{{end}}{{ with .Field.Default }} DEFAULT {{.}}{{ end }},
{{ if .Field.Relation }}
{{ end }}
{{ if .Field.SQL.PrimaryKey }}constraint {{ snake .Model.Plural }}_pkey primary key ({{ snake .Field.Name }}),{{ end }}
