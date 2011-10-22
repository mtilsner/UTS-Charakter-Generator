<%@ page import="uts.chargen.Talentspezialisierung" %>
<%@ page import="uts.chargen.Talenttypspezialisierung" %>
<div class="talent ${talent.name}">
	<label class="label" for="talent-${talent.name}">
		<g:message code="talenttyp.${talent.name}.label" default="${talent.name}" />
	</label>
	<div class="value">
		<g:set var="updates" value="{target:'#talent-${talent.name}-rp', value:(function(el){return uts.chargen.rp.talentLevelKosten(parseInt(\$(el).val()))})}" />	
		<widgets:numberWithBonus id="talent-${talent.name}" name="talent.${talent.name}" label="'${talent.name}'"
								 value="${0}" bonus="${0}" min="${0}" max="${3}"
								 data-updates='["${updates}"]' />
		<g:set var="updates" value="{target:'#talent-${talent.name}-rp', value:(function(el){return uts.chargen.rp.talentSpezialisierungsKosten(\$.grep(\$(el).val().split(','),function(s){ return \$.trim(s) != '' }))})}" />	
		<widgets:suggestiveMultipleInput id="talent-${talent.name}-spezialisierung-template"
		 								 name="talent.${talent.name}.spezialisierung.template"
		 						 		 class="spezialisierung"
										 suggestions="${Talentspezialisierung.findAllByTalent(talent).plus(Talenttypspezialisierung.findAllByTalenttyp(talent.typ))}"
										 data-updates='["${updates}"]' />
		<g:set var="updates" value="{target:'.rp-talent-${talent.typ.name}', value:(function(el){return \$(el).val()})}" />	
		<g:textField id="talent-${talent.name}-rp" name="talent.${talent.name}.rp" class="rp rp-talent rp-talent-${talent.name}"
					 value="0" tabindex="-1" readonly="readonly"
					 data-updates='["${updates}"]' />
	</div>
</div>