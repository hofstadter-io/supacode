package Post

msg_20230502034100: "add hashtags and votes to posts"
ver_20230502034100: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "post"
			name: "Post"
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
	Name:   "Post"
	Plural: "Posts"

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
		published_at: {
			Name:   "published_at"
			Plural: "published_ats"
			Type:   "datetime"
		}
		content: {
			Name:     "content"
			Plural:   "contents"
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
		hashtags: {
			Name:     "hashtags"
			Plural:   "hashtagss"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "hashtags"
				Type:  "many-to-many"
				Other: "Hashtag"
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
