<%@ page import="uts.chargen.Ruestung" %>
<%@ page import="uts.chargen.Schild" %>
<fieldset class="ausruestung">
	<div class="ausruestung ruestung">
		<label for="ruestung" class="ausruestung ruestung label"><g:message code="charakter.ruestung.label" default="Rüstung" /></label>
		<div class="ausruestung ruestung value">
			<g:select id="charakter-ausruestung-ruestung" name="ruestung" from="${Ruestung.list(sort: 'ruestungswert')}" optionKey="id" 
					  optionValue="${{it.name+' ('+g.message(code:'charakter.ruestung.ruestungswert', default:'Rüstungswert')+': '+it.ruestungswert+')'}}"
					  value="" noSelection="['':'']" />
		</div>
	</div>
	
	<div class="ausruestung schild">
		<label for="schild" class="ausruestung schild label"><g:message code="charakter.schild.label" default="Schild" /></label>
		<div class="ausruestung schild value">
			<g:select id="charakter-ausruestung-schild" name="schild" from="${Schild.list(sort: 'bonus')}" optionKey="id"
					  optionValue="${{it.name+' ('+g.message(code:'charakter.schild.bonus', default:'Bonus')+': '+g.formatNumber(number: it.bonus, format: '+#;-#')+')'}}" 	
					  value="" noSelection="['':'']" />
		</div>
	</div>
</fieldset>