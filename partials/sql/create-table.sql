{{ $DM := .DM }}
{{ $M := .Model }}
CREATE TABLE {{ snake $M.Plural }} (
{{ range $K, $F := $M.Fields }}
{{ if ne $K "$hof" }}
{{ template "create-field.sql" (dict "Field" $F "Model" $M "DM" $DM) }}
{{ end }}
{{ end }}
);
