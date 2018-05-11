<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="label.history.records"/></title>
	<meta name="heading" content="<fmt:message key="label.history.records"/>" />
</head>

<ul class="nav nav-tabs">
	<li role="presentation">
		<a href="editFiPayAdvice.jhtml?strAction=memberAddFiPayAdvice"><fmt:message key="menu.member.fi.pay.advice"/></a>
	</li>
	<li role="presentation" class="active">
		<a href="fiPayAdvices.jhtml"><fmt:message key="label.history.records"/></a>
	</li>
</ul>

<br/>
<%@ include file="/common/messages.jsp"%>

<%
request.setAttribute("vEnter", "\n");
%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="label.notification.no"/></th>
			<th><fmt:message key="lang.payment.info"/></th>
			<th><fmt:message key="lang.billing.message"/></th>
			<th><fmt:message key="label.pay.in.money"/></th>
			<th><fmt:message key="fi.status"/></th>
			<th><fmt:message key="busi.common.remark"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${fiPayAdvices}" var="fiPayAdviceVar">
			<tr>
				<td>
					${fiPayAdviceVar.advice_code}
					<c:if test="${not empty fiPayAdviceVar.file_url }">
						&nbsp;<a title="<fmt:message key='mimember.uploadfile.files'/>" href="<c:url value="${fiPayAdviceVar.file_url}"/>" target="_blank"><i class="fa fa-file-image-o" aria-hidden="true"></i></a>
					</c:if>
					<br/>
					${fiPayAdviceVar.create_time}
					<c:if test="${fiPayAdviceVar.status==0 }">
					<br/><button type="button" class="btn btn-danger btn-xs" onclick="cancelFiPayAdvice('${fiPayAdviceVar.advice_code}');"><fmt:message key="operation.button.cancel"/></button>
					</c:if>
				</td>
				<td>
					${fiPayAdviceVar.bank_code }<br/>
					${fiPayAdviceVar.bank_branch }<br/>
					**${fn:substring(fiPayAdviceVar.account_name, fn:length(fiPayAdviceVar.account_name)-1, fn:length(fiPayAdviceVar.account_name))}<br/>
					************${fn:substring(fiPayAdviceVar.account_no, fn:length(fiPayAdviceVar.account_no)-4, fn:length(fiPayAdviceVar.account_no))}<br/>
					${fn:substring(fiPayAdviceVar.pay_date,0,10)}
					<p class="text-danger"><strong>${fiPayAdviceVar.currency }&nbsp;<fmt:formatNumber value="${fiPayAdviceVar.pay_amount}" type="number" pattern="###,###,##0.00"/></strong></p>
				</td>
				<td>
					${fiPayAdviceVar.target_bank_code }<br/>
					${fiPayAdviceVar.target_bank_branch }<br/>
					************${fn:substring(fiPayAdviceVar.target_account_no, fn:length(fiPayAdviceVar.target_account_no)-4, fn:length(fiPayAdviceVar.target_account_no))}
				</td>
				<td><p class="text-danger"><strong><fmt:formatNumber pattern="###,##0.00">${fiPayAdviceVar.sc_qty }</fmt:formatNumber></strong></p></td>
				<td>
					<win:code listCode="pay_advice_status" value="${fiPayAdviceVar.status }"/>
				</td>
				<td>
					<em>${fn:replace(fiPayAdviceVar.remark, vEnter, '<br>')}</em>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<form id="fiPayAdviceForm" name="fiPayAdviceForm" action="editFiPayAdvice.jhtml" method="post">
	<input type="hidden" name="strAction"/>
	<input type="hidden" name="adviceCode"/>
</form>

<win:page pageId="fiPayAdvicesPager" action="fiPayAdvices.jhtml" autoIncludeParameters="true"/>

<script type="text/javascript">
$(function() {

});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function cancelFiPayAdvice(adviceCode){
	if(confirm("<fmt:message key='sure.cancel.wire.notification'/>？")){//确认取消当前汇款通知
		var theForm=document.fiPayAdviceForm;
		theForm.strAction.value="memberCalcelFiPayAdvice";
		theForm.adviceCode.value=adviceCode;
		theForm.submit();
		showLoading();
	}
}

</script>