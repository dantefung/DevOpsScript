<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miPlateSelectList.title"/></title>
    <meta name="heading" content="<fmt:message key="miPlateSelectList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miPlateSelects.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiPlateSelects"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miPlateSelectFunctionForm" id="miPlateSelectFunctionForm" action="editMiPlateSelect.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiPlateSelect">
				<a href="editMiPlateSelect.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiPlateSelect">
				<a href="javascript:multiDeleteMiPlateSelect()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miPlateSelectListTableForm" method="get" >
		<ec:table 
			tableId="miPlateSelectListTable"
			items="miPlateSelects"
			var="miPlateSelectVar"
			action="miPlateSelects.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miPlateSelectListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${miPlateSelectVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiPlateSelect">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiPlateSelect.jhtml?strAction=editMiPlateSelect&id=${miPlateSelectVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="miPlateSelect.id" />
				<ec:column property="memberNo" title="miPlateSelect.memberNo" />
				<ec:column property="plateModel" title="miPlateSelect.plateModel" />
				<ec:column property="linkNo" title="miPlateSelect.linkNo" />
				<ec:column property="status" title="miPlateSelect.status" />
				<ec:column property="inTime" title="miPlateSelect.inTime" />
				<ec:column property="comeTime" title="miPlateSelect.comeTime" />
				<ec:column property="lastUpUser" title="miPlateSelect.lastUpUser" />
				<ec:column property="lastUpDate" title="miPlateSelect.lastUpDate" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiPlateSelect(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miPlateSelectFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiPlateSelect";
	
	showLoading();
	theForm.submit();
}
</script>