package uts.chargen

class Talentspezialisierung extends Spezialisierung {

	Talent talent

    static constraints = {
		name unique:'talent'
    }
}
