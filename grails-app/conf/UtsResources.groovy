modules = {
	application {
		dependsOn "jquery"
		resource url:"css/main.css"
		resource url:"css/layout.css"
		resource url:"js/application.js"
	}
	timedObserver {
		dependsOn "jquery"
		resource url:"js/jquery/jquery-timedObserver.js"
	}
	charakter {
		dependsOn "jquery-ui, timedObserver"
		resource url:"css/charakter.css"
		resource url:"css/charakter-a4.css"
		resource url:"js/charakter.js"
	}
	widgets {
		dependsOn "jquery-ui"
		resource url:"js/widgets.js"
	}
}