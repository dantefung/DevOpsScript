<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miBlacklistFileList.title"/></title>
    <meta name="heading" content="<fmt:message key="miBlacklistFileList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miBlacklistFiles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiBlacklistFiles"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miBlacklistFileFunctionForm" id="miBlacklistFileFunctionForm" action="editMiBlacklistFile.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiBlacklistFile">
				<a href="editMiBlacklistFile.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiBlacklistFile">
				<a href="javascript:multiDeleteMiBlacklistFile()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedFileIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miBlacklistFileListTableForm" method="get" >
		<ec:table 
			tableId="miBlacklistFileListTable"
			items="miBlacklistFiles"
			var="miBlacklistFileVar"
			action="miBlacklistFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miBlacklistFileListTableForm">
			<ec:row>
				<ec:column alias="chkFileId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkFileId" value="${miBlacklistFileVar.fileId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiBlacklistFile">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiBlacklistFile.jhtml?strAction=editMiBlacklistFile&fileId=${miBlacklistFileVar.fileId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="fileId" title="miBlacklistFile.fileId" />
				<ec:column property="id" title="miBlacklistFile.id" />
				<ec:column property="fileName" title="miBlacklistFile.fileName" />
				<ec:column property="originalName" title="miBlacklistFile.originalName" />
				<ec:column property="fileUrl" title="miBlacklistFile.fileUrl" />
				<ec:column property="fileSize" title="miBlacklistFile.fileSize" />
				<ec:column property="suffixName" title="miBlacklistFile.suffixName" />
				<ec:column property="createrCode" title="miBlacklistFile.createrCode" />
				<ec:column property="createTime" title="miBlacklistFile.createTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiBlacklistFile(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkFileId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miBlacklistFileFunctionForm;
	theForm.selectedFileIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiBlacklistFile";
	
	showLoading();
	theForm.submit();
}
</script>