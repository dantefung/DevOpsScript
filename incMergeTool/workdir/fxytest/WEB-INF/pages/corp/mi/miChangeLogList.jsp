<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miChangeLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="miChangeLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miChangeLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiChangeLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miChangeLogFunctionForm" id="miChangeLogFunctionForm" action="editMiChangeLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiChangeLog">
				<a href="editMiChangeLog.jhtml?strAction=addMiChangeLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiChangeLog">
				<a href="javascript:multiDeleteMiChangeLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedChangeCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miChangeLogListTableForm" method="get" >
		<ec:table 
			tableId="miChangeLogListTable"
			items="miChangeLogs"
			var="miChangeLogVar"
			action="miChangeLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miChangeLogListTableForm">
			<ec:row>
				<ec:column alias="chkChangeCode" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkChangeCode" value="${miChangeLogVar.changeCode}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiChangeLog">
						<a href="viewMiChangeLog.jhtml?strAction=viewMiChangeLog&changeCode=${miChangeLogVar.changeCode}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editMiChangeLog">
						<a href="editMiChangeLog.jhtml?strAction=editMiChangeLog&changeCode=${miChangeLogVar.changeCode}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="changeCode" title="miChangeLog.changeCode" />
				<ec:column property="companyCode" title="miChangeLog.companyCode" />
				<ec:column property="userCode" title="miChangeLog.userCode" />
				<ec:column property="changerCode" title="miChangeLog.changerCode" />
				<ec:column property="changeTime" title="miChangeLog.changeTime" />
				<ec:column property="remark" title="miChangeLog.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiChangeLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkChangeCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miChangeLogFunctionForm;
	theForm.selectedChangeCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteMiChangeLog";
	
	showLoading();
	theForm.submit();
}
</script>