modules = {
	application {
		dependsOn "jquery"
		resource url:"css/main.css"
		resource url:"css/layout.css"
		resource url:"js/application.js"
	}
	timedObserver {
		dependsOn "jquery"
		resource url:"js/jquery/jquery.timedObserver.js"
	}
	autoResize {
		dependsOn "jquery"
		resource url:"js/jquery/jquery.autoresize.js"
	}
	charakter {
		dependsOn "jquery-ui, timedObserver, autoResize, application"
		resource url:"css/charakter.css"
		resource url:"css/charakter-a4.css"
		resource url:"js/charakter.js"
		resource url:"/library/javascript", linkOverride:'/../library/javascript', attrs:[type:"js"]
	}
	widgets {
		dependsOn "jquery-ui"
		resource url:"js/widgets.js"
		resource url:"css/widgets.css"
	}
}