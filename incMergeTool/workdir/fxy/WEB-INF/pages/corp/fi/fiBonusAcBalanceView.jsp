<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusAcBalanceDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusAcBalanceDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAcBalance" method="post" id="fiBonusAcBalanceForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.companyCode"/>:</th>
    		<td>${fiBonusAcBalance.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.bonusType"/>:</th>
    		<td>${fiBonusAcBalance.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.memberNo"/>:</th>
    		<td>${fiBonusAcBalance.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.currencyCode"/>:</th>
    		<td>${fiBonusAcBalance.currencyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.balance"/>:</th>
    		<td>${fiBonusAcBalance.balance }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.freezeAmt"/>:</th>
    		<td>${fiBonusAcBalance.freezeAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.status"/>:</th>
    		<td>${fiBonusAcBalance.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.sendPercent"/>:</th>
    		<td>${fiBonusAcBalance.sendPercent }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.sendLow"/>:</th>
    		<td>${fiBonusAcBalance.sendLow }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.remark"/>:</th>
    		<td>${fiBonusAcBalance.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.sortNo"/>:</th>
    		<td>${fiBonusAcBalance.sortNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.lastEditorCode"/>:</th>
    		<td>${fiBonusAcBalance.lastEditorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.lastEditorName"/>:</th>
    		<td>${fiBonusAcBalance.lastEditorName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.lastEitTime"/>:</th>
    		<td>${fiBonusAcBalance.lastEitTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcBalance.availBalance"/>:</th>
    		<td>${fiBonusAcBalance.availBalance }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusAcBalances.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>