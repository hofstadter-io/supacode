package Appeal

msg_20230502035055: "add models for bans and appeals"
ver_20230502035055: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "appeal"
			name: "Appeal"
		}

		// hof/datamodel
		datamodel: {
			// define the root of a datamodel
			root: false

			// instruct history to be tracked
			history: true

			// instruct ordrered version of the fields
			// to be injected as a peer value
			ordered: false

			// tell hof this is a node of interest for
			// the inspection commands (list,info)
			node: false

			// tell hof to track this as a raw CUE value
			// (partially implemented)
			cue: false
		}
	}
	History: []

	// for easy access
	Name:   "Appeal"
	Plural: "Appeals"

	// These are the fields of a model
	// they can map onto database columnts and form fields
	Fields: {
		id: {
			Name:     "id"
			Plural:   "ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			SQL: PrimaryKey:    true
			Validation: Format: "uuid"
		}
		created_at: {
			Name:   "created_at"
			Plural: "created_ats"
			Type:   "datetime"
		}
		updated_at: {
			Name:   "updated_at"
			Plural: "updated_ats"
			Type:   "datetime"
		}
		ban_id: {
			Name:     "ban_id"
			Plural:   "ban_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		reason: {
			Name:     "reason"
			Plural:   "reasons"
			Type:     "string"
			Length:   64
			Unique:   false
			Nullable: false
			SQL: Type:       "character varying(64)"
			Validation: Max: 64
		}
		status: {
			Name:     "status"
			Plural:   "statuss"
			Type:     "string"
			Length:   64
			Unique:   false
			Nullable: false
			SQL: Type:       "character varying(64)"
			Validation: Max: 64
		}
		deleted_at: {
			Name:   "deleted_at"
			Plural: "deleted_ats"
			Type:   "datetime"
		}
		ban: {
			Name:     "ban"
			Plural:   "bans"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "ban"
				Type:  "belongs-to"
				Other: "Ban"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		$hof: datamodel: {
			node:    true
			ordered: true
		}
	}

	// if we want Relations as a separate value
	// we can process the fields to extract them
}
