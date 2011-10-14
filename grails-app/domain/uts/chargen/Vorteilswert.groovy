package uts.chargen

class Vorteilswert {

	Vorteil vorteil
	Charakter charakter

	Integer wert
	Object parameter

	public Integer calculateRPKosten() {
		def kosten = 0
		def binding = new Binding()
		def shell = new GroovyShell(binding)
		for(binding.setVariable("level", 1);
			binding.getVariable("level")<=wert;
			binding.setVariable("level", binding.getVariable("level")+1)
		) kosten += Math.abs(shell.evaluate(vorteil.rpkostenScript))
		if(vorteil.istNachteil) kosten *= -1
		return kosten
	}	
}
