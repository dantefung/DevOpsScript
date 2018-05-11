<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alRateAdjustItemList.title"/></title>
    <meta name="heading" content="<fmt:message key="alRateAdjustItemList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alRateAdjustItems.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listAlRateAdjustItems"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alRateAdjustItemFunctionForm" id="alRateAdjustItemFunctionForm" action="editAlRateAdjustItem.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlRateAdjustItem">
				<a href="editAlRateAdjustItem.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteAlRateAdjustItem">
				<a href="javascript:multiDeleteAlRateAdjustItem()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedItemIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alRateAdjustItemListTableForm" method="get" >
		<ec:table 
			tableId="alRateAdjustItemListTable"
			items="alRateAdjustItems"
			var="alRateAdjustItemVar"
			action="alRateAdjustItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="alRateAdjustItemListTableForm">
			<ec:row>
				<ec:column alias="chkItemId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkItemId" value="${alRateAdjustItemVar.itemId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editAlRateAdjustItem">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editAlRateAdjustItem.jhtml?strAction=editAlRateAdjustItem&itemId=${alRateAdjustItemVar.itemId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="itemId" title="alRateAdjustItem.itemId" />
				<ec:column property="adjustCode" title="alRateAdjustItem.adjustCode" />
				<ec:column property="currencyCode" title="alRateAdjustItem.currencyCode" />
				<ec:column property="rate" title="alRateAdjustItem.rate" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlRateAdjustItem(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkItemId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alRateAdjustItemFunctionForm;
	theForm.selectedItemIds.value=selectedValues;
	theForm.strAction.value="multiDeleteAlRateAdjustItem";
	
	showLoading();
	theForm.submit();
}
</script>