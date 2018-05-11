<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stStock" method="post" id="stStockForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStock.companyCode"/>:</th>
    		<td>${stStock.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStock.warehouseCode"/>:</th>
    		<td>${stStock.warehouseCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStock.productCode"/>:</th>
    		<td>${stStock.productCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStock.totalQty"/>:</th>
    		<td>${stStock.totalQty }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="stockId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='stStocks.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>