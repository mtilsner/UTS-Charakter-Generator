package uts.chargen

class User {

	static hasMany = [charaktaere: Charakter]

	String openid
	Boolean admin

    static constraints = {
    }
}
