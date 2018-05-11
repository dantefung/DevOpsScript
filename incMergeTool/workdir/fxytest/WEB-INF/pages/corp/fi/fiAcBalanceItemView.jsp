<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcBalanceItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcBalanceItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcBalanceItem" method="post" id="fiAcBalanceItemForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.companyCode"/>:</th>
    		<td>${fiAcBalanceItem.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.acType"/>:</th>
    		<td>${fiAcBalanceItem.acType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.memberNo"/>:</th>
    		<td>${fiAcBalanceItem.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.orderType"/>:</th>
    		<td>${fiAcBalanceItem.orderType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.reason"/>:</th>
    		<td>${fiAcBalanceItem.reason }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.dealDate"/>:</th>
    		<td>${fiAcBalanceItem.dealDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.money"/>:</th>
    		<td>${fiAcBalanceItem.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.remark"/>:</th>
    		<td>${fiAcBalanceItem.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.memo"/>:</th>
    		<td>${fiAcBalanceItem.memo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.balance"/>:</th>
    		<td>${fiAcBalanceItem.balance }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.createrCode"/>:</th>
    		<td>${fiAcBalanceItem.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.createTime"/>:</th>
    		<td>${fiAcBalanceItem.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.orderNo"/>:</th>
    		<td>${fiAcBalanceItem.orderNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.outCode"/>:</th>
    		<td>${fiAcBalanceItem.outCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.bname"/>:</th>
    		<td>${fiAcBalanceItem.bname }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wmonth"/>:</th>
    		<td>${fiAcBalanceItem.wmonth }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wweek"/>:</th>
    		<td>${fiAcBalanceItem.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wday"/>:</th>
    		<td>${fiAcBalanceItem.wday }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiAcBalanceItems.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>