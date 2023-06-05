package Mute

msg_20230502034755: "add models for follow, mute, and block"
ver_20230502034755: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "mute"
			name: "Mute"
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
	Name:   "Mute"
	Plural: "Mutes"

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
		muted_by_id: {
			Name:     "muted_by_id"
			Plural:   "muted_by_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		muted_id: {
			Name:     "muted_id"
			Plural:   "muted_ids"
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
		muted_by: {
			Name:     "muted_by"
			Plural:   "muted_bys"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "muted_by"
				Type:  "belongs-to"
				Other: "User"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		muted: {
			Name:     "muted"
			Plural:   "muteds"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "muted"
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
