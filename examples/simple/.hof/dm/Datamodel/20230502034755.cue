package Datamodel

msg_20230502034755: "add models for follow, mute, and block"

// The models we want in our database as tables & columns
// the actual contents for this demo come from ChatGPT
ver_20230502034755: {
	$hof: {
		datamodel: {
			root:    true
			history: true
		}
		metadata: {
			name: "Datamodel"
			id:   "datamodel"
		}
	}
	History: []
	// these are the models for the application
	// they can map onto database tables and apis
	Models: {
		User: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "User"

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
				votes: {
					Name:     "votes"
					Plural:   "votess"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "votes"
						Type:  "has-many"
						Other: "Vote"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				following: {
					Name:     "following"
					Plural:   "followings"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "following"
						Type:  "has-many"
						Other: "Follow"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				followers: {
					Name:     "followers"
					Plural:   "followerss"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "followers"
						Type:  "has-many"
						Other: "Follow"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				muting: {
					Name:     "muting"
					Plural:   "mutings"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "muting"
						Type:  "has-many"
						Other: "Mute"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
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
						Type:  "has-many"
						Other: "Mute"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				blocking: {
					Name:     "blocking"
					Plural:   "blockings"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "blocking"
						Type:  "has-many"
						Other: "Block"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
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
						Type:  "has-many"
						Other: "Block"
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
		Profile: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Profile"

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
			Name:   "Profile"
			Plural: "Profiles"

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
				avatar: {
					Name:     "avatar"
					Plural:   "avatars"
					Type:     "string"
					Length:   64
					Unique:   false
					Nullable: false
					SQL: Type:       "character varying(64)"
					Validation: Max: 64
				}
				about: {
					Name:     "about"
					Plural:   "abouts"
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
				$hof: datamodel: {
					node:    true
					ordered: true
				}
			}

			// if we want Relations as a separate value
			// we can process the fields to extract them
		}
		Post: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Post"

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
				votes: {
					Name:     "votes"
					Plural:   "votess"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "votes"
						Type:  "has-many"
						Other: "Vote"
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
		Hashtag: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Hashtag"

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
			Name:   "Hashtag"
			Plural: "Hashtags"

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
				name: {
					Name:     "name"
					Plural:   "names"
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
				posts: {
					Name:     "posts"
					Plural:   "postss"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "posts"
						Type:  "many-to-many"
						Other: "Post"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				users: {
					Name:     "users"
					Plural:   "userss"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "users"
						Type:  "many-to-many"
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
		PostHashtag: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "PostHashtag"

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
			Name:   "PostHashtag"
			Plural: "PostHashtags"

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
		UserHashtag: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "UserHashtag"

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
		Vote: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Vote"

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
		Follow: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Follow"

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
			Name:   "Follow"
			Plural: "Follows"

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
				follower_id: {
					Name:     "follower_id"
					Plural:   "follower_ids"
					Type:     "uuid"
					Nullable: false
					Unique:   true
					Validation: Format: "uuid"
				}
				followee_id: {
					Name:     "followee_id"
					Plural:   "followee_ids"
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
				follower: {
					Name:     "follower"
					Plural:   "followers"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "follower"
						Type:  "belongs-to"
						Other: "User"
					}

					// we can enrich this for various types
					// in our app or other reusable datamodels
					Validation: Format: "uuid"
				}
				followee: {
					Name:     "followee"
					Plural:   "followees"
					Type:     "uuid"
					Nullable: false
					Unique:   true

					// relation type, open to be flexible
					Relation: {
						Name:  "followee"
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
		Mute: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Mute"

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
		$hof: datamodel: {
			node:    true
			ordered: true
		}
		Block: {
			// schema for $hof: ...
			$hof: {
				// $hof version
				apiVersion: "v1beta1"

				// typical metadata
				metadata: name: "Block"

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
	}

	// OrderedModels: [...Model] will be
	// inject here for order stability
}
