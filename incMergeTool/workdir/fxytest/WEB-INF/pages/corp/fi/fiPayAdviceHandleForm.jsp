<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.money.wiring.mgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.money.wiring.mgr"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="fiPayAdvice" method="post" action="handleFiPayAdvice.jhtml" onsubmit="return validateForm(this)" id="fiPayAdviceForm" name="fiPayAdviceForm">
    
    <spring:bind path="fiPayAdvice.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
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
    		<th><fmt:message key="fiPayAdvice.send.date"/>:</th>
    		<td>
    			${fn:substring(fiPayAdvice.payDate,0,10)}
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
    		<td colspan="2" class="title"><fmt:message key="money.transfer.acc.info"/></td>
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
    		<td colspan="2" class="title"><fmt:message key="money.rec.acc.info"/></td>
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
    		<th><fmt:message key="mimember.uploadfile.files"/>:</th>
    		<td>
    			<c:if test="${not empty fiPayAdvice.fileUrl }">
					<a href="<c:url value="${fiPayAdvice.fileUrl}"/>" target="_blank" name="attachment"><fmt:message key="lang.view.attachment"/></a>
				</c:if>
				<c:if test="${empty fiPayAdvice.fileUrl }">
					无
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
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${fiPayAdvice.creatorCode } - ${fiPayAdvice.createTime }</td>
    	</tr>
    	<c:if test="${fiPayAdvice.status==1 }">
	    	<tr>
	    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
	    		<td>${fiPayAdvice.checkerCode } - ${fiPayAdvice.checkTime }</td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedAdviceCodes" id="selectedAdviceCodes" value="${fiPayAdvice.adviceCode }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${fiPayAdvice.status==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkFiPayAdvice' }">
	    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="po.lpstatus.2"/></button>
	    					</c:if>
	    					<c:if test="${param.strAction=='calcelFiPayAdvice' }">
	    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="cancel.pay.advice"/></button>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='fiPayAdvices.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkFiPayAdvice' }">
	<c:set var="confirmMsg"><fmt:message key="lang.confirmPayAdviceToAudit"/></c:set>
</c:if>
<c:if test="${param.strAction=='calcelFiPayAdvice' }">
	<c:set var="confirmMsg"><fmt:message key="lang.confimPayAdviceToCancel"/></c:set>
</c:if>
    	
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(!confirm("${confirmMsg}？")){
		return false;
	}
	showLoading();
	return true;
}
</script>