<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdUserStockDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdUserStockDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdUserStock" method="post" id="pdUserStockForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStock.companyCode"/>:</th>
    		<td>${pdUserStock.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStock.userCode"/>:</th>
    		<td>${pdUserStock.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStock.productId"/>:</th>
    		<td>${pdUserStock.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStock.qty"/>:</th>
    		<td>${pdUserStock.qty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdUserStock.avaibleQty"/>:</th>
    		<td>${pdUserStock.avaibleQty }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="stockId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdUserStocks.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>