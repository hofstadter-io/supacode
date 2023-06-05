package UserHashtag

msg_20230502034100: "add hashtags and votes to posts"
ver_20230502034100: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "user-hashtag"
			name: "UserHashtag"
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
	Name:   "UserHashtag"
	Plural: "UserHashtags"

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
		user_id: {
			Name:     "user_id"
			Plural:   "user_ids"
			Type:     "uuid"
			Nullable: false
			Unique:   true
			Validation: Format: "uuid"
		}
		hashtag_id: {
			Name:     "hashtag_id"
			Plural:   "hashtag_ids"
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
		$hof: datamodel: {
			node:    true
			ordered: true
		}
	}

	// if we want Relations as a separate value
	// we can process the fields to extract them
}
