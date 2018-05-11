<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<head>
    <title><fmt:message key="ic.message.dustbin.title"/></title>
    <meta name="heading" content="<fmt:message key="ic.message.dustbin.title"/>"/>
</head>

<%@ include file="/WEB-INF/pages/member/ic/ic_message_nav.jsp"%>

<form method="get" action="ic_message_trashbox.jhtml" onsubmit="return validateSearch(this)">
	<table>
		<tr>
			<td>
			<fmt:message key="ic.lable.send.date.extent"/>：<fmt:message key="ic.lable.from"/> <input type="text" name="startSendDate" id="startSendDate" value="${param.startSendDate }" size="10"/> 
			<fmt:message key="ic.lable.to"/> <input type="text" name="endSendDate" id="endSendDate" value="${param.endSendDate }" size="10"/>
			</td>
			<td>
			<fmt:message key="ic.lable.key.word"/><input type="text" name="keyword" id="keyword" value="${param.keyword }"/>
			</td>
			<td>
			<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			<input type="hidden" name="strAction" value="memberIcMessageInbox"/>
			</td>
		</tr>
	</table>
</form>

<div class="contentBody">
	<form id="icMessageListTableForm" method="get" >
		<ec:table 
			tableId="icMessageListTable"
			items="icMessages"
			var="icMessageVar"
			action="ic_message_trashbox.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageListTableForm">
			<ec:row style="${rowStyle }">
				<win:power powerCode="memberViewIcMessage">
					<ec:column property="1" title="function.menu.view" sortable="false" width="20" styleClass="centerColumn">
						<a href="view_ic_message.jhtml?strAction=memberViewIcMessage&messageId=${icMessageVar.message_id}" name="view"><fmt:message key="function.menu.view"/></a>
					</ec:column>
				</win:power>
				<ec:column property="title" title="icInformation.title" />
				<ec:column property="sender_code" title="amSiteMessage.senderName" />
				<ec:column property="send_time" title="sysSmsQueueRcpt.sentDate" width="120" styleClass="centerColumn"/>
				<ec:column property="view_time" title="ic.lable.read.yesorno" width="80" styleClass="centerColumn">
					<c:if test="${empty icMessageVar.view_time }"><font color="red"><fmt:message key="ic.lable.read.no"/></font></c:if>
					<c:if test="${not empty icMessageVar.view_time }">
						<fmt:message key="ic.lable.read.yes"/>
					</c:if>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startSendDate,#endSendDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcMessage(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMessageId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icMessageFunctionForm;
	theForm.selectedMessageIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcMessage";
	
	showLoading();
	theForm.submit();
}
</script>