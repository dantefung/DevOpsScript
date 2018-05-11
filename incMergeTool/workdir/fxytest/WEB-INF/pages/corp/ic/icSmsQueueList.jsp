<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icSmsQueueList.title"/></title>
    <meta name="heading" content="<fmt:message key="icSmsQueueList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icSmsQueues.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/></dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcSmsQueues"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icSmsQueueFunctionForm" id="icSmsQueueFunctionForm" action="editIcSmsQueue.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcSmsQueue">
				<a href="editIcSmsQueue.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcSmsQueue">
				<a href="javascript:multiDeleteIcSmsQueue()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedQueueIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icSmsQueueListTableForm" method="get" >
		testtesttest.....
		<ec:table 
			tableId="icSmsQueueListTable"
			items="icSmsQueues"
			var="icSmsQueueVar"
			action="icSmsQueues.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icSmsQueueListTableForm">
			<ec:row>
				<ec:column alias="chkQueueId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkQueueId" value="${icSmsQueueVar.queueId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcSmsQueue">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcSmsQueue.jhtml?strAction=editIcSmsQueue&queueId=${icSmsQueueVar.queueId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="queueId" title="icSmsQueue.queueId" />
				<ec:column property="companyCode" title="icSmsQueue.companyCode" />
				<ec:column property="senderCode" title="icSmsQueue.senderCode" />
				<ec:column property="rcptCode" title="icSmsQueue.rcptCode" />
				<ec:column property="rcptMobile" title="icSmsQueue.rcptMobile" />
				<ec:column property="sendTime" title="icSmsQueue.sendTime" />
				<ec:column property="sendStatus" title="icSmsQueue.sendStatus" />
				<ec:column property="returnMsg" title="icSmsQueue.returnMsg" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcSmsQueue(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkQueueId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icSmsQueueFunctionForm;
	theForm.selectedQueueIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcSmsQueue";
	
	showLoading();
	theForm.submit();
}
</script>