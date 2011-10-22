<%@ page import="uts.chargen.Talent" %>
<%@ page import="uts.chargen.Talenttyp" %>
<section id="talente">
	<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Körper')]" />
	<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Geist')]" />
	<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Waffen')]" />
	<g:render template="talenttyp-flexibel" model="['talenttyp': Talenttyp.findByName('Mobilität'), 'talente': [Talent.findByName('Reiten')], 'anzahl':4]" />
</section>