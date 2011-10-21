package uts.chargen

class WidgetsTagLib {
	static namespace = "widgets"	
	static spinBoxId = 0
	
	def resources = { attrs ->
		out << r.require(module: "widgets")
	}

	def kaestchenAnzeige = { attrs,body ->
		if(!attrs.max) attrs.max = 9
		if(!attrs.value) attrs.value = attrs.max
		def var = attrs.var ? attrs.var : "index"
		out << "<div id='${attrs.id}' class='kaestchenContainer kaestchen_${attrs.value}'>"
		for(i in 1..(attrs.max)) {
			out << '<div class="kaestchen">' + body((var):i) +'</div>'
		}
		out << '</div>'
	}
	
	def numberWithBonus = { attrs ->
		if(!attrs.value) attrs.value = 0
		if(!attrs.bonus) attrs.bonus = 0
		if(!attrs.'data-updates') attrs.'data-updates' = []
		if(!attrs.name) attrs.name = attrs.id
		attrs.'data-updates'.add("{target: '#${attrs.id}-summe', message: '${attrs.label} Talentwert', value:(function(el){return \$(el).val()})}")
		out << g.field(id:"${attrs.id}", name:"${attrs.name}", value:attrs.value, class:"${attrs.class ? atts.class : ''} wert numberWithBonus",
		 			   type:"number", min:attrs.min, max:attrs.max, pattern:"[${attrs.min}-${attrs.max}]",
					   'data-updates': "${attrs.'data-updates'}")
		out << g.field(id:"${attrs.id}-bonus", name:"${attrs.name}.bonus", value:g.formatNumber(format:"+#;-#", number: attrs.bonus), tabindex: -1,
					    class:"${attrs.class ? atts.class : ''} bonus numberWithBonus", type:"text", readonly:"readonly", 'data-prefixpositives':"true", 
					   'data-updates': "[{target: '#${attrs.id}-summe', message: '${attrs.label} Bonus', value:(function(el){return \$(el).val()})}]")
		out << g.field(id:"${attrs.id}-summe", name:"${attrs.name}.summe", value:attrs.value+attrs.bonus, tabindex: -1,
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
			});
		""" }
		if(!attrs.'data-updates') attrs.'data-updates' = []
		out << g.textField(id:attrs.id, name:attrs.name, value:attrs.value, 'data-updates':attrs.'data-updates',
						   class:(attrs.class ? attrs.class : ''), placeholder: "${attrs.suggestions.join(", ")}")
	}
}
