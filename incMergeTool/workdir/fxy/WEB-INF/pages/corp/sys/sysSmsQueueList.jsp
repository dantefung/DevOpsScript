<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsQueueList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSmsQueueList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysSmsQueues.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysSmsQueues"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysSmsQueueFunctionForm" id="sysSmsQueueFunctionForm" action="editSysSmsQueue.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysSmsQueue">
				<a href="editSysSmsQueue.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysSmsQueue">
				<a href="javascript:multiDeleteSysSmsQueue()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedQueueIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysSmsQueueListTableForm" method="get" >
		<ec:table 
			tableId="sysSmsQueueListTable"
			items="sysSmsQueues"
			var="sysSmsQueueVar"
			action="sysSmsQueues.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysSmsQueueListTableForm">
			<ec:row>
				<ec:column alias="chkQueueId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkQueueId" value="${sysSmsQueueVar.queueId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysSmsQueue">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysSmsQueue.jhtml?strAction=editSysSmsQueue&queueId=${sysSmsQueueVar.queueId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="queueId" title="sysSmsQueue.queueId" />
				<ec:column property="smsTypeId" title="sysSmsQueue.smsTypeId" />
				<ec:column property="companyCode" title="sysSmsQueue.companyCode" />
				<ec:column property="content" title="sysSmsQueue.content" />
				<ec:column property="createTime" title="sysSmsQueue.createTime" />
				<ec:column property="creatorCode" title="sysSmsQueue.creatorCode" />
				<ec:column property="creatorName" title="sysSmsQueue.creatorName" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysSmsQueue(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkQueueId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysSmsQueueFunctionForm;
	theForm.selectedQueueIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysSmsQueue";
	
	showLoading();
	theForm.submit();
}
</script>