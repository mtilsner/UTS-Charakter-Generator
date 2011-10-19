<%@ page import="uts.chargen.Spezialisierung" %>
<div class="talent ${talent.name}">
	<label class="label" for="talent.${talent.name}">
		<g:message code="talenttyp.${talent.name}.label" default="${talent.name}" />
	</label>
	<div class="value">
		<widgets:numberWithBonus id="talent-${talent.name}" name="talent.${talent.name}", label="${talent.name}"
								 value="${0}" bonus="${0}" min="${0}" max="${3}" />
		<widgets:suggestiveMultipleInput id="talent-${talent.name}-spezialisierung-template"
		 								 name="talent.${talent.name}.spezialisierung.template"
		 						 		 class="spezialisierung"
										 suggestions="${Spezialisierung.findAllByTalent(talent)}" />
	</div>
</div>