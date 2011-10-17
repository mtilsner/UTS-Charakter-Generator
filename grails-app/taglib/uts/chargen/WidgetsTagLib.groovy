package uts.chargen

class WidgetsTagLib {
	static namespace = "widgets"	
	static spinBoxId = 0
	
	def jsLibrary = { attrs ->
		out << g.javascript(library: 'widgets')
	}
	
	def numberWithBonus = { attrs ->
		if(!attrs.value) attrs.value = 0
		if(!attrs.bonus) attrs.bonus = 0
		out << g.field(id:"${attrs.id}-wert", name:"${attrs.name}.wert", value:attrs.value, class:"${attrs.class ? atts.class : ''} wert numberWithBonus publisher",
		 			   type:"number", min:attrs.min, max:attrs.max, pattern:"[${attrs.min}-${attrs.max}]", 'data-updates':"#${attrs.id}-summe")
		out << g.field(id:"${attrs.id}-bonus", name:"${attrs.name}.bonus", value:g.formatNumber(format:"+#;-#", number: attrs.bonus),
					    class:"${attrs.class ? atts.class : ''} bonus numberWithBonus  publisher", type:"text", readonly:"readonly", 'data-updates':"#${attrs.id}-summe")
		out << g.field(id:"${attrs.id}-summe", name:"${attrs.name}.summe", value:attrs.value+attrs.bonus,
					   class:"${attrs.class ? atts.class : ''} summe numberWithBonus", type:"text", readonly:"readonly")
	}
}
