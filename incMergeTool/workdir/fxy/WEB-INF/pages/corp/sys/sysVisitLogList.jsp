<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysVisitLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysVisitLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysVisitLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysVisitLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysVisitLogFunctionForm" id="sysVisitLogFunctionForm" action="editSysVisitLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysVisitLog">
				<a href="editSysVisitLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysVisitLog">
				<a href="javascript:multiDeleteSysVisitLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysVisitLogListTableForm" method="get" >
		<ec:table 
			tableId="sysVisitLogListTable"
			items="sysVisitLogs"
			var="sysVisitLogVar"
			action="sysVisitLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysVisitLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${sysVisitLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysVisitLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysVisitLog.jhtml?strAction=editSysVisitLog&logId=${sysVisitLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="sysVisitLog.logId" />
				<ec:column property="moduleCode" title="sysVisitLog.moduleCode" />
				<ec:column property="userCode" title="sysVisitLog.userCode" />
				<ec:column property="visitUrl" title="sysVisitLog.visitUrl" />
				<ec:column property="visitTime" title="sysVisitLog.visitTime" />
				<ec:column property="queryString" title="sysVisitLog.queryString" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysVisitLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysVisitLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysVisitLog";
	
	showLoading();
	theForm.submit();
}
</script>