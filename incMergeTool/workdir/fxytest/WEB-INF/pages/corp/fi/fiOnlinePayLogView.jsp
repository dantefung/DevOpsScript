<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiOnlinePayLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiOnlinePayLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiOnlinePayLog" method="post" id="fiOnlinePayLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.orderNo"/>:</th>
    		<td>${fiOnlinePayLog.orderNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.buyerCode"/>:</th>
    		<td>${fiOnlinePayLog.buyerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.companyCode"/>:</th>
    		<td>${fiOnlinePayLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.outTradeNo"/>:</th>
    		<td>${fiOnlinePayLog.outTradeNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.createTime"/>:</th>
    		<td>${fiOnlinePayLog.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.returnTime"/>:</th>
    		<td>${fiOnlinePayLog.returnTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.payResult"/>:</th>
    		<td>${fiOnlinePayLog.payResult }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.tradeNo"/>:</th>
    		<td>${fiOnlinePayLog.tradeNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.totalFee"/>:</th>
    		<td>${fiOnlinePayLog.totalFee }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.returnUrl"/>:</th>
    		<td>${fiOnlinePayLog.returnUrl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.remark"/>:</th>
    		<td>${fiOnlinePayLog.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.createUser"/>:</th>
    		<td>${fiOnlinePayLog.createUser }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.status"/>:</th>
    		<td>${fiOnlinePayLog.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.paymentCode"/>:</th>
    		<td>${fiOnlinePayLog.paymentCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiOnlinePayLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>