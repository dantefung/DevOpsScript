<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductCountryList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductCountryList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmProductCountrys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPmProductCountrys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmProductCountryFunctionForm" id="pmProductCountryFunctionForm" action="editPmProductCountry.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmProductCountry">
				<a href="editPmProductCountry.jhtml?strAction=addPmProductCountry" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmProductCountry">
				<a href="javascript:multiDeletePmProductCountry()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductCountryListTableForm" method="get" >
		<ec:table 
			tableId="pmProductCountryListTable"
			items="pmProductCountrys"
			var="pmProductCountryVar"
			action="pmProductCountrys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmProductCountryListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${pmProductCountryVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editPmProductCountry">
						<a href="editPmProductCountry.jhtml?strAction=editPmProductCountry&id=${pmProductCountryVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewPmProductCountry">
						<a href="viewPmProductCountry.jhtml?strAction=viewPmProductCountry&id=${pmProductCountryVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="id" title="pmProductCountry.id" />
				<ec:column property="productCode" title="pmProductCountry.productCode" />
				<ec:column property="regionCode" title="pmProductCountry.regionCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmProductCountry(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmProductCountryFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmProductCountry";
	
	showLoading();
	theForm.submit();
}
</script>