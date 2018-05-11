<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysLoginLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysLoginLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysLoginLog" method="post" id="sysLoginLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysLoginLog.userCode"/>:</th>
    		<td>${sysLoginLog.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysLoginLog.loginTime"/>:</th>
    		<td>${sysLoginLog.loginTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysLoginLog.clientIp"/>:</th>
    		<td>${sysLoginLog.clientIp }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='sysLoginLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>