<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miStateFileList.title"/></title>
    <meta name="heading" content="<fmt:message key="miStateFileList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miStateFiles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiStateFiles"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miStateFileFunctionForm" id="miStateFileFunctionForm" action="editMiStateFile.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiStateFile">
				<a href="editMiStateFile.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiStateFile">
				<a href="javascript:multiDeleteMiStateFile()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedFileIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miStateFileListTableForm" method="get" >
		<ec:table 
			tableId="miStateFileListTable"
			items="miStateFiles"
			var="miStateFileVar"
			action="miStateFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miStateFileListTableForm">
			<ec:row>
				<ec:column alias="chkFileId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkFileId" value="${miStateFileVar.fileId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiStateFile">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiStateFile.jhtml?strAction=editMiStateFile&fileId=${miStateFileVar.fileId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="fileId" title="miStateFile.fileId" />
				<ec:column property="adjustCode" title="miStateFile.adjustCode" />
				<ec:column property="fileName" title="miStateFile.fileName" />
				<ec:column property="originalName" title="miStateFile.originalName" />
				<ec:column property="fileUrl" title="miStateFile.fileUrl" />
				<ec:column property="fileSize" title="miStateFile.fileSize" />
				<ec:column property="suffixName" title="miStateFile.suffixName" />
				<ec:column property="createrCode" title="miStateFile.createrCode" />
				<ec:column property="createTime" title="miStateFile.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiStateFile(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkFileId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miStateFileFunctionForm;
	theForm.selectedFileIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiStateFile";
	
	showLoading();
	theForm.submit();
}
</script>