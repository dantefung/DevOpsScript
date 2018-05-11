<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysApiLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysApiLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysApiLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysApiLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysApiLogFunctionForm" id="sysApiLogFunctionForm" action="editSysApiLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysApiLog">
				<a href="editSysApiLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysApiLog">
				<a href="javascript:multiDeleteSysApiLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysApiLogListTableForm" method="get" >
		<ec:table 
			tableId="sysApiLogListTable"
			items="sysApiLogs"
			var="sysApiLogVar"
			action="sysApiLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysApiLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${sysApiLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysApiLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysApiLog.jhtml?strAction=editSysApiLog&logId=${sysApiLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="sysApiLog.logId" />
				<ec:column property="xid" title="sysApiLog.xid" />
				<ec:column property="clientIp" title="sysApiLog.clientIp" />
				<ec:column property="apiModule" title="sysApiLog.apiModule" />
				<ec:column property="apiUser" title="sysApiLog.apiUser" />
				<ec:column property="inputData" title="sysApiLog.inputData" />
				<ec:column property="operateTime" title="sysApiLog.operateTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysApiLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysApiLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysApiLog";
	
	showLoading();
	theForm.submit();
}
</script>