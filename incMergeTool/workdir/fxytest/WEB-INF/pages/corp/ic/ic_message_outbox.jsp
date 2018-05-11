<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="ic.lable.out.boxes"/></title>
    <meta name="heading" content="<fmt:message key="ic.lable.out.boxes"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="ic_message_outbox.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="ic.lable.send.date.extent"/></dd>
			<dd>
				<fmt:message key="ic.lable.from"/> <input type="text" name="startSendDate" id="startSendDate" value="${param.startSendDate }" size="10"/> 
				<fmt:message key="ic.lable.to"/> <input type="text" name="endSendDate" id="endSendDate" value="${param.endSendDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="ic.lable.key.word"/></dd>
			<dd>
				<input type="text" name="keyword" id="keyword" value="${param.keyword }"/>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="icMessageOutbox"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="icMessageListTableForm" method="get" >
		<ec:table 
			tableId="icMessageListTable"
			items="icMessages"
			var="icMessageVar"
			action="ic_message_outbox.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageListTableForm">
			<ec:row>
				<win:power powerCode="viewIcMessage">
					<ec:column property="1" title="function.menu.view" sortable="false" width="20" styleClass="centerColumn">
						<a href="view_ic_message.jhtml?strAction=viewIcMessage&messageId=${icMessageVar.messageId}" name="view"><fmt:message key="function.menu.view"/></a>
					</ec:column>
				</win:power>
				<ec:column property="title" title="icInformation.title" />
				<ec:column property="rcptType" title="amSiteMessage.receiverName">
					<c:if test="${icMessageVar.rcptType=='C'}"><fmt:message key="user_type.C"/></c:if>
					<c:if test="${icMessageVar.rcptType!='C'}">
						<c:forEach items="${icMessageVar.icMessageRcpts}" var="icMessageRcptVar">
							 ${icMessageRcptVar.rcptCode }
						</c:forEach>
					</c:if>
				</ec:column>
				<ec:column property="sendTime" title="amSiteMessage.sendTime" styleClass="centerColumn" width="120">
					<fmt:formatDate value="${icMessageVar.sendTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
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