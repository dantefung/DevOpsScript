<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdMergeExchShipDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdMergeExchShipDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdMergeExchShip" method="post" id="pdMergeExchShipForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchShip.exchangeCode"/>:</th>
    		<td>${pdMergeExchShip.exchangeCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchShip.userCode"/>:</th>
    		<td>${pdMergeExchShip.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchShip.siNo"/>:</th>
    		<td>${pdMergeExchShip.siNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchShip.orderNo"/>:</th>
    		<td>${pdMergeExchShip.orderNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchShip.totalPrice"/>:</th>
    		<td>${pdMergeExchShip.totalPrice }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdMergeExchShips.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>