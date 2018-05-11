<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miStateIgnoreList.title"/></title>
    <meta name="heading" content="<fmt:message key="miStateIgnoreList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miStateIgnores.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="poOrder.searchCondition"/></dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiStateIgnores"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miStateIgnoreFunctionForm" id="miStateIgnoreFunctionForm" action="editMiStateIgnore.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiStateIgnore">
				<a href="editMiStateIgnore.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiStateIgnore">
				<a href="javascript:multiDeleteMiStateIgnore()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIgnoreIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miStateIgnoreListTableForm" method="get" >
		<ec:table 
			tableId="miStateIgnoreListTable"
			items="miStateIgnores"
			var="miStateIgnoreVar"
			action="miStateIgnores.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miStateIgnoreListTableForm">
			<ec:row>
				<ec:column alias="chkIgnoreId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkIgnoreId" value="${miStateIgnoreVar.ignoreId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiStateIgnore">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiStateIgnore.jhtml?strAction=editMiStateIgnore&ignoreId=${miStateIgnoreVar.ignoreId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="ignoreId" title="miStateIgnore.ignoreId" />
				<ec:column property="adjustCode" title="miStateIgnore.adjustCode" />
				<ec:column property="memberNo" title="miStateIgnore.memberNo" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiStateIgnore(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkIgnoreId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miStateIgnoreFunctionForm;
	theForm.selectedIgnoreIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiStateIgnore";
	
	showLoading();
	theForm.submit();
}
</script>