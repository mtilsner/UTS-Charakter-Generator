<fieldset class="talenttyp ${talenttyp.name}">
	<label class="talenttyp ${talenttyp.name} label"><g:message code="talenttyp.${talenttyp.name}.label" default="${talenttyp.name}" /></label>
	<g:render template="talent"
			  var="talent" collection="${talenttyp.talente.sort({a,b -> a.name <=> b.name})}" />
</fieldset>