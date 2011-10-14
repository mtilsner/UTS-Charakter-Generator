

<%@ page import="uts.chargen.Charakter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'charakter.label', default: 'Charakter')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${charakterInstance}">
            <div class="errors">
                <g:renderErrors bean="${charakterInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${charakterInstance?.id}" />
                <g:hiddenField name="version" value="${charakterInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="charakter.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${charakterInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="avatar"><g:message code="charakter.avatar.label" default="Avatar" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'avatar', 'errors')}">
                                    <g:select name="avatar.id" from="${uts.chargen.Avatar.list()}" optionKey="id" value="${charakterInstance?.avatar?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="energie"><g:message code="charakter.energie.label" default="Energie" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'energie', 'errors')}">
                                    <g:textField name="energie" value="${fieldValue(bean: charakterInstance, field: 'energie')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="leben"><g:message code="charakter.leben.label" default="Leben" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'leben', 'errors')}">
                                    <g:textField name="leben" value="${fieldValue(bean: charakterInstance, field: 'leben')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="nutzer"><g:message code="charakter.nutzer.label" default="Nutzer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'nutzer', 'errors')}">
                                    <g:textField name="nutzer" value="${charakterInstance?.nutzer}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stabilitaet"><g:message code="charakter.stabilitaet.label" default="Stabilitaet" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'stabilitaet', 'errors')}">
                                    <g:textField name="stabilitaet" value="${fieldValue(bean: charakterInstance, field: 'stabilitaet')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="talentwerte"><g:message code="charakter.talentwerte.label" default="Talentwerte" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'talentwerte', 'errors')}">
                                    
<ul>
<g:each in="${charakterInstance?.talentwerte?}" var="t">
    <li><g:link controller="talentwert" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="talentwert" action="create" params="['charakter.id': charakterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'talentwert.label', default: 'Talentwert')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vorteilswerte"><g:message code="charakter.vorteilswerte.label" default="Vorteilswerte" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: charakterInstance, field: 'vorteilswerte', 'errors')}">
                                    
<ul>
<g:each in="${charakterInstance?.vorteilswerte?}" var="v">
    <li><g:link controller="vorteilswert" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="vorteilswert" action="create" params="['charakter.id': charakterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vorteilswert.label', default: 'Vorteilswert')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
