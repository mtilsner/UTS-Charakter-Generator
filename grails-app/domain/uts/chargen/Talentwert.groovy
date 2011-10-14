package uts.chargen

class Talentwert {

	Talent talent
	Charakter charakter

	Integer wert
	
	static hasMany = [spezialisierungen: Spezialisierung]
	
	public Integer calculateRPKosten() {
		def kosten = 0
		def binding = new Binding()
		def shell = new GroovyShell(binding)
		def script = Konfiguration.findBySchluessel("talent_rp_steigerungskosten_script").wert
		for(binding.setVariable("level", 1);
			binding.getVariable("level")<=wert;
			binding.setVariable("level", binding.getVariable("level")+1)
		) kosten += shell.evaluate(script)
		return kosten
	}
}
