<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poShipUpdateLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="poShipUpdateLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poShipUpdateLog" method="post" id="poShipUpdateLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipId"/>:</th>
    		<td>${poShipUpdateLog.shipId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.companyCode"/>:</th>
    		<td>${poShipUpdateLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.orderId"/>:</th>
    		<td>${poShipUpdateLog.orderId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.recptCode"/>:</th>
    		<td>${poShipUpdateLog.recptCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipType"/>:</th>
    		<td>${poShipUpdateLog.shipType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipFirstName"/>:</th>
    		<td>${poShipUpdateLog.shipFirstName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipLastName"/>:</th>
    		<td>${poShipUpdateLog.shipLastName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAreaCode"/>:</th>
    		<td>${poShipUpdateLog.shipAreaCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAddress1"/>:</th>
    		<td>${poShipUpdateLog.shipAddress1 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAddress2"/>:</th>
    		<td>${poShipUpdateLog.shipAddress2 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipZipCode"/>:</th>
    		<td>${poShipUpdateLog.shipZipCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipPhone"/>:</th>
    		<td>${poShipUpdateLog.shipPhone }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipMobile"/>:</th>
    		<td>${poShipUpdateLog.shipMobile }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.creatorCode"/>:</th>
    		<td>${poShipUpdateLog.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.createTime"/>:</th>
    		<td>${poShipUpdateLog.createTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='poShipUpdateLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>