<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysLoginLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysLoginLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysLoginLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listSysLoginLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysLoginLogFunctionForm" id="sysLoginLogFunctionForm" action="editSysLoginLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysLoginLog">
				<a href="editSysLoginLog.jhtml?strAction=addSysLoginLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysLoginLog">
				<a href="javascript:multiDeleteSysLoginLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysLoginLogListTableForm" method="get" >
		<ec:table 
			tableId="sysLoginLogListTable"
			items="sysLoginLogs"
			var="sysLoginLogVar"
			action="sysLoginLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysLoginLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${sysLoginLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editSysLoginLog">
						<a href="editSysLoginLog.jhtml?strAction=editSysLoginLog&logId=${sysLoginLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewSysLoginLog">
						<a href="viewSysLoginLog.jhtml?strAction=viewSysLoginLog&logId=${sysLoginLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="logId" title="sysLoginLog.logId" />
				<ec:column property="userCode" title="sysLoginLog.userCode" />
				<ec:column property="loginTime" title="sysLoginLog.loginTime" />
				<ec:column property="clientIp" title="sysLoginLog.clientIp" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysLoginLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysLoginLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysLoginLog";
	
	showLoading();
	theForm.submit();
}
</script>