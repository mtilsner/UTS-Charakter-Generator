modules = {
	timedObserver {
		dependsOn "jquery"
		resource url:"js/jquery/jquery.timedObserver.js"
	}
	application {
		dependsOn "jquery, timedObserver"
		resource url:"css/layout.css"
		resource url:"js/application.js"
	}
	charakter {
		dependsOn "application"
		resource url:"css/charakter.css"
		resource url:"css/charakter-a4.css"
		resource url:"js/charakter.js"
		resource url:"/library/javascript", linkOverride:'/../library/javascript', attrs:[type:"js"]
	}
	tinyMCE {
		dependsOn "jquery"
		resource url:"js/tiny_mce/tiny_mce.js", linkOverride:'/../js/tiny_mce/tiny_mce.js'
	}
	widgets {
		dependsOn "jquery-ui, tinyMCE"
		resource url:"js/widgets.js"
		resource url:"css/widgets.css"
	}
}