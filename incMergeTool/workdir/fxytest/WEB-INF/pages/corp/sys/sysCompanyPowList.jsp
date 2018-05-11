<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysCompanyPowList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysCompanyPowList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysCompanyPows.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysCompanyPows"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysCompanyPowFunctionForm" id="sysCompanyPowFunctionForm" action="editSysCompanyPow.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysCompanyPow">
				<a href="editSysCompanyPow.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysCompanyPow">
				<a href="javascript:multiDeleteSysCompanyPow()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysCompanyPowListTableForm" method="get" >
		<ec:table 
			tableId="sysCompanyPowListTable"
			items="sysCompanyPows"
			var="sysCompanyPowVar"
			action="sysCompanyPows.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysCompanyPowListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${sysCompanyPowVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysCompanyPow">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysCompanyPow.jhtml?strAction=editSysCompanyPow&id=${sysCompanyPowVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="sysCompanyPow.id" />
				<ec:column property="moduleId" title="sysCompanyPow.moduleId" />
				<ec:column property="companyCode" title="sysCompanyPow.companyCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysCompanyPow(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysCompanyPowFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysCompanyPow";
	
	showLoading();
	theForm.submit();
}
</script>