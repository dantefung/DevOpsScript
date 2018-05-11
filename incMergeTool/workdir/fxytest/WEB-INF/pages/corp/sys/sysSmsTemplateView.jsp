<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="sysSmsTemplateList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.sys.listSysSmsTemplates"/>"/>
</head>

<form:form commandName="sysSmsTemplate" method="post" action="editsysSmsTemplate.jhtml" onsubmit="return validateTheForm(this)" id="sysSmsTemplateForm">
<%
request.setAttribute("vEnter", "\n");
%>
<form:hidden path="templateId"/>
<table class='detail'>
    <tr><th>
        <fmt:message  key="bdReconsumMoneyReport.company"/>:
    </th>
    <td>
        ${sysSmsTemplate.companyCode}
    </td></tr>
    
    <tr><th>
        <fmt:message  key="sysDataLog.changeType"/>:
    </th>
    <td>
    	<win:code listCode="sms_type" value="${sysSmsTemplate.typeId}"/>
    </td>
    </tr>

	<tr><th>
        <fmt:message  key="fiBankbookTemp.createrCode"/>:
    </th>
    <td>
    	${sysSmsTemplate.creatorCode}
    </td></tr>
    
    <tr><th>
        <fmt:message  key="fiShopAcTemp.createrName"/>:
    </th>
    <td>
    	${sysSmsTemplate.creatorName}
    </td></tr>
    <tr><th>
        创建时间:
    </th>
    <td>
        ${sysSmsTemplate.createTime}
    </td></tr>
    <tr><th>
        内容:
    </th>
    <td>
    	${sysSmsTemplate.content}
    </td></tr>
    <tr><th class="command">
        &nbsp;
    </th>
    <td class="command">
		<button type="button" name="cancel" onclick="window.location='sysSmsTemplates.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    </td></tr>

</table>
</form:form>
