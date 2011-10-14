
<%@ page import="uts.chargen.Charakter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'charakter.label', default: 'Charakter')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
				<label for="name"><g:message code="charakter.name.label" default="Name" /></label>
				<div class="value"><g:textField name="name" value="${charakterInstance?.name}" /></div>
				
				<label for="leben"><g:message code="charakter.leben.label" default="Leben" /></label>
				<div class="value"><uts:lebensAnzeige value="${charakterInstance?.leben}" /></div>

				<label for="energie"><g:message code="charakter.energie.label" default="Energie" /></label>
				<div class="value"><uts:energieAnzeige value="${charakterInstance?.energie}" /></div>
				
				<label for="stabilitaet"><g:message code="charakter.stabilitaet.label" default="Stabilität" /></label>
				<div class="value"><uts:stabilitaetAnzeige value="${charakterInstance?.stabilitaet}" /></div>
				
				<h3>Körperlich</h3>
				<g:each in="${uts.chargen.Talent.findAllByTyp(uts.chargen.Talenttyp.findByName('Körper'), [sort:'name'])}" var="talent">
					<label for="${talent.name}">${talent.name}</label>
					<div class="value"><g:field type="number" name="talent.${talent.name}" value="1" min="0" max="3" pattern="[0-3]" onBlur="javascript:" /></div>
				</g:each>
				
				<h3>Geist</h3>
				<g:each in="${uts.chargen.Talent.findAllByTyp(uts.chargen.Talenttyp.findByName('Geist'), [sort:'name'])}" var="talent">
					<label for="${talent.name}">${talent.name}</label>
					<div class="value"><uts:talentEditor name="${talent.name}" talent="${talent}" charakter="${charakterInstance}" /></div>
				</g:each>
				
				<h3>Waffen</h3>
				<g:each in="${uts.chargen.Talent.findAllByTyp(uts.chargen.Talenttyp.findByName('Waffen'), [sort:'name'])}" var="talent">
					<label for="${talent.name}">${talent.name}</label>
					<div class="value"><uts:talentEditor name="${talent.name}" talent="${talent}" charakter="${charakterInstance}" /></div>
				</g:each>
				
				
<!--				
				
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.avatar.label" default="Avatar" /></td>
                            
                            <td valign="top" class="value"><g:link controller="avatar" action="show" id="${charakterInstance?.avatar?.id}">${charakterInstance?.avatar?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.energie.label" default="Energie" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "energie")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.leben.label" default="Leben" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "leben")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.nutzer.label" default="Nutzer" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "nutzer")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.stabilitaet.label" default="Stabilitaet" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: charakterInstance, field: "stabilitaet")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.talentwerte.label" default="Talentwerte" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${charakterInstance.talentwerte}" var="t">
                                    <li><g:link controller="talentwert" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="charakter.vorteilswerte.label" default="Vorteilswerte" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${charakterInstance.vorteilswerte}" var="v">
                                    <li><g:link controller="vorteilswert" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>-->
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${charakterInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
