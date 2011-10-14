class UrlMappings {

	static mappings = {
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
