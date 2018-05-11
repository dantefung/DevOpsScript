<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="邮件模板管理"/></title>
    <meta name="heading" content="<fmt:message key="邮件模板管理"/>"/>
</head>

<form:form commandName="sysMailTemplate" method="post" action="editSysMailTemplate.jhtml" onsubmit="return validateTheForm(this)" id="sysMailTemplateForm">
<%
request.setAttribute("vEnter", "\n");
%>
<table class='detail'>

<form:hidden path="templateId"/>
    <tr><th>
        <fmt:message  key="bdReconsumMoneyReport.company"/>：
    </th>
    <td align="left">
        ${sysMailTemplate.companyCode}
    </td></tr>
    
    <tr><th>
        <fmt:message  key="sysDataLog.changeType"/>：
    </th>
    <td align="left">
    	<win:code listCode="email_type" value="${sysMailTemplate.typeId}"/>
    </td>
    </tr>

	<tr><th>
        <fmt:message  key="mail.sender.email"/>：
    </th>
    <td align="left">
    	${sysMailTemplate.fromEmail}
    </td></tr>
    
    <tr><th>
        <fmt:message  key="mail.sender.name"/>：
    </th>
    <td align="left">
    	${sysMailTemplate.fromName}
    </td></tr>
    <tr><th>
        <fmt:message  key="mail.sender.secredtSend"/>：
    </th>
    <td align="left">
        ${sysMailTemplate.secretSend}
    </td></tr>
    <tr><th>
        邮件标题：
    </th>
    <td align="left">
    	${sysMailTemplate.mailTitle}
    </td></tr>
    
    <tr><th>
        <fmt:message  key="label.text.content"/>：
    </th>
    <td align="left">
    	${fn:replace(sysMailTemplate.textContent, vEnter, '<br>')}
    </td></tr>

    <tr><th>
        <fmt:message  key="label.html.content"/>：
    </th>
    <td align="left">
    	${sysMailTemplate.htmlContent}
    </td></tr>
    
    <tr><th class="command">
       &nbsp;
    </th>
    <td class="command">
		<button type="button" name="cancel" onclick="window.location='sysMailTemplates.jhtml?strAction=listSysMailTemplates&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    </td></tr>

</table>
</form:form>