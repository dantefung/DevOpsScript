<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmPersonLimitList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmPersonLimitList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmPersonLimits.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPmPersonLimits"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmPersonLimitFunctionForm" id="pmPersonLimitFunctionForm" action="editPmPersonLimit.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmPersonLimit">
				<a href="editPmPersonLimit.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmPersonLimit">
				<a href="javascript:multiDeletePmPersonLimit()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmPersonLimitListTableForm" method="get" >
		<ec:table 
			tableId="pmPersonLimitListTable"
			items="pmPersonLimits"
			var="pmPersonLimitVar"
			action="pmPersonLimits.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmPersonLimitListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${pmPersonLimitVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPmPersonLimit">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPmPersonLimit.jhtml?strAction=editPmPersonLimit&id=${pmPersonLimitVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="pmPersonLimit.id" />
				<ec:column property="companyCode" title="pmPersonLimit.companyCode" />
				<ec:column property="productCode" title="pmPersonLimit.productCode" />
				<ec:column property="userCode" title="pmPersonLimit.userCode" />
				<ec:column property="allowedQty" title="pmPersonLimit.allowedQty" />
				<ec:column property="remainQty" title="pmPersonLimit.remainQty" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmPersonLimit(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmPersonLimitFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmPersonLimit";
	
	showLoading();
	theForm.submit();
}
</script>