<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.acc.deduct.mgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.acc.deduct.mgr"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcChange" method="post" id="fiAcChangeForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="deduction.no"/>:</th>
    		<td>${fiAcChange.changeNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="deduction.acc"/>:</th>
    		<td><win:code listCode="bank_account_types" value="${fiAcChange.acType }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${fiAcChange.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.reasonOfDeduction"/>:</th>
    		<td><win:code listCode="fi_ac_change_reason" value="${fiAcChange.reason }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="comm.busi.deal.transaction.date"/>:</th>
    		<td>${fiAcChange.dealDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="stStockLog.changeQty"/>:</th>
    		<td>${fiAcChange.money }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><pre>${fiAcChange.remark }</pre></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poSell.notes"/>:</th>
    		<td><pre>${fiAcChange.memo }</pre></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${fiAcChange.createrCode } - ${fiAcChange.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${fiAcChange.checkerCode } - ${fiAcChange.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.checked"/>:</th>
    		<td><win:code listCode="yesno" value="${fiAcChange.status }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.muti.import.batch.no"/>:</th>
    		<td>${fiAcChange.createNo }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiAcChanges.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>