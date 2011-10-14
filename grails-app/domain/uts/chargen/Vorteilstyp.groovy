package uts.chargen

class Vorteilstyp {

	static hasMany = [vorteile:Vorteil]

	String name

	String toString() { name }

    static constraints = {
		name unique:true
    }
}
