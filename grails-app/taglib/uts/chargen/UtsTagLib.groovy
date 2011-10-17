package uts.chargen

class UtsTagLib {
	static namespace = "uts"
	
	def kaestchenAnzeige = { content,attrs ->
		out << '<div class="kaestchenContainer">'
		for(i in 1..(attrs.value)) {
			out << '<div class="kaestchen">' + content(i) +'</div>'
		}
		out << '</div>'
	}
	
	def lebensAnzeige = kaestchenAnzeige.curry {it -> "-${(int) (it+1)/2}"}
	def energieAnzeige = kaestchenAnzeige.curry {'&nbsp;'}
	def stabilitaetAnzeige = kaestchenAnzeige.curry {'&nbsp;'}
	
	def talentEditor = { attrs ->
		def talentwert = attrs.charakter.talentwerte.find { it.talent == attrs.talent }
		out << widgets.spinBox(name:attrs.name, values:0..3, value:talentwert ? talentwert : 0)
		for(i in 1..(Math.min(3,attrs.talent.spezialisierungen.size()))) {
			def value = (talentwert && talentwert.spezialisierungen.size()>=i) ? talentwert.spezialisierungen.sort({ a,b -> a.name <=> b.name} as Comparator).get(i-1) : null
			out << g.select(name:"${attrs.name}.spezialisierung.${i}",
							from:attrs.talent.spezialisierungen.findAll({ it == value || !talentwert?.spezialisierungen?.contains(it) }).sort( { a,b -> a.name <=> b.name} as Comparator),
							noSelection:['':''],
							tabIndex: "-1",
							optionKey:'id', optionValue:'name',
							value:value?.id)
		}
	}
}
