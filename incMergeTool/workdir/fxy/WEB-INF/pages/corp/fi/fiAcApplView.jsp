<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.cashWithdrawAppMgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.cashWithdrawAppMgr"/>"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="fiAcAppl" method="post" id="fiAcApplForm">
    
	    <table class="detail">
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMemberApalyCheck.askForNo"/>:</th>
	    		<td>
	    			${fiAcAppl.applNo }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="label.company"/>:</th>
	    		<td>
	    			${fiAcAppl.companyCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.memberNo"/>:</th>
	    		<td>
	    			${fiAcAppl.memberNo }
	    			<c:if test="${miMember.isCredit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.app.withDraw.amt"/>:</th>
	    		<td>${fiAcAppl.amount }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mem.bd.charge"/>:</th>
	    		<td>${fiAcAppl.fees }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.real.amt"/>:</th>
	    		<td>${fiAcAppl.sendAmt }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="bdSendRemittanceReport.openBankCH"/>:</th>
	    		<td><win:code listCode="bankcodes" value="${fiAcAppl.openBank }"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.bank.branch"/>:</th>
	    		<td>${fiAcAppl.bbranch }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.bankAcc.name"/>:</th>
	    		<td>${fiAcAppl.bname }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.common.acc"/>:</th>
	    		<td>${fiAcAppl.bnum }</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="lang.other.msg"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="member.stuts"/>:</th>
	    		<td>
	    			<win:code listCode="coin2kmc_appl_status" value="${fiAcAppl.status }"/>
	    		</td>
	    	</tr>
	    	<c:if test="${not empty fiAcAppl.memo }">
		    	<tr>
		    		<th><fmt:message key="busi.common.remark"/>:</th>
		    		<td>${fn:replace(fiAcAppl.memo, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
	    	<tr>
	    		<th><fmt:message key="pd.createTime"/>:</th>
	    		<td>${fiAcAppl.createrCode } - ${fiAcAppl.createTime }</td>
	    	</tr>
	    	<c:if test="${fiAcAppl.status==1 || fiAcAppl.status==3 || fiAcAppl.status==4}">
		    	<tr>
		    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
		    		<td>${fiAcAppl.checkerCode } - ${fiAcAppl.checkTime }</td>
		    	</tr>
	    	</c:if>
	    	<c:if test="${fiAcAppl.status==9}">
		    	<tr>
		    		<th><fmt:message key="lang.return.time"/>:</th>
		    		<td>${fiAcAppl.returnCode } - ${fiAcAppl.returnTime }</td>
		    	</tr>
		    	<c:if test="${not empty fiAcAppl.returnRemark }">
			    	<tr>
			    		<th><fmt:message key="lang.return.remark"/>:</th>
			    		<td>${fn:replace(fiAcAppl.returnRemark, vEnter, '<br>')}</td>
			    	</tr>
		    	</c:if>
	    	</c:if>
	    	<c:if test="${fiAcAppl.status==3 || fiAcAppl.status==4}">
		    	<tr>
		    		<th><fmt:message key="lang.deal.time"/>:</th>
		    		<td>${fiAcAppl.sendCode } - ${fiAcAppl.sendTime }</td>
		    	</tr>
		    	<c:if test="${not empty fiAcAppl.falseReason }">
			    	<tr>
			    		<th><fmt:message key="lang.reason.of.fail"/>:</th>
			    		<td>${fn:replace(fiAcAppl.falseReason, vEnter, '<br>')}</td>
			    	</tr>
		    	</c:if>
	    	</c:if>
	    	<c:if test="${param.strAction=='failFiAcAppl' }">
	    	<tr>
	    		<th><fmt:message key="lang.reason.of.fail"/>:</th>
	    		<td><form:textarea path="falseReason" cols="60" rows="4"/></td>
	    	</tr>
	    	</c:if>
	    	
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<button type="button" name="cancel" onclick="window.location='fiAcAppls.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>