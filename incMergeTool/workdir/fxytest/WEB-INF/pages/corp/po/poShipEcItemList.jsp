<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poShipEcItemList.title"/></title>
    <meta name="heading" content="<fmt:message key="poShipEcItemList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poShipEcItems.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoShipEcItems"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poShipEcItemFunctionForm" id="poShipEcItemFunctionForm" action="editPoShipEcItem.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoShipEcItem">
				<a href="editPoShipEcItem.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoShipEcItem">
				<a href="javascript:multiDeletePoShipEcItem()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedItemIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poShipEcItemListTableForm" method="get" >
		<ec:table 
			tableId="poShipEcItemListTable"
			items="poShipEcItems"
			var="poShipEcItemVar"
			action="poShipEcItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poShipEcItemListTableForm">
			<ec:row>
				<ec:column alias="chkItemId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkItemId" value="${poShipEcItemVar.itemId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPoShipEcItem">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPoShipEcItem.jhtml?strAction=editPoShipEcItem&itemId=${poShipEcItemVar.itemId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="itemId" title="poShipEcItem.itemId" />
				<ec:column property="detailId" title="poShipEcItem.detailId" />
				<ec:column property="companyCode" title="poShipEcItem.companyCode" />
				<ec:column property="ecProductNo" title="poShipEcItem.ecProductNo" />
				<ec:column property="quantity" title="poShipEcItem.quantity" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoShipEcItem(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkItemId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poShipEcItemFunctionForm;
	theForm.selectedItemIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoShipEcItem";
	
	showLoading();
	theForm.submit();
}
</script>