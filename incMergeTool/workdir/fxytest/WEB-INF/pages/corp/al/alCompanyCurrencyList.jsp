<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alCompanyCurrencyList.title"/></title>
    <meta name="heading" content="<fmt:message key="alCompanyCurrencyList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alCompanyCurrencys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listAlCompanyCurrencys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alCompanyCurrencyFunctionForm" id="alCompanyCurrencyFunctionForm" action="editAlCompanyCurrency.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlCompanyCurrency">
				<a href="editAlCompanyCurrency.jhtml?strAction=addAlCompanyCurrency" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteAlCompanyCurrency">
				<a href="javascript:multiDeleteAlCompanyCurrency()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alCompanyCurrencyListTableForm" method="get" >
		<ec:table 
			tableId="alCompanyCurrencyListTable"
			items="alCompanyCurrencys"
			var="alCompanyCurrencyVar"
			action="alCompanyCurrencys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="alCompanyCurrencyListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${alCompanyCurrencyVar.id}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editAlCompanyCurrency">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editAlCompanyCurrency.jhtml?strAction=editAlCompanyCurrency&id=${alCompanyCurrencyVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="id" title="alCompanyCurrency.id" />
				<ec:column property="companyCode" title="alCompanyCurrency.companyCode" />
				<ec:column property="currencyCode" title="alCompanyCurrency.currencyCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlCompanyCurrency(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alCompanyCurrencyFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteAlCompanyCurrency";
	
	showLoading();
	theForm.submit();
}
</script>