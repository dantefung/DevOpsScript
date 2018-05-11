<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductExtraList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmProductExtraList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pmProductExtras.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPmProductExtras"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pmProductExtraFunctionForm" id="pmProductExtraFunctionForm" action="editPmProductExtra.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmProductExtra">
				<a href="editPmProductExtra.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePmProductExtra">
				<a href="javascript:multiDeletePmProductExtra()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedProductIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductExtraListTableForm" method="get" >
		<ec:table 
			tableId="pmProductExtraListTable"
			items="pmProductExtras"
			var="pmProductExtraVar"
			action="pmProductExtras.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmProductExtraListTableForm">
			<ec:row>
				<ec:column alias="chkProductId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkProductId" value="${pmProductExtraVar.productId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPmProductExtra">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPmProductExtra.jhtml?strAction=editPmProductExtra&productId=${pmProductExtraVar.productId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="productId" title="pmProductExtra.productId" />
				<ec:column property="productDesc" title="pmProductExtra.productDesc" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmProductExtra(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkProductId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmProductExtraFunctionForm;
	theForm.selectedProductIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmProductExtra";
	
	showLoading();
	theForm.submit();
}
</script>