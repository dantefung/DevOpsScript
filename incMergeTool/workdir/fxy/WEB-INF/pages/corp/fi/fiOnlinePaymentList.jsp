<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="online.payment.method.mgr"/></title>
    <meta name="heading" content="<fmt:message key="online.payment.method.mgr"/>"/>
</head>

<div class="contentBody">
	<form name="fiOnlinePaymentFunctionForm" id="fiOnlinePaymentFunctionForm" action="editFiOnlinePayment.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiOnlinePayment">
				<a href="editFiOnlinePayment.jhtml?strAction=addFiOnlinePayment" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedPaymentIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiOnlinePaymentListTableForm" method="get" >
		<ec:table 
			tableId="fiOnlinePaymentListTable"
			items="fiOnlinePayments"
			var="fiOnlinePaymentVar"
			action="fiOnlinePayments.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiOnlinePaymentListTableForm">
			<ec:row>
				<win:power powerCode="editFiOnlinePayment">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" styleClass="centerColumn">
						<a href="editFiOnlinePayment.jhtml?strAction=editFiOnlinePayment&paymentId=${fiOnlinePaymentVar.paymentId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				<ec:column property="paymentCode" title="lang.code" />
				<ec:column property="paymentName" title="lang.payment.method" />
				<ec:column property="status" title="fi.status">
					<win:code listCode="online_payment_status" value="${fiOnlinePaymentVar.status }"/>
				</ec:column>
				<ec:column property="creatorCode" title="pmProductSppm.createUser" />
				<ec:column property="createTime" title="pd.createTime" />
				<ec:column property="editorCode" title="lang.last.editor" />
				<ec:column property="editTime" title="lang.last.edit.time" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>