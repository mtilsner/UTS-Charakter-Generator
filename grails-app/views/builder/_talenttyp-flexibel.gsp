<%@ page import="uts.chargen.Talent" %>
<fieldset class="fieldset ${talenttyp.name} talenttyp">
	<legend class="legend">
		<g:message code="talenttyp.${talenttyp.name}.label" default="${talenttyp.name}" />
		<g:set var="updates" value="{target:'.rp-charakter', value:(function(el){return \$(el).val()})}" />	
		<g:textField id="talenttyp-${talenttyp.name}-rp" name="talent.${talenttyp.name}.rp" class="rp rp-talenttyp rp-talent-${talenttyp.name}"
				 	value="0" tabindex="-1" readonly="readonly" data-updates='["${updates}"]' disabled="disabled" />		
	</legend>
	<g:render template="talent" var="talent" collection="${talente}" />
	<g:if test="${!anzahl}">
		<g:set var="anzahl" value="${3}" />
	</g:if>
	<g:each var="index" in="${1..(anzahl-talente.size())}">
		<g:render template="talent-flexibel" model="['index': index, 'talenttyp': talenttyp, 'talente': talenttyp.talente.findAll({ !talente.contains(it) })]" var="index" bean="${index}" />
	</g:each>
</fieldset>