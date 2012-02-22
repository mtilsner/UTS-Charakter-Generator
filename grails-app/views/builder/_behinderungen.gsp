<%@ page import="uts.chargen.Ruestung" %>
<%@ page import="uts.chargen.Schild" %>
<%@ page import="uts.chargen.Talenttyp" %>
<section id="behinderungen">
<fieldset class="fieldset behinderungen">
	<g:set var="talenttypSelector" value="${Talenttyp.findAllByVonBehinderungBetroffen(true).collect({'.talenttyp.'+it.name+' .bonus'}).join(',')}" />
	<g:set var="updateBehinderung" value="{target:'${talenttypSelector}', message:(function(el){return \$('#'+el.id+' option:selected')[0].dataset.message}),  value:(function(el){return parseInt(\$('#'+el.id+' option:selected')[0].dataset.behinderung)})}" />	

	<div class="field behinderung ruestung">
		<label for="ruestung" class="label"><g:message code="charakter.ruestung.label" default="Rüstung" /></label>
		<div class="value">
			<g:set var="update" value="${[updateBehinderung]}" />
			<select id="charakter-behinderung-ruestung" name="charakter.ruestung" data-updates="${update}">
				<option data-behinderung="0" value="${null}" data-message="" ${!charakterInstance?.ruestung ? 'selected="selected"' : ''}></option>
				<g:each in="${Ruestung.list(sort: 'ruestungswert')}" var="r">
					<option data-behinderung="${r.behinderung}" data-message="${r.name}" value="${r.id}"
					  		${charakterInstance?.ruestung == r ? 'selected="selected"' : ''}>
						${r.name} (<g:message code="charakter.ruestung.ruestungswert" default="Rüstungswert" /> ${r.ruestungswert})
					</option>
				</g:each>
			</select>
		</div>
	</div>
	
	<div class="field behinderung schild">
		<label for="schild" class="label"><g:message code="charakter.schild.label" default="Schild" /></label>
		<div class="value">
			<g:set var="updateParierbonus" value="{target:'#talent-Parieren-bonus', message:(function(el){return  \$('#'+el.id+' option:selected')[0].dataset.message}),  value:(function(el){return parseInt(\$('#'+el.id+' option:selected')[0].dataset.bonus)})}" />					
			<g:set var="update" value="${[updateBehinderung,updateParierbonus]}" />
			<select id="charakter-behinderung-schild" name="charakter.schild" data-updates="${update}">
				<option data-behinderung="0" value="${null}" data-bonus="0" data-message="" selected="selected"
						${!charakterInstance?.schild ? 'selected="selected"' : ''}></option>
				<g:each in="${Schild.list(sort: 'bonus')}" var="s">
					<option data-behinderung="${s.behinderung}" data-message="${s.name}" data-bonus="${s.bonus}" value="${s.id}"
							${charakterInstance?.schild == s ? 'selected="selected"' : ''}>${s.name}</option>
				</g:each>
			</select>
		</div>
	</div>
</fieldset>
</section>