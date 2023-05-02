CREATE TABLE {{ snake .Model.Name }} (
{{ range $K, $F := .Model.Fields }}
{{ if ne $K "$hof" }}
{{ template "sql/create-field.sql" (dict "Field" $F "DM" .DM) }},
{{ end }}
{{ end }}
);
