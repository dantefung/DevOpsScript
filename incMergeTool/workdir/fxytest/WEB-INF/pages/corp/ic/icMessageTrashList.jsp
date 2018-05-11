<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageTrashList.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageTrashList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icMessageTrashs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/></dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcMessageTrashs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icMessageTrashFunctionForm" id="icMessageTrashFunctionForm" action="editIcMessageTrash.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcMessageTrash">
				<a href="editIcMessageTrash.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcMessageTrash">
				<a href="javascript:multiDeleteIcMessageTrash()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedTrashIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icMessageTrashListTableForm" method="get" >
		<ec:table 
			tableId="icMessageTrashListTable"
			items="icMessageTrashs"
			var="icMessageTrashVar"
			action="icMessageTrashs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icMessageTrashListTableForm">
			<ec:row>
				<ec:column alias="chkTrashId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkTrashId" value="${icMessageTrashVar.trashId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcMessageTrash">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcMessageTrash.jhtml?strAction=editIcMessageTrash&trashId=${icMessageTrashVar.trashId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="trashId" title="icMessageTrash.trashId" />
				<ec:column property="messageId" title="icMessageTrash.messageId" />
				<ec:column property="userCode" title="icMessageTrash.userCode" />
				<ec:column property="deleteTime" title="icMessageTrash.deleteTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcMessageTrash(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkTrashId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icMessageTrashFunctionForm;
	theForm.selectedTrashIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcMessageTrash";
	
	showLoading();
	theForm.submit();
}
</script>