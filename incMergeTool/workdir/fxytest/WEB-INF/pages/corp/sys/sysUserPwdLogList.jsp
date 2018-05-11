<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysUserPwdLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysUserPwdLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysUserPwdLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysUserPwdLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysUserPwdLogFunctionForm" id="sysUserPwdLogFunctionForm" action="editSysUserPwdLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysUserPwdLog">
				<a href="editSysUserPwdLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysUserPwdLog">
				<a href="javascript:multiDeleteSysUserPwdLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysUserPwdLogListTableForm" method="get" >
		<ec:table 
			tableId="sysUserPwdLogListTable"
			items="sysUserPwdLogs"
			var="sysUserPwdLogVar"
			action="sysUserPwdLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysUserPwdLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${sysUserPwdLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysUserPwdLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysUserPwdLog.jhtml?strAction=editSysUserPwdLog&logId=${sysUserPwdLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="sysUserPwdLog.logId" />
				<ec:column property="userCode" title="sysUserPwdLog.userCode" />
				<ec:column property="editorCode" title="sysUserPwdLog.editorCode" />
				<ec:column property="editTime" title="sysUserPwdLog.editTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysUserPwdLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysUserPwdLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysUserPwdLog";
	
	showLoading();
	theForm.submit();
}
</script>