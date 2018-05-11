<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdExchangePayLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdExchangePayLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdExchangePayLog" method="post" id="pdExchangePayLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangePayLog.exchangeCode"/>:</th>
    		<td>${pdExchangePayLog.exchangeCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangePayLog.paymentMethod"/>:</th>
    		<td>${pdExchangePayLog.paymentMethod }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangePayLog.accountType"/>:</th>
    		<td>${pdExchangePayLog.accountType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangePayLog.money"/>:</th>
    		<td>${pdExchangePayLog.money }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdExchangePayLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>