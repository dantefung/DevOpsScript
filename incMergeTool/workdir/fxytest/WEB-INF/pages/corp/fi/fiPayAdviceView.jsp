<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="query.money.transfer.notification"/></title>
    <meta name="heading" content="<fmt:message key="query.money.transfer.notification"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="fiPayAdvice" method="post" id="fiPayAdviceForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.orderNo"/>:</th>
    		<td>
    			${fiPayAdvice.adviceCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.company"/>:</th>
    		<td>
    			${fiPayAdvice.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			${fiPayAdvice.userCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mimember.uploadfile.files"/>:</th>
    		<td>
    			<c:if test="${not empty fiPayAdvice.fileUrl }">
					<a href="<c:url value="${fiPayAdvice.fileUrl}"/>" target="_blank" name="attachment"><fmt:message key="lang.view.attachment"/></a>
				</c:if>
				<c:if test="${empty fiPayAdvice.fileUrl }">
					<fmt:message key="bdPinTitleRecord.pinTitle0"/>
				</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>
    			${fn:replace(fiPayAdvice.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="money.tranfer.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdSendRecord.openBank"/>:</th>
    		<td>
    			${fiPayAdvice.bankCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="remittance.bank.branch"/>:</th>
    		<td>
    			${fiPayAdvice.bankBranch }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="remittance.bank.name"/>:</th>
    		<td>
    			${fiPayAdvice.accountName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.fi.pay.advice.account.no"/>:</th>
    		<td>
    			${fiPayAdvice.accountNo }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiPayAdvice.send.date"/>:</th>
    		<td>
    			${fn:substring(fiPayAdvice.payDate,0,10)}
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.remit.orderNo"/>:</th>
    		<td>
    			${fiPayAdvice.remitNo }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdSendRecord.remittanceMoney"/>:</th>
    		<td>
    			${fiPayAdvice.currency }&nbsp;<fmt:formatNumber pattern="###,##0.00">${fiPayAdvice.payAmount }</fmt:formatNumber>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdNetWorkCostReport.rateCH"/>:</th>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${fiPayAdvice.scValue }</fmt:formatNumber>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.pay.in.money"/>:</th>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${fiPayAdvice.scQty }</fmt:formatNumber>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="lang.billing.message"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiPayBankUser.payBank"/>:</th>
    		<td>
    			${fiPayAdvice.targetBankCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.rec.bank.branch"/>:</th>
    		<td>
    			${fiPayAdvice.targetBankBranch }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.rec.bankAccNo"/>:</th>
    		<td>
    			${fiPayAdvice.targetAccountNo }
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="lang.other.msg"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${fiPayAdvice.creatorCode } - ${fiPayAdvice.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${fiPayAdvice.checkerCode } - ${fiPayAdvice.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.cancel.time"/>:</th>
    		<td>${fiPayAdvice.cancelCode } - ${fiPayAdvice.cancelTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="mi_agent_status" value="${fiPayAdvice.status }" /></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiPayAdvices.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>