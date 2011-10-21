package uts.chargen

class Talenttyp {

	static hasMany = [talente:Talent,spezialisierungen:Talenttypspezialisierung]

	String name

	String toString() { name }

	Boolean vonBehinderungBetroffen = false

    static constraints = {
		name unique:true
    }
}
