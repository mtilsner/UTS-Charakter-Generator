<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="builder" />
        <g:set var="entityName" value="${message(code: 'charakter.label', default: 'Charakter')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
		<r:require module="charakter" />
		<r:require module="widgets" />
    </head>
    <body>
		<div id="seitennummer" class="seitennummer">
			<g:message code="charakter.seite.label" default="Seite" />
			<span id="seitennummer_wert">1</span>
		</div>
		<div id="resourcepunkte" class="resourcepunkte">
			<g:message code="charakter.resourcepunkte.label" default="Resourcepunkte" />
			<g:field type="text" id="resourcepunkte_wert" name="resourcepunkte" class="rp rp-charakter" value="0" tabindex="-1" readonly="readonly" />
		</div>
		<g:form controller="builder" action="save" id="${charakterInstance?.id}">
			<div class="page a4 centered page_1">
				<div class="printable">
					<g:render template="name" />
					<g:render template="attribute" />
					<g:render template="behinderungen" />
					<g:render template="talente" />
				</div>
			</div>
			<div class="page a4 centered page_2">
				<div class="printable">
					<g:render template="talente-seite2" />
					<g:render template="notizen" />
				</div>
				<g:submitButton name="save" value="speichern" />
			</div>
		</g:form>
    </body>
</html>