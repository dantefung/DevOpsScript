<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockAdjustDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockAdjustDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="stStockAdjustDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listStStockAdjustDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="stStockAdjustDetailFunctionForm" id="stStockAdjustDetailFunctionForm" action="editStStockAdjustDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addStStockAdjustDetail">
				<a href="editStStockAdjustDetail.jhtml?strAction=addStStockAdjustDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteStStockAdjustDetail">
				<a href="javascript:multiDeleteStStockAdjustDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="stStockAdjustDetailListTableForm" method="get" >
		<ec:table 
			tableId="stStockAdjustDetailListTable"
			items="stStockAdjustDetails"
			var="stStockAdjustDetailVar"
			action="stStockAdjustDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stStockAdjustDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${stStockAdjustDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewStStockAdjustDetail">
						<a href="viewStStockAdjustDetail.jhtml?strAction=viewStStockAdjustDetail&detailId=${stStockAdjustDetailVar.detailId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editStStockAdjustDetail">
						<a href="editStStockAdjustDetail.jhtml?strAction=editStStockAdjustDetail&detailId=${stStockAdjustDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="detailId" title="stStockAdjustDetail.detailId" />
				<ec:column property="adjustCode" title="stStockAdjustDetail.adjustCode" />
				<ec:column property="productCode" title="stStockAdjustDetail.productCode" />
				<ec:column property="adjustQty" title="stStockAdjustDetail.adjustQty" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteStStockAdjustDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.stStockAdjustDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeleteStStockAdjustDetail";
	
	showLoading();
	theForm.submit();
}
</script>