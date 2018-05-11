<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miCardChangeFileList.title"/></title>
    <meta name="heading" content="<fmt:message key="miCardChangeFileList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miCardChangeFiles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiCardChangeFiles"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miCardChangeFileFunctionForm" id="miCardChangeFileFunctionForm" action="editMiCardChangeFile.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiCardChangeFile">
				<a href="editMiCardChangeFile.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiCardChangeFile">
				<a href="javascript:multiDeleteMiCardChangeFile()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedFileIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miCardChangeFileListTableForm" method="get" >
		<ec:table 
			tableId="miCardChangeFileListTable"
			items="miCardChangeFiles"
			var="miCardChangeFileVar"
			action="miCardChangeFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miCardChangeFileListTableForm">
			<ec:row>
				<ec:column alias="chkFileId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkFileId" value="${miCardChangeFileVar.fileId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiCardChangeFile">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiCardChangeFile.jhtml?strAction=editMiCardChangeFile&fileId=${miCardChangeFileVar.fileId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="fileId" title="miCardChangeFile.fileId" />
				<ec:column property="uniqueNo" title="miCardChangeFile.uniqueNo" />
				<ec:column property="fileName" title="miCardChangeFile.fileName" />
				<ec:column property="originalName" title="miCardChangeFile.originalName" />
				<ec:column property="fileUrl" title="miCardChangeFile.fileUrl" />
				<ec:column property="fileSize" title="miCardChangeFile.fileSize" />
				<ec:column property="suffixName" title="miCardChangeFile.suffixName" />
				<ec:column property="createrCode" title="miCardChangeFile.createrCode" />
				<ec:column property="createTime" title="miCardChangeFile.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiCardChangeFile(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkFileId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miCardChangeFileFunctionForm;
	theForm.selectedFileIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiCardChangeFile";
	
	showLoading();
	theForm.submit();
}
</script>