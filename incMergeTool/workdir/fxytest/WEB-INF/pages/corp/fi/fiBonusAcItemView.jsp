<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusAcItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusAcItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAcItem" method="post" id="fiBonusAcItemForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.companyCode"/>:</th>
    		<td>${fiBonusAcItem.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.bonusType"/>:</th>
    		<td>${fiBonusAcItem.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.memberNo"/>:</th>
    		<td>${fiBonusAcItem.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wyear"/>:</th>
    		<td>${fiBonusAcItem.wyear }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wmonth"/>:</th>
    		<td>${fiBonusAcItem.wmonth }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wweek"/>:</th>
    		<td>${fiBonusAcItem.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.orderType"/>:</th>
    		<td>${fiBonusAcItem.orderType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.dealDate"/>:</th>
    		<td>${fiBonusAcItem.dealDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.currencyCode"/>:</th>
    		<td>${fiBonusAcItem.currencyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.money"/>:</th>
    		<td>${fiBonusAcItem.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.notes"/>:</th>
    		<td>${fiBonusAcItem.notes }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.remark"/>:</th>
    		<td>${fiBonusAcItem.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.balance"/>:</th>
    		<td>${fiBonusAcItem.balance }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createrCode"/>:</th>
    		<td>${fiBonusAcItem.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createrName"/>:</th>
    		<td>${fiBonusAcItem.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createTime"/>:</th>
    		<td>${fiBonusAcItem.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.orderNo"/>:</th>
    		<td>${fiBonusAcItem.orderNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.freeze"/>:</th>
    		<td>${fiBonusAcItem.freeze }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.freezeAmt"/>:</th>
    		<td>${fiBonusAcItem.freezeAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.outCode"/>:</th>
    		<td>${fiBonusAcItem.outCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.bname"/>:</th>
    		<td>${fiBonusAcItem.bname }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.payTime"/>:</th>
    		<td>${fiBonusAcItem.payTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="itemId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusAcItems.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>