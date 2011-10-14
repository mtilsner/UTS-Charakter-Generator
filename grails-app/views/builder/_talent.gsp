<div class="talent ${talent.name}">
	<label class="talent ${talent.name} label" for="${talent.name}">
		<g:message code="talenttyp.${talent.name}.label" default="${talent.name}" />
	</label>
	<div class="talent ${talent.name} value">
		<g:field type="number" name="talent.${talent.name}.wert" value="" min="0" max="3" pattern="[0-3]"
	 		 	 class="talent ${talent.name} value wert" id="talent-${talent.name}-value-wert" />
	</div>
</div>