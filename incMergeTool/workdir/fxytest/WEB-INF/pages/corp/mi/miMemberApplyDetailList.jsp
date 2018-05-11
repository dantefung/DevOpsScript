<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApplyDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApplyDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberApplyDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiMemberApplyDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyDetailFunctionForm" id="miMemberApplyDetailFunctionForm" action="editMiMemberApplyDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberApplyDetail">
				<a href="editMiMemberApplyDetail.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiMemberApplyDetail">
				<a href="javascript:multiDeleteMiMemberApplyDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberApplyDetailListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyDetailListTable"
			items="miMemberApplyDetails"
			var="miMemberApplyDetailVar"
			action="miMemberApplyDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${miMemberApplyDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiMemberApplyDetail">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiMemberApplyDetail.jhtml?strAction=editMiMemberApplyDetail&detailId=${miMemberApplyDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="detailId" title="miMemberApplyDetail.detailId" />
				<ec:column property="applyCode" title="miMemberApplyDetail.applyCode" />
				<ec:column property="tableName" title="miMemberApplyDetail.tableName" />
				<ec:column property="columnName" title="miMemberApplyDetail.columnName" />
				<ec:column property="oldName" title="miMemberApplyDetail.oldName" />
				<ec:column property="newName" title="miMemberApplyDetail.newName" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMemberApplyDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberApplyDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMemberApplyDetail";
	
	showLoading();
	theForm.submit();
}
</script>