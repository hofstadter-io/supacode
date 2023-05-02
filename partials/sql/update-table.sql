{{ $DM := .DM }}
{{ $M := lookup .Name .DM.Models }}
{{ $fields := lookup "+" .Model.Fields }}
{{ if eq (gokind $fields) "map" }}
ALTER TABLE {{ snake $M.Plural }}
	{{ range $l, $f := $fields }}
	{{ $F := lookup $l $M.Fields }}
	{{ template "sql/add-field.sql" (dict "Field" $F "Model" $M "DM" .DM) }}
	{{ end }}
;
{{ end }}
