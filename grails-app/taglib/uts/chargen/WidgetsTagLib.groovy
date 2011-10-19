package uts.chargen

class WidgetsTagLib {
	static namespace = "widgets"	
	static spinBoxId = 0
	
	def resources = { attrs ->
		out << r.require(module: "widgets")
	}
	
	def numberWithBonus = { attrs ->
		if(!attrs.value) attrs.value = 0
		if(!attrs.bonus) attrs.bonus = 0
		out << g.field(id:"${attrs.id}-wert", name:"${attrs.name}.wert", value:attrs.value, class:"${attrs.class ? atts.class : ''} wert numberWithBonus",
		 			   type:"number", min:attrs.min, max:attrs.max, pattern:"[${attrs.min}-${attrs.max}]", 'data-updates':"#${attrs.id}-summe")
		out << g.field(id:"${attrs.id}-bonus", name:"${attrs.name}.bonus", value:g.formatNumber(format:"+#;-#", number: attrs.bonus),
					    class:"${attrs.class ? atts.class : ''} bonus numberWithBonus", type:"text", readonly:"readonly", 'data-updates':"#${attrs.id}-summe")
		out << g.field(id:"${attrs.id}-summe", name:"${attrs.name}.summe", value:attrs.value+attrs.bonus,
					   class:"${attrs.class ? atts.class : ''} summe numberWithBonus", type:"text", readonly:"readonly")
	}
	
	def suggestiveMultipleInput = { attrs ->
		def autocompleteJsSource = attrs.suggestions.collect({'"'+it.name+'"'})
		out << r.script { """
			\$("#${attrs.id}").bind("keydown", function( event ) {
				if(event.keyCode === \$.ui.keyCode.TAB && \$(this).data("autocomplete").menu.active)
					event.preventDefault();
			}).autocomplete({
				minLength: 0,
				source: function( request, response ) {
					response(\$.ui.autocomplete.filter(${autocompleteJsSource}, extractLast(request.term)));
				},
				focus: function() {
					return false;
				},
				select: function(event, ui) {
					var terms = split( this.value );
					terms.pop();
					terms.push( ui.item.value );
					terms.push( "" );
					this.value = terms.join( ", " );
					return false;
				}
			}).autoResize();
		""" }
		out << g.textArea(id:attrs.id, name:attrs.name, value:attrs.value, class:(attrs.class ? attrs.class : ''), placeholder: "${attrs.suggestions.join(", ")}")
	}
}
