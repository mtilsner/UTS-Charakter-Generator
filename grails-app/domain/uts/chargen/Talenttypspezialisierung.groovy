package uts.chargen

class Talenttypspezialisierung extends Spezialisierung {

	Talenttyp talenttyp

    static constraints = {
		name unique:'talenttyp'
    }
}
