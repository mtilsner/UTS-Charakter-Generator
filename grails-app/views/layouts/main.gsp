<!DOCTYPE html>
<meta charset=utf-8>
<head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'layout.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
		<r:require modules="jquery-ui"/>
		<r:layoutResources />
        <g:javascript library="application" />
        <g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
		<div class="toprow">
			<g:if test="${session['user']}">
				<span class="userinfo openid">${session['user'].openid}</span>
				<g:link controller="openid" action="abmelden">Abmelden</g:link>
			</g:if>
			<g:else>
				<g:message code="authentication.notLoggedIn" default="Bitte melden Sie sich erst an" />
			</g:else>
		</div>
        <g:layoutBody />
		<r:layoutResources />
    </body>
</html>