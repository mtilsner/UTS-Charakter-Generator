package uts.chargen

class Talent {

	static hasMany = [spezialisierungen:Spezialisierung]

	String name
	String beschreibung

 	Talenttyp typ

	String toString() { name }

    static constraints = {
		name unique:true
		beschreibung widget:'textarea'
    }

	static mappings = {
		beschreibung type:'text'
	}
}
