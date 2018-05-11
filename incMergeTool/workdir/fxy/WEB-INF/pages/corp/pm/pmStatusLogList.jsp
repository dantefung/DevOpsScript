<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmStatusLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmStatusLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmStatusLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPmStatusLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmStatusLogFunctionForm" id="pmStatusLogFunctionForm" action="editPmStatusLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmStatusLog">
				<a href="editPmStatusLog.jhtml?strAction=addPmStatusLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmStatusLog">
				<a href="javascript:multiDeletePmStatusLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmStatusLogListTableForm" method="get" >
		<ec:table 
			tableId="pmStatusLogListTable"
			items="pmStatusLogs"
			var="pmStatusLogVar"
			action="pmStatusLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmStatusLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${pmStatusLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editPmStatusLog">
						<a href="editPmStatusLog.jhtml?strAction=editPmStatusLog&logId=${pmStatusLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewPmStatusLog">
						<a href="viewPmStatusLog.jhtml?strAction=viewPmStatusLog&logId=${pmStatusLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="logId" title="pmStatusLog.logId" />
				<ec:column property="productId" title="pmStatusLog.productId" />
				<ec:column property="newStatus" title="pmStatusLog.newStatus" />
				<ec:column property="editorCode" title="pmStatusLog.editorCode" />
				<ec:column property="editTime" title="pmStatusLog.editTime" />
				<ec:column property="editReason" title="pmStatusLog.editReason" />
				<ec:column property="receiptCode" title="pmStatusLog.receiptCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmStatusLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmStatusLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmStatusLog";
	
	showLoading();
	theForm.submit();
}
</script>