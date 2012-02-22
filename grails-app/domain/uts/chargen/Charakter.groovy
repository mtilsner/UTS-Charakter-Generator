package uts.chargen

class Charakter {

	static hasMany = [talentwerte:Talentwert,vorteilswerte:Vorteilswert]
	Map talentwerte = [:]
	Map vorteilswerte = [:]

	String name
	String notizen = ""
	
	String image

	Integer leben = 5
	Integer energie = 5
	Integer stabilitaet = 5

	Ruestung ruestung
	Schild schild

	User nutzer

	static mapping = {
		notizen type:'text'
	}
	
    static constraints = {
		ruestung nullable:true
		schild nullable:true
		image nullable:true
		nutzer nullable:true
    }
}
