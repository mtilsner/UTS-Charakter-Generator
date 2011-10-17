<div class="talent ${talent.name}">
	<label class="label" for="talent.${talent.name}">
		<g:message code="talenttyp.${talent.name}.label" default="${talent.name}" />
	</label>
	<div class="value">
		<widgets:numberWithBonus id="talent-${talent.name}" name="talent.${talent.name}"
								 value="${0}" bonus="${0}" min="${0}" max="${3}" />
	</div>
</div>