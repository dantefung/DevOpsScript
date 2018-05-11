<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stStockLog" method="post" id="stStockLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.companyCode"/>:</th>
    		<td>${stStockLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.warehouseCode"/>:</th>
    		<td>${stStockLog.warehouseCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.productCode"/>:</th>
    		<td>${stStockLog.productCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.changeQty"/>:</th>
    		<td>${stStockLog.changeQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.leftQty"/>:</th>
    		<td>${stStockLog.leftQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.changeSource"/>:</th>
    		<td>${stStockLog.changeSource }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.sourceOrderNo"/>:</th>
    		<td>${stStockLog.sourceOrderNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.createTime"/>:</th>
    		<td>${stStockLog.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.creatorCode"/>:</th>
    		<td>${stStockLog.creatorCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='stStockLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>