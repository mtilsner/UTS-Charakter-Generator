<%@ page import="uts.chargen.Charakter" %>
<%@ page import="uts.chargen.Talent" %>
<%@ page import="uts.chargen.Talenttyp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Bitte melden Sie sich an</title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'anmelden.css')}" />
    </head>
    <body>
		<div class="centered anmelden">
			<g:form controller="openid" action="sendRequest">
				<img class="anmelden openid logo" src="${resource(dir:'images/anmelden',file:'OpenID-logo.png')}">
				<g:link class="anmelden openid explain" url="http://de.wikipedia.org/wiki/OpenID">was ist das?</g:link>
		    	<g:textField name="identifier" class="anmelden openid identifier" size="30" placeholder="http://name.myopenid.com" />
		    	<g:submitButton name="login" class="anmelden openid submit" value="Anmelden" />
			</g:form>
		</div>
    </body>
</html>
