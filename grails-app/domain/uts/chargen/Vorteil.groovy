package uts.chargen

class Vorteil {

	String name
	String beschreibung
	Vorteilstyp vorteilstyp

	String parameterOptions = null	
	Integer maxLevel = 1
	
	Boolean istNachteil = false
	
	String effectScript
	String voraussetzungScript = "true"
	String rpkostenScript
	
	String toString() { name }

    static constraints = {
		name unique:true
		beschreibung widget:'textarea'
		parameterOptions nullable:true
		effectScript nullable:true,widget:'textarea'
		rpkostenScript widget:'textarea'
    }

	static mapping = {
		beschreibung type:'text'
		effectScript type:'text'
		rpkostenScript type:'text'
	}
}
