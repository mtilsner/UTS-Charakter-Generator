package uts.chargen

class Konfiguration {

	String schluessel
	String wert

	static constraints = {
		schluessel unique:true
		wert widget:'textarea'
	}

    static mapping = {
		wert type:'text'
    }
}
