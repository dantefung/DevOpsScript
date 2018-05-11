<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusDeductplanDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusDeductplanDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusDeductplan" method="post" id="fiBonusDeductplanForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.userCode"/>:</th>
    		<td>${fiBonusDeductplan.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.companyCode"/>:</th>
    		<td>${fiBonusDeductplan.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.amount"/>:</th>
    		<td>${fiBonusDeductplan.amount }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.startTime"/>:</th>
    		<td>${fiBonusDeductplan.startTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.endTime"/>:</th>
    		<td>${fiBonusDeductplan.endTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.bonusType"/>:</th>
    		<td>${fiBonusDeductplan.bonusType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.deductPercent"/>:</th>
    		<td>${fiBonusDeductplan.deductPercent }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.orderType"/>:</th>
    		<td>${fiBonusDeductplan.orderType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.notes"/>:</th>
    		<td>${fiBonusDeductplan.notes }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.remark"/>:</th>
    		<td>${fiBonusDeductplan.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.status"/>:</th>
    		<td>${fiBonusDeductplan.status }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.deductAmt"/>:</th>
    		<td>${fiBonusDeductplan.deductAmt }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.createrCode"/>:</th>
    		<td>${fiBonusDeductplan.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.createrName"/>:</th>
    		<td>${fiBonusDeductplan.createrName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.createTime"/>:</th>
    		<td>${fiBonusDeductplan.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.checkerCode"/>:</th>
    		<td>${fiBonusDeductplan.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.checkerName"/>:</th>
    		<td>${fiBonusDeductplan.checkerName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.checkTime"/>:</th>
    		<td>${fiBonusDeductplan.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusDeductplan.fileDirect"/>:</th>
    		<td>${fiBonusDeductplan.fileDirect }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiBonusDeductplans.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>