<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcBalanceDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcBalanceDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcBalance" method="post" id="fiAcBalanceForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.companyCode"/>:</th>
    		<td>${fiAcBalance.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.acType"/>:</th>
    		<td>${fiAcBalance.acType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.memberNo"/>:</th>
    		<td>${fiAcBalance.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.balance"/>:</th>
    		<td>${fiAcBalance.balance }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.freezeBalance"/>:</th>
    		<td>${fiAcBalance.freezeBalance }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalance.status"/>:</th>
    		<td>${fiAcBalance.status }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiAcBalances.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>