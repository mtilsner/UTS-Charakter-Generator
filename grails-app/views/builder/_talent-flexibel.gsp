<%@ page import="uts.chargen.Talenttypspezialisierung" %>
<div class="field talent talent-flexibel ${talenttyp.name}-${index}">
	<label class="label">
		<g:set var="suggestions" value="${Talenttypspezialisierung.findAllByTalenttyp(talenttyp)}" />
		<widgets:suggestiveInput id="talent-${talenttyp.name}-${index}-name"
								 name="flextalent.${talenttyp.id}.${index}.name"
								 class="talent-name"
								 value=""
								 suggestions="${talente}" />
	</label>
	<div class="value">
		<g:set var="updates" value="{target:'#talent-${talenttyp.name}-${index}-rp', value:(function(el){return uts.chargen.rp.talentLevelKosten(parseInt(\$(el).val()))})}" />	
		<widgets:numberWithBonus id="talent-${talenttyp.name}-${index}" name="flextalent.${talenttyp.id}.${index}" label="\$('#'+el.id+'-name').val()"
								 value="${0}" bonus="${0}" min="${0}" max="${3}"
								 data-updates='["${updates}"]' />
		<g:set var="updates" value="{target:'#talent-${talenttyp.name}-${index}-rp', value:(function(el){return uts.chargen.rp.talentSpezialisierungsKosten(\$.grep(\$(el).val().split(','),function(s){ return \$.trim(s) != '' }))})}" />	
		<div class="stretcher">
			<widgets:suggestiveMultipleInput id="talent-${talenttyp.name}-${index}-spezialisierung"
		 								 	 name="flextalent.${talenttyp.id}.${index}.spezialisierung"
		 						 		 	 class="spezialisierung"
										 	 suggestions="${suggestions}"
										 	 data-updates='["${updates}"]' />
		</div>
		<g:set var="updates" value="{target:'.rp-talent-${talenttyp.name}', value:(function(el){return \$(el).val()})}" />	
		<g:textField id="talent-${talenttyp.name}-${index}-rp" name="flextalent.${talenttyp.id}.${index}.rp" class="rp rp-talent rp-talent-${talenttyp.name}-${index}"
					 value="0" tabindex="-1" readonly="readonly"
					 data-updates='["${updates}"]' />
	</div>
</div>