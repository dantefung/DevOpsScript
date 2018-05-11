<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApplyCheckLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApplyCheckLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberApplyCheckLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiMemberApplyCheckLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyCheckLogFunctionForm" id="miMemberApplyCheckLogFunctionForm" action="editMiMemberApplyCheckLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberApplyCheckLog">
				<a href="editMiMemberApplyCheckLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiMemberApplyCheckLog">
				<a href="javascript:multiDeleteMiMemberApplyCheckLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberApplyCheckLogListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyCheckLogListTable"
			items="miMemberApplyCheckLogs"
			var="miMemberApplyCheckLogVar"
			action="miMemberApplyCheckLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyCheckLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${miMemberApplyCheckLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiMemberApplyCheckLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiMemberApplyCheckLog.jhtml?strAction=editMiMemberApplyCheckLog&logId=${miMemberApplyCheckLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="miMemberApplyCheckLog.logId" />
				<ec:column property="applyCode" title="miMemberApplyCheckLog.applyCode" />
				<ec:column property="checkerCode" title="miMemberApplyCheckLog.checkerCode" />
				<ec:column property="checkerName" title="miMemberApplyCheckLog.checkerName" />
				<ec:column property="checkTime" title="miMemberApplyCheckLog.checkTime" />
				<ec:column property="checkStep" title="miMemberApplyCheckLog.checkStep" />
				<ec:column property="remark" title="miMemberApplyCheckLog.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberApplyCheckLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberApplyCheckLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberApplyCheckLog";
	
	showLoading();
	theForm.submit();
}
</script>