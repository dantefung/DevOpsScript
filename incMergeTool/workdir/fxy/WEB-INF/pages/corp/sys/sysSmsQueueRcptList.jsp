<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsQueueRcptList.title"/></title>
    <meta name="heading" content="<fmt:message key="icSmsQueueList.list"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysSmsQueueRcpts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="miMember.delivery.moblie"/></dt>
			<dd><input type="text" name ="toMobile" value="${param.toMobile}"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="amEmail.isSent"/></dt>
			<dd><win:list name="isSent" listCode="yesno" defaultValue="" value="${param.isSent }" showBlankLine="true"/> </dd>
		</dl>
		<dl>
			<dt><fmt:message key="fiPayAdvice.userCode"/></dt>
			<dd><input type="text" name ="toUserCode" value="${param.toUserCode }"/> </dd>
		</dl>
		<dl>
			<dt><fmt:message key="sys.recieve.name"/></dt>
			<dd><input type="text" name ="toName" value="${param.toName}"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="sysSmsQueueRcpts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
 
	
	<form id="sysSmsQueueRcptListTableForm" method="get" >
		<ec:table 
			tableId="sysSmsQueueRcptListTable"
			items="sysSmsQueueRcpts"
			var="sysSmsQueueRcptVar"
			action="sysSmsQueueRcpts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysSmsQueueRcptListTableForm">
			<ec:row>
				<ec:column property="company_code" title="ic.company.code" />
				<ec:column property="to_user_code" title="ic.receiver.no" />
				<ec:column property="to_name" title="ic.receiver.name" />
				<ec:column property="to_mobile" title="ic.receive.mobile.no" />
				<ec:column property="content" title="ic.sms.sent.content" />
				<ec:column property="is_sent" title="ic.sms.is.send" styleClass="centerColumn">
					<win:code listCode="yesno" value="${sysSmsQueueRcptVar.is_sent }"></win:code>
				</ec:column>
				<ec:column property="create_time" title="ic.sms.record.create.time" />
				<ec:column property="sent_date" title="ic.sms.record.send.time" />
				<ec:column property="retry_times" title="ic.sms.record.retry.times" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysSmsQueueRcpt(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRcptId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysSmsQueueRcptFunctionForm;
	theForm.selectedRcptIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysSmsQueueRcpt";
	
	showLoading();
	theForm.submit();
}
</script>