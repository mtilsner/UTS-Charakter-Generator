package uts.chargen

class BuilderController {

	def index = {
		redirect(action: "create")
	}

	def create = {
		render(view: "charakter", model: [charakterInstance: new Charakter()])
	}

	def show = {
    	def charakterInstance = Charakter.get(params.id)
    	if (!charakterInstance) {
			flash.message = "Charakter nicht gefunden"
			redirect(action: "create")
    	}
    	else {
        	render(view: "charakter", model: [charakterInstance: charakterInstance])
    	}
	}

}
