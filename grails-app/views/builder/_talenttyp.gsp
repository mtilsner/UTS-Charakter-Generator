<fieldset class="fieldset ${talenttyp.name} talenttyp">
	<legend class="legend">
		<g:message code="talenttyp.${talenttyp.name}.label" default="${talenttyp.name}" />
		<g:set var="updates" value="{target:'.rp-charakter', value:(function(el){return \$(el).val()})}" />	
		<g:textField id="talenttyp-${talenttyp.name}-rp" name="talent.${talenttyp.name}.rp" class="rp rp-talenttyp rp-talent-${talenttyp.name}"
				 	value="0" tabindex="-1" readonly="readonly" data-updates='["${updates}"]' disabled="disabled" />		
	</legend>
	<g:render template="talent" var="talent" collection="${talenttyp.talente.sort({a,b -> a.name <=> b.name})}" />
</fieldset>