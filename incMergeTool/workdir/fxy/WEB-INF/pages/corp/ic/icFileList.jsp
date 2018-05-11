<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icFileList.title"/></title>
    <meta name="heading" content="<fmt:message key="icFileList.list"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icFiles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="icInformation.title"/></dd>
			<dd><input type="text" id="fileName" name ="fileName" value="${param.fileName }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="icFile.linkType"/></dd>
			<dd><win:list name="linktype" listCode="icfile.linktype" defaultValue="" value="${param.linktype }"></win:list></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icFileFunctionForm" id="icFileFunctionForm" action="editIcFile.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcFile">
				<a href="editIcFile.jhtml?strAction=addIcFile" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		 
				<a href="javascript:multiDeleteIcFile()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			 
		</div>
		<input type="hidden" name="selectedFileIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icFileListTableForm" method="get"  >
		<ec:table 
			tableId="icFileListTable"
			items="icFiles"
			var="icFileVar"
			action="icFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icFileListTableForm">
			<ec:row>
				<ec:column alias="chkFileId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkFileId" value="${icFileVar.fileId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcFile">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcFile.jhtml?strAction=editIcFile&fileId=${icFileVar.fileId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				 
				<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				<ec:column property="fileName" title="icFile.fileName" />
			 
				<ec:column property="fileSize" title="icFile.fileSize" />
				<ec:column property="createTime" title="pd.createTime" >
					 <fmt:formatDate value="${icFileVar.createTime }" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="linkType" title="icFile.linkType" >
					<win:code listCode="icfile.linktype" value="${icFileVar.linkType }"/>
				</ec:column>
				<ec:column property="linkUrl" title="icFile.linkUrl" />
				<ec:column property="downloadedTimes" title="icFile.downloadedTimes" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcFile(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkFileId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icFileFunctionForm;
	theForm.selectedFileIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcFile";
	
	showLoading();
	theForm.submit();
}
</script>