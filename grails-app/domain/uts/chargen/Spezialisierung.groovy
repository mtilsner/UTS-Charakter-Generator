package uts.chargen

class Spezialisierung {

	Talent talent

	String name

	String toString() { name }

    static constraints = {
		name unique:'talent'
    }
}
