<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miChangeLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miChangeLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miChangeLog" method="post" id="miChangeLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLog.companyCode"/>:</th>
    		<td>${miChangeLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLog.userCode"/>:</th>
    		<td>${miChangeLog.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLog.changerCode"/>:</th>
    		<td>${miChangeLog.changerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLog.changeTime"/>:</th>
    		<td>${miChangeLog.changeTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLog.remark"/>:</th>
    		<td>${miChangeLog.remark }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="changeCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miChangeLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>