<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderEcItemList.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderEcItemList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderEcItems.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoOrderEcItems"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poOrderEcItemFunctionForm" id="poOrderEcItemFunctionForm" action="editPoOrderEcItem.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoOrderEcItem">
				<a href="editPoOrderEcItem.jhtml?strAction=addPoOrderEcItem" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoOrderEcItem">
				<a href="javascript:multiDeletePoOrderEcItem()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedItemIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderEcItemListTableForm" method="get" >
		<ec:table 
			tableId="poOrderEcItemListTable"
			items="poOrderEcItems"
			var="poOrderEcItemVar"
			action="poOrderEcItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderEcItemListTableForm">
			<ec:row>
				<ec:column alias="chkItemId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkItemId" value="${poOrderEcItemVar.itemId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewPoOrderEcItem">
						<a href="viewPoOrderEcItem.jhtml?strAction=viewPoOrderEcItem&itemId=${poOrderEcItemVar.itemId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editPoOrderEcItem">
						<a href="editPoOrderEcItem.jhtml?strAction=editPoOrderEcItem&itemId=${poOrderEcItemVar.itemId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="itemId" title="poOrderEcItem.itemId" />
				<ec:column property="detailId" title="poOrderEcItem.detailId" />
				<ec:column property="companyCode" title="poOrderEcItem.companyCode" />
				<ec:column property="ecProductNo" title="poOrderEcItem.ecProductNo" />
				<ec:column property="quantity" title="poOrderEcItem.quantity" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoOrderEcItem(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkItemId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poOrderEcItemFunctionForm;
	theForm.selectedItemIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoOrderEcItem";
	
	showLoading();
	theForm.submit();
}
</script>