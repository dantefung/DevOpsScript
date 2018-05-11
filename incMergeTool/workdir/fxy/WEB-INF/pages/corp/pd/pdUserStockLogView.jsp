<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdUserStockLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdUserStockLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdUserStockLog" method="post" id="pdUserStockLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.companyCode"/>:</th>
    		<td>${pdUserStockLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.userCode"/>:</th>
    		<td>${pdUserStockLog.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.productId"/>:</th>
    		<td>${pdUserStockLog.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.qty"/>:</th>
    		<td>${pdUserStockLog.qty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.leftQty"/>:</th>
    		<td>${pdUserStockLog.leftQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.creatorCode"/>:</th>
    		<td>${pdUserStockLog.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.createTime"/>:</th>
    		<td>${pdUserStockLog.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStockLog.changeSource"/>:</th>
    		<td>${pdUserStockLog.changeSource }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdUserStockLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>