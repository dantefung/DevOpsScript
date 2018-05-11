<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageList.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icMessages.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/></dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcMessages"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icMessageFunctionForm" id="icMessageFunctionForm" action="editIcMessage.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcMessage">
				<a href="editIcMessage.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcMessage">
				<a href="javascript:multiDeleteIcMessage()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedMessageIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icMessageListTableForm" method="get" >
		<ec:table 
			tableId="icMessageListTable"
			items="icMessages"
			var="icMessageVar"
			action="icMessages.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageListTableForm">
			<ec:row>
				<ec:column alias="chkMessageId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkMessageId" value="${icMessageVar.messageId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcMessage">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcMessage.jhtml?strAction=editIcMessage&messageId=${icMessageVar.messageId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="messageId" title="icMessage.messageId" />
				<ec:column property="companyCode" title="icMessage.companyCode" />
				<ec:column property="senderCode" title="icMessage.senderCode" />
				<ec:column property="rcptType" title="icMessage.rcptType" />
				<ec:column property="title" title="icMessage.title" />
				<ec:column property="content" title="icMessage.content" />
				<ec:column property="sendTime" title="icMessage.sendTime" />
				<ec:column property="replyId" title="icMessage.replyId" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
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