
<%@ page import="uts.chargen.Charakter" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'charakter.label', default: 'Charakter')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'charakter.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'charakter.name.label', default: 'Name')}" />
                        
                            <th><g:message code="charakter.avatar.label" default="Avatar" /></th>
                        
                            <g:sortableColumn property="energie" title="${message(code: 'charakter.energie.label', default: 'Energie')}" />
                        
                            <g:sortableColumn property="leben" title="${message(code: 'charakter.leben.label', default: 'Leben')}" />
                        
                            <g:sortableColumn property="nutzer" title="${message(code: 'charakter.nutzer.label', default: 'Nutzer')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${charakterInstanceList}" status="i" var="charakterInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${charakterInstance.id}">${fieldValue(bean: charakterInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: charakterInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: charakterInstance, field: "avatar")}</td>
                        
                            <td>${fieldValue(bean: charakterInstance, field: "energie")}</td>
                        
                            <td>${fieldValue(bean: charakterInstance, field: "leben")}</td>
                        
                            <td>${fieldValue(bean: charakterInstance, field: "nutzer")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${charakterInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
