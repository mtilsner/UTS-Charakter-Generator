<%@ page import="uts.chargen.Ruestung" %>
<%@ page import="uts.chargen.Schild" %>
<%@ page import="uts.chargen.Talenttyp" %>
<fieldset class="behinderungen">
	<div class="behinderung ruestung">
		<label for="ruestung" class="label"><g:message code="charakter.ruestung.label" default="Rüstung" /></label>
		<div class="value">
			<g:field type="number" min="-3" max="0" name="ruestung-wert" id="charakter-behinderung-ruestung-wert"
				class="value" value="0"
				data-updates="${Talenttyp.findAllByVonBehinderungBetroffen(true).collect({'.talenttyp.'+it.name+' .bonus'}).join(',')}"  />
			<g:select id="charakter-behinderung-ruestung" name="ruestung" from="${Ruestung.list(sort: 'ruestungswert')}" optionKey="id" 
					  optionValue="${{it.name+' ('+g.message(code:'charakter.ruestung.ruestungswert', default:'Rüstungswert')+': '+it.ruestungswert+')'}}"
					  value="" noSelection="['':'']" />
		</div>
	</div>
	
	<div class="behinderung schild">
		<label for="schild" class="label"><g:message code="charakter.schild.label" default="Schild" /></label>
		<div class="value">
			<g:select id="charakter-ausruestung-schild" name="schild" from="${Schild.list(sort: 'bonus')}" optionKey="id"
					  optionValue="${{it.name+' ('+g.message(code:'charakter.schild.bonus', default:'Bonus')+': '+g.formatNumber(number: it.bonus, format: '+#;-#')+')'}}" 	
					  value="" noSelection="['':'']" />
		</div>
	</div>
</fieldset>