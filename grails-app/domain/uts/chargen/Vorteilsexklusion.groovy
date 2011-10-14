package uts.chargen

class Vorteilsexklusion {

	static hasMany = [vorteile:Vorteil]

	String toString() { vorteile.join(",") }
}
