<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderPayLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderPayLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poOrderPayLog" method="post" id="poOrderPayLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderPayLog.orderId"/>:</th>
    		<td>${poOrderPayLog.orderId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderPayLog.paymentMethod"/>:</th>
    		<td>${poOrderPayLog.paymentMethod }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderPayLog.accountType"/>:</th>
    		<td>${poOrderPayLog.accountType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderPayLog.money"/>:</th>
    		<td>${poOrderPayLog.money }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='poOrderPayLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>