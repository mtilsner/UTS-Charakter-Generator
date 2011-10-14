<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'charakter.css')}" />
        <g:set var="entityName" value="${message(code: 'charakter.label', default: 'Charakter')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div id="seitennummer" class="seitennummer">
			<g:message code="charakter.seite.label" default="Seite" />
			<span id="seitennummer_wert">1</span>
		</div>
		<div id="log"></div>
		<g:form>
			<div class="page a4 centered page_1">
				<div class="printable">
					<g:render template="name" />
					<g:render template="attribute" />
					<g:render template="ausruestung" />
					<g:render template="talente" />
				</div>
			</div>
			<div class="page a4 centered page_2">
				<div class="printable">
				</div>
			</div>
		</g:form>
    </body>
</html>
