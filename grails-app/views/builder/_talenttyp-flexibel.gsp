<%@ page import="uts.chargen.Talent" %>
<fieldset class="${talenttyp.name} talenttyp">
	<div class="talenttyp-header">
		<label class="label">
			<g:message code="talenttyp.${talenttyp.name}.label" default="${talenttyp.name}" />
		</label>
		<div class="value">
			<g:textField name="${talenttyp.name}.deco" style="visibility:hidden;" tabindex="-1" />
			<g:set var="updates" value="{target:'.rp-charakter', value:(function(el){return \$(el).val()})}" />	
			<g:textField id="talenttyp-${talenttyp.name}-rp" name="talent.${talenttyp.name}.rp" class="rp rp-talenttyp rp-talent-${talenttyp.name}"
					 	value="0" tabindex="-1" readonly="readonly" data-updates='["${updates}"]' />		
		</div>
	</div>
	<g:render template="talent" var="talent" collection="${talente}" />
	<g:each var="index" in="${1..3}">
		<g:render template="talent-flexibel" model="['index': index, 'talenttyp': talenttyp, 'talente': talenttyp.talente.findAll({ !talente.contains(it) })]" var="index" bean="${index}" />
	</g:each>
</fieldset>