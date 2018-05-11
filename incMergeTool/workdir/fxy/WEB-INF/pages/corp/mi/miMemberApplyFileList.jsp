<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApplyFileList.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApplyFileList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberApplyFiles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiMemberApplyFiles"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyFileFunctionForm" id="miMemberApplyFileFunctionForm" action="editMiMemberApplyFile.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberApplyFile">
				<a href="editMiMemberApplyFile.jhtml?strAction=addMiMemberApplyFile" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiMemberApplyFile">
				<a href="javascript:multiDeleteMiMemberApplyFile()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedFileIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberApplyFileListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyFileListTable"
			items="miMemberApplyFiles"
			var="miMemberApplyFileVar"
			action="miMemberApplyFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyFileListTableForm">
			<ec:row>
				<ec:column alias="chkFileId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkFileId" value="${miMemberApplyFileVar.fileId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiMemberApplyFile">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiMemberApplyFile.jhtml?strAction=editMiMemberApplyFile&fileId=${miMemberApplyFileVar.fileId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="fileId" title="miMemberApplyFile.fileId" />
				<ec:column property="applyCode" title="miMemberApplyFile.applyCode" />
				<ec:column property="fileName" title="miMemberApplyFile.fileName" />
				<ec:column property="fileUrl" title="miMemberApplyFile.fileUrl" />
				<ec:column property="createrCode" title="miMemberApplyFile.createrCode" />
				<ec:column property="createTime" title="miMemberApplyFile.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberApplyFile(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkFileId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberApplyFileFunctionForm;
	theForm.selectedFileIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberApplyFile";
	
	showLoading();
	theForm.submit();
}
</script>