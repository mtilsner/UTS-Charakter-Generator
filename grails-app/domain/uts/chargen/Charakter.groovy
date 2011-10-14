package uts.chargen

class Charakter {

	static hasMany = [talentwerte:Talentwert,vorteilswerte:Vorteilswert]

	String name
	
	Integer leben = 5
	Integer energie = 5
	Integer stabilitaet = 5

	Ruestung ruestung
	Schild schild

	Avatar avatar

	User nutzer

	public Integer calculateRPKosten() {
		def kosten = 0
		talentwerte.each { kosten += it.calculateRPKosten() }
		vorteilswerte.each { kosten += it.calculateRPKosten() }
		return kosten
	}

    static constraints = {
		name unique:true
		avatar nullable:true
		ruestung nullable:true
		schild nullable:true
    }
}
