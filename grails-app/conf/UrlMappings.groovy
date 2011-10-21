class UrlMappings {

	static mappings = {
		"/library/javascript" {
			controller = "builder"
			action ="javascript"
		}
		"/charakter/new" {
			controller = "builder"
			action = "create"
		}
		"/charakter/$id" {
			controller = "builder"
			action = "show"
		}
		"/charakter" {
			controller = "builder"
			action = "index"
		}

		"/anmelden" {
			controller = "openid"
			action = "anmelden"
		}
		"/abmelden" {
			controller = "openid"
			action = "abmelden"
		}

		"/$controller/$action?/$id?"{
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
