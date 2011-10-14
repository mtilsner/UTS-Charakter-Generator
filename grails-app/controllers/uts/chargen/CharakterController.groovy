package uts.chargen

class CharakterController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [charakterInstanceList: Charakter.list(params), charakterInstanceTotal: Charakter.count()]
    }

    def create = {
        def charakterInstance = new Charakter()
        charakterInstance.properties = params
        return [charakterInstance: charakterInstance]
    }

    def save = {
        def charakterInstance = new Charakter(params)
        if (charakterInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'charakter.label', default: 'Charakter'), charakterInstance.id])}"
            redirect(action: "show", id: charakterInstance.id)
        }
        else {
            render(view: "create", model: [charakterInstance: charakterInstance])
        }
    }

    def show = {
        def charakterInstance = Charakter.get(params.id)
        if (!charakterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
            redirect(action: "list")
        }
        else {
            [charakterInstance: charakterInstance]
        }
    }

    def edit = {
        def charakterInstance = Charakter.get(params.id)
        if (!charakterInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [charakterInstance: charakterInstance]
        }
    }

    def update = {
        def charakterInstance = Charakter.get(params.id)
        if (charakterInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (charakterInstance.version > version) {
                    
                    charakterInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'charakter.label', default: 'Charakter')] as Object[], "Another user has updated this Charakter while you were editing")
                    render(view: "edit", model: [charakterInstance: charakterInstance])
                    return
                }
            }
            charakterInstance.properties = params
            if (!charakterInstance.hasErrors() && charakterInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'charakter.label', default: 'Charakter'), charakterInstance.id])}"
                redirect(action: "show", id: charakterInstance.id)
            }
            else {
                render(view: "edit", model: [charakterInstance: charakterInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def charakterInstance = Charakter.get(params.id)
        if (charakterInstance) {
            try {
                charakterInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'charakter.label', default: 'Charakter'), params.id])}"
            redirect(action: "list")
        }
    }
}
