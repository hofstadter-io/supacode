package User

msg_20230502034100: "add hashtags and votes to posts"
ver_20230502034100: {
	// schema for $hof: ...
	$hof: {
		// $hof version
		apiVersion: "v1beta1"

		// typical metadata
		metadata: {
			id:   "user"
			name: "User"
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
	Name:   "User"
	Plural: "Users"

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
		email: {
			Name:     "email"
			Plural:   "emails"
			Type:     "string"
			Length:   64
			Unique:   true
			Nullable: false
			Validation: {
				Max:    64
				Format: "email"
			}
		}
		active: {
			Name:     "active"
			Plural:   "actives"
			Type:     "bool"
			Default:  "false"
			Nullable: false
		}
		verified: {
			Name:     "verified"
			Plural:   "verifieds"
			Type:     "bool"
			Default:  "false"
			Nullable: false
		}
		deleted_at: {
			Name:   "deleted_at"
			Plural: "deleted_ats"
			Type:   "datetime"
		}
		profile: {
			Name:     "profile"
			Plural:   "profiles"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "profile"
				Type:  "has-one"
				Other: "Profile"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		posts: {
			Name:     "posts"
			Plural:   "postss"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "posts"
				Type:  "has-many"
				Other: "Post"
			}

			// we can enrich this for various types
			// in our app or other reusable datamodels
			Validation: Format: "uuid"
		}
		watchedHashtags: {
			Name:     "watchedHashtags"
			Plural:   "watchedHashtagss"
			Type:     "uuid"
			Nullable: false
			Unique:   true

			// relation type, open to be flexible
			Relation: {
				Name:  "watchedHashtags"
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
