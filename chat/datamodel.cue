#TYPES:     "string" | "int" | "bool" | "float" | "uuid" | "datetime" | "email" | "password" | "url"
#RELATIONS: "belongs-to" | "has-one" | "has-many" | "many-to-many"

// Schema for validating GPT output
_Schema: {
	Name: string
	Models: [string]: {
		[!~"$"]: #TYPES
		"$relations": {
			[R=string]: {
				"name":  R
				"type":  #RELATIONS
				"model": string
			}
		}
	}
}

Datamodel: _Schema

// Correction for missing deleted_at field
Datamodel: Models: [string]: deleted_at: "datatime"

// STEP 0
// Set the name to Interludes
{
	"Datamodel": {
		"Name": "Interludes"
		"Models": {
			"User": {
				"id":         "uuid"
				"created_at": "datetime"
				"updated_at": "datetime"
				"email":      "email"
				"active":     "bool"
				"verified":   "bool"
			}
		}
	}
}

// Instruction to reduce output length, we actually did step 1 first
// From now on, only show the relevant changes to the JSON object

Datamodel: Models: {

	// STEP 1
	// Add a Profile for the user with avatar, about, and status fields
	"Profile": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"avatar":     "url"
		"about":      "string"
		"status":     "string"
		"$relations": {
			"user": {
				"name":  "user"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"User": {
		"$relations": {
			"profile": {
				"name":  "profile"
				"type":  "has-one"
				"model": "Profile"
			}
		}
	}

	// STEP 2
	// Users can have many posts.
	// They can first write them as drafts and later publish them.
	// We would like to know when they made them public.
	"Post": {
		"id":           "uuid"
		"created_at":   "datetime"
		"updated_at":   "datetime"
		"published_at": "datetime"
		"content":      "string"
		"status":       "string"
		"$relations": {
			"user": {
				"name":  "user"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"User": {
		"$relations": {
			"posts": {
				"name":  "posts"
				"type":  "has-many"
				"model": "Post"
			}
		}
	}

	// STEP 3
	// Posts can contain hashtags, similar to most social media platforms.
	// We would like to allow users to watch hashtags for new posts as well.
	"Hashtag": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"name":       "string"
		"$relations": {
			"posts": {
				"name":  "posts"
				"type":  "many-to-many"
				"model": "Post"
			}
			"users": {
				"name":  "users"
				"type":  "many-to-many"
				"model": "User"
			}
		}
	}
	"PostHashtag": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"post_id":    "uuid"
		"hashtag_id": "uuid"
	}
	"UserHashtag": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"user_id":    "uuid"
		"hashtag_id": "uuid"
	}
	"Post": {
		"$relations": {
			"hashtags": {
				"name":  "hashtags"
				"type":  "many-to-many"
				"model": "Hashtag"
			}
		}
	}
	"User": {
		"$relations": {
			"watchedHashtags": {
				"name":  "watchedHashtags"
				"type":  "many-to-many"
				"model": "Hashtag"
			}
		}
	}

	// STEP 4
	// Users can up and down vote posts.
	// They should also be able to see all of the posts they voted on.
	"Vote": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"post_id":    "uuid"
		"user_id":    "uuid"
		"value":      "int"
		"$relations": {
			"user": {
				"name":  "user"
				"type":  "belongs-to"
				"model": "User"
			}
			"post": {
				"name":  "post"
				"type":  "belongs-to"
				"model": "Post"
			}
		}
	}
	"Post": {
		"$relations": {
			"votes": {
				"name":  "votes"
				"type":  "has-many"
				"model": "Vote"
			}
		}
	}
	"User": {
		"$relations": {
			"votes": {
				"name":  "votes"
				"type":  "has-many"
				"model": "Vote"
			}
		}
	}

	// STEP 5
	// Users can follow, mute, and block each other.
	// These should be separate tables.  (we had to add this refinement
	"Follow": {
		"id":          "uuid"
		"created_at":  "datetime"
		"updated_at":  "datetime"
		"follower_id": "uuid"
		"followee_id": "uuid"
		"$relations": {
			"follower": {
				"name":  "follower"
				"type":  "belongs-to"
				"model": "User"
			}
			"followee": {
				"name":  "followee"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"Mute": {
		"id":          "uuid"
		"created_at":  "datetime"
		"updated_at":  "datetime"
		"muted_by_id": "uuid"
		"muted_id":    "uuid"
		"$relations": {
			"muted_by": {
				"name":  "muted_by"
				"type":  "belongs-to"
				"model": "User"
			}
			"muted": {
				"name":  "muted"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"Block": {
		"id":            "uuid"
		"created_at":    "datetime"
		"updated_at":    "datetime"
		"blocked_by_id": "uuid"
		"blocked_id":    "uuid"
		"$relations": {
			"blocked_by": {
				"name":  "blocked_by"
				"type":  "belongs-to"
				"model": "User"
			}
			"blocked": {
				"name":  "blocked"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"User": {
		"$relations": {
			"following": {
				"name":  "following"
				"type":  "has-many"
				"model": "Follow"
			}
			"followers": {
				"name":  "followers"
				"type":  "has-many"
				"model": "Follow"
			}
			"muting": {
				"name":  "muting"
				"type":  "has-many"
				"model": "Mute"
			}
			"muted_by": {
				"name":  "muted_by"
				"type":  "has-many"
				"model": "Mute"
			}
			"blocking": {
				"name":  "blocking"
				"type":  "has-many"
				"model": "Block"
			}
			"blocked_by": {
				"name":  "blocked_by"
				"type":  "has-many"
				"model": "Block"
			}
		}
	}

	// STEP 6
	// Users can be banned for various reasons.
	// They can also appeal their ban. This information should be tracked in detail.
	"Ban": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"user_id":    "uuid"
		"reason":     "string"
		"start_date": "datetime"
		"end_date":   "datetime"
		"$relations": {
			"user": {
				"name":  "user"
				"type":  "belongs-to"
				"model": "User"
			}
		}
	}
	"Appeal": {
		"id":         "uuid"
		"created_at": "datetime"
		"updated_at": "datetime"
		"ban_id":     "uuid"
		"reason":     "string"
		"status":     "string"
		"$relations": {
			"ban": {
				"name":  "ban"
				"type":  "belongs-to"
				"model": "Ban"
			}
		}
	}
	"User": {
		"$relations": {
			"bans": {
				"name":  "bans"
				"type":  "has-many"
				"model": "Ban"
			}
			"appeals": {
				"name":  "appeals"
				"type":  "has-many"
				"model": "Appeal"
			}
		}
	}

}
