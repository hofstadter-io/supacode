package Block

msg_20230502034755: "add models for follow, mute, and block"
ver_20230502034755: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "block"
			name: "Block"
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
	Name:   "Block"
	Plural: "Blocks"

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
		blocked_by_id: {
			Name:     "blocked_by_id"
			Plural:   "blocked_by_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		blocked_id: {
			Name:     "blocked_id"
			Plural:   "blocked_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		deleted_at: {
			Name:   "deleted_at"
			Plural: "deleted_ats"
			Type:   "datetime"
		}
		blocked_by: {
			Name:     "blocked_by"
			Plural:   "blocked_bys"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "blocked_by"
				Type:  "belongs-to"
				Other: "User"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		blocked: {
			Name:     "blocked"
			Plural:   "blockeds"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "blocked"
				Type:  "belongs-to"
				Other: "User"
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
