<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmStatusLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmStatusLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmStatusLog" method="post" id="pmStatusLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.productId"/>:</th>
    		<td>${pmStatusLog.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.newStatus"/>:</th>
    		<td>${pmStatusLog.newStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.editorCode"/>:</th>
    		<td>${pmStatusLog.editorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.editTime"/>:</th>
    		<td>${pmStatusLog.editTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.editReason"/>:</th>
    		<td>${pmStatusLog.editReason }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmStatusLog.receiptCode"/>:</th>
    		<td>${pmStatusLog.receiptCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pmStatusLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>