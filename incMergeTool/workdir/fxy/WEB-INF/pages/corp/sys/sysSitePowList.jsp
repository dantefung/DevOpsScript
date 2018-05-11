<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSitePowList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSitePowList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysSitePows.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listSysSitePows"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysSitePowFunctionForm" id="sysSitePowFunctionForm" action="editSysSitePow.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysSitePow">
				<a href="editSysSitePow.jhtml?strAction=addSysSitePow" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysSitePow">
				<a href="javascript:multiDeleteSysSitePow()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysSitePowListTableForm" method="get" >
		<ec:table 
			tableId="sysSitePowListTable"
			items="sysSitePows"
			var="sysSitePowVar"
			action="sysSitePows.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysSitePowListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${sysSitePowVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewSysSitePow">
						<a href="viewSysSitePow.jhtml?strAction=viewSysSitePow&id=${sysSitePowVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editSysSitePow">
						<a href="editSysSitePow.jhtml?strAction=editSysSitePow&id=${sysSitePowVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="id" title="sysSitePow.id" />
				<ec:column property="moduleId" title="sysSitePow.moduleId" />
				<ec:column property="siteId" title="sysSitePow.siteId" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysSitePow(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysSitePowFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysSitePow";
	
	showLoading();
	theForm.submit();
}
</script>