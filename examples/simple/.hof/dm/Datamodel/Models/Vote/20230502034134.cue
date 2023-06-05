package Vote

msg_20230502034134: "add hashtags and votes to posts"
ver_20230502034134: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "vote"
			name: "Vote"
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
	Name:   "Vote"
	Plural: "Votes"

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
		post_id: {
			Name:     "post_id"
			Plural:   "post_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		user_id: {
			Name:     "user_id"
			Plural:   "user_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		value: {
			Name:     "value"
			Plural:   "values"
			Type:     "int"
			Nullable: false
		}
		deleted_at: {
			Name:   "deleted_at"
			Plural: "deleted_ats"
			Type:   "datetime"
		}
		user: {
			Name:     "user"
			Plural:   "users"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "user"
				Type:  "belongs-to"
				Other: "User"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		post: {
			Name:     "post"
			Plural:   "posts"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "post"
				Type:  "belongs-to"
				Other: "Post"
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
