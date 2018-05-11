<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockAdjustDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockAdjustDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stStockAdjustDetail" method="post" id="stStockAdjustDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockAdjustDetail.adjustCode"/>:</th>
    		<td>${stStockAdjustDetail.adjustCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockAdjustDetail.productCode"/>:</th>
    		<td>${stStockAdjustDetail.productCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockAdjustDetail.adjustQty"/>:</th>
    		<td>${stStockAdjustDetail.adjustQty }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='stStockAdjustDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>