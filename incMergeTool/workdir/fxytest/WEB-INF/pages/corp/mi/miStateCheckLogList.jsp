<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miStateCheckLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="miStateCheckLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miStateCheckLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiStateCheckLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miStateCheckLogFunctionForm" id="miStateCheckLogFunctionForm" action="editMiStateCheckLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiStateCheckLog">
				<a href="editMiStateCheckLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiStateCheckLog">
				<a href="javascript:multiDeleteMiStateCheckLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miStateCheckLogListTableForm" method="get" >
		<ec:table 
			tableId="miStateCheckLogListTable"
			items="miStateCheckLogs"
			var="miStateCheckLogVar"
			action="miStateCheckLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miStateCheckLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${miStateCheckLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiStateCheckLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiStateCheckLog.jhtml?strAction=editMiStateCheckLog&logId=${miStateCheckLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="logId" title="miStateCheckLog.logId" />
				<ec:column property="adjustCode" title="miStateCheckLog.adjustCode" />
				<ec:column property="checkerCode" title="miStateCheckLog.checkerCode" />
				<ec:column property="checkerName" title="miStateCheckLog.checkerName" />
				<ec:column property="checkTime" title="miStateCheckLog.checkTime" />
				<ec:column property="checkStep" title="miStateCheckLog.checkStep" />
				<ec:column property="remark" title="miStateCheckLog.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiStateCheckLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miStateCheckLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiStateCheckLog";
	
	showLoading();
	theForm.submit();
}
</script>