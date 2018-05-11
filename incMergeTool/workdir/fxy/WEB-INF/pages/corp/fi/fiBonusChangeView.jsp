<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusChangeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusChangeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusChange" method="post" id="fiBonusChangeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.companyCode"/>:</th>
    		<td>${fiBonusChange.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.bonusType"/>:</th>
    		<td>${fiBonusChange.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.memberNo"/>:</th>
    		<td>${fiBonusChange.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.orderType"/>:</th>
    		<td>${fiBonusChange.orderType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.dealDate"/>:</th>
    		<td>${fiBonusChange.dealDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.currencyCode"/>:</th>
    		<td>${fiBonusChange.currencyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.money"/>:</th>
    		<td>${fiBonusChange.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.notes"/>:</th>
    		<td>${fiBonusChange.notes }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.remark"/>:</th>
    		<td>${fiBonusChange.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.createrCode"/>:</th>
    		<td>${fiBonusChange.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.createrName"/>:</th>
    		<td>${fiBonusChange.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.createTime"/>:</th>
    		<td>${fiBonusChange.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.outCode"/>:</th>
    		<td>${fiBonusChange.outCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.checkerCode"/>:</th>
    		<td>${fiBonusChange.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.checkerName"/>:</th>
    		<td>${fiBonusChange.checkerName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.checkTime"/>:</th>
    		<td>${fiBonusChange.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.status"/>:</th>
    		<td>${fiBonusChange.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.balType"/>:</th>
    		<td>${fiBonusChange.balType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.changeType"/>:</th>
    		<td>${fiBonusChange.changeType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.createNo"/>:</th>
    		<td>${fiBonusChange.createNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.wweek"/>:</th>
    		<td>${fiBonusChange.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusChange.wmonth"/>:</th>
    		<td>${fiBonusChange.wmonth }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="itemId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusChanges.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>