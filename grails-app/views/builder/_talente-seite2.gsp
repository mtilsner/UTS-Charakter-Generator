<%@ page import="uts.chargen.Talent" %>
<%@ page import="uts.chargen.Talenttyp" %>
<section id="talente-seite2">
	<g:render template="talenttyp-flexibel" model="['talenttyp': Talenttyp.findByName('Wissen'), 'talente': [], 'anzahl':20]" />
</section>