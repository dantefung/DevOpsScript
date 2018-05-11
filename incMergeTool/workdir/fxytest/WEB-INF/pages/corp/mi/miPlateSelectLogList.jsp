<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miPlateSelectLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="miPlateSelectLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miPlateSelectLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiPlateSelectLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miPlateSelectLogFunctionForm" id="miPlateSelectLogFunctionForm" action="editMiPlateSelectLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiPlateSelectLog">
				<a href="editMiPlateSelectLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiPlateSelectLog">
				<a href="javascript:multiDeleteMiPlateSelectLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miPlateSelectLogListTableForm" method="get" >
		<ec:table 
			tableId="miPlateSelectLogListTable"
			items="miPlateSelectLogs"
			var="miPlateSelectLogVar"
			action="miPlateSelectLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miPlateSelectLogListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${miPlateSelectLogVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiPlateSelectLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiPlateSelectLog.jhtml?strAction=editMiPlateSelectLog&id=${miPlateSelectLogVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="miPlateSelectLog.id" />
				<ec:column property="memberNo" title="miPlateSelectLog.memberNo" />
				<ec:column property="plateModel" title="miPlateSelectLog.plateModel" />
				<ec:column property="linkNo" title="miPlateSelectLog.linkNo" />
				<ec:column property="status" title="miPlateSelectLog.status" />
				<ec:column property="inTime" title="miPlateSelectLog.inTime" />
				<ec:column property="comeTime" title="miPlateSelectLog.comeTime" />
				<ec:column property="lastUpUser" title="miPlateSelectLog.lastUpUser" />
				<ec:column property="lastUpDate" title="miPlateSelectLog.lastUpDate" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiPlateSelectLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miPlateSelectLogFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiPlateSelectLog";
	
	showLoading();
	theForm.submit();
}
</script>