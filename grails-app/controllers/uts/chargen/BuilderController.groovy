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

	def save = {
		def charakterInstance = params.id ? Charakter.get(params.id) : new Charakter()
        //charakterInstance.properties = params.charakter
		charakterInstance.name = params.charakter.name

		params.talent.each { talentid,werte ->
			if(talentid ==~ /\d+/) {
				def key = talentid
				def tw = charakterInstance.talentwerte[key] ?: new SystemTalentwert(talent: Talent.get(talentid))
				tw.wert = werte.wert
				tw.spezialisierungen = werte.spezialisierung.tokenize(",")
				charakterInstance.talentwerte[key] = tw
			}
		}
		params.flextalent.each { talenttypid,talente ->
			if(talenttypid ==~ /\d+/) {
				talente.each { index,werte ->
					if(index ==~ /\d+/) {
						def key = "custom.${talenttypid}.${index}"
						def tw = charakterInstance.talentwerte[key] ?: new EigenerTalentwert(talenttyp: Talenttyp.get(talenttypid), index: index)
						tw.wert = werte.wert
						tw.name = werte.name
						tw.spezialisierungen = werte.spezialisierung.tokenize(",")
						charakterInstance.talentwerte[key] = tw
					}
				}
			}
		}
		
		if(params.charakter.ruestung && params.charakter.ruestung instanceof String) {
			charakterInstance.ruestung = Ruestung.get(params.charakter.ruestung.toInteger())
		} else {
			charakterInstance.ruestung = null
		}
		println "rüstung-1: "+params.charakter.ruestung
		println "rüstung-2: "+charakterInstance.ruestung + " ["+charakterInstance.ruestung.class+"]"
		
		if(params.charakter.schild && params.charakter.schild instanceof String) {
			charakterInstance.schild = Ruestung.get(params.charakter.schild.toInteger())
		} else {
			charakterInstance.schild = null
		}
		println "schild: "+params.charakter.schild

		if(charakterInstance.save()) {
			flash.message = "Charakter wurde gespeichert"
			redirect(action: "show", id: charakterInstance.id)
		} else {
			charakterInstance.errors.allErrors.each {
			        println "error:::: "+it
			}
			render(view: "charakter", model: [charakterInstance: charakterInstance])
		}
	}

	def javascript = {}

}
