<%@ page import="uts.chargen.Talenttyp" %>
<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Körper')]" />
<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Geist')]" />
<g:render template="talenttyp" model="['talenttyp': Talenttyp.findByName('Waffen')]" />