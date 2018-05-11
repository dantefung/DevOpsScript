<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusExportLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusExportLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusExportLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusExportLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusExportLogFunctionForm" id="fiBonusExportLogFunctionForm" action="editFiBonusExportLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusExportLog">
				<a href="editFiBonusExportLog.jhtml?strAction=addFiBonusExportLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiBonusExportLog">
				<a href="javascript:multiDeleteFiBonusExportLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusExportLogListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusExportLogListTable"
			items="fiBonusExportLogs"
			var="fiBonusExportLogVar"
			action="fiBonusExportLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusExportLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${fiBonusExportLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewFiBonusExportLog">
						<a href="viewFiBonusExportLog.jhtml?strAction=viewFiBonusExportLog&logId=${fiBonusExportLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editFiBonusExportLog">
						<a href="editFiBonusExportLog.jhtml?strAction=editFiBonusExportLog&logId=${fiBonusExportLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="logId" title="fiBonusExportLog.logId" />
				<ec:column property="operNo" title="fiBonusExportLog.operNo" />
				<ec:column property="operatorCode" title="fiBonusExportLog.operatorCode" />
				<ec:column property="operatorName" title="fiBonusExportLog.operatorName" />
				<ec:column property="operateTime" title="fiBonusExportLog.operateTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusExportLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusExportLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusExportLog";
	
	showLoading();
	theForm.submit();
}
</script>