ADD {{ snake .Field.Name }} {{ if .Field.sqlType -}}
{{ .Field.SQL.Type }}{{ else }}{{ .Field.Type -}}{{end}}{{ with .Field.Default }} DEFAULT {{.}}{{ end }},
{{ if .Field.Relation }}
{{ end }}
{{ if .Field.SQL.PrimaryKey }}constraint {{ .Model.Plural }}_pkey primary key ({{ snake .Field.Name }}),{{ end }}
