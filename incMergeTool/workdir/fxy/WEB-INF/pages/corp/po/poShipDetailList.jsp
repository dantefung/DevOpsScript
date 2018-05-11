<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poShipDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="poShipDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poShipDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPoShipDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poShipDetailFunctionForm" id="poShipDetailFunctionForm" action="editPoShipDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoShipDetail">
				<a href="editPoShipDetail.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoShipDetail">
				<a href="javascript:multiDeletePoShipDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poShipDetailListTableForm" method="get" >
		<ec:table 
			tableId="poShipDetailListTable"
			items="poShipDetails"
			var="poShipDetailVar"
			action="poShipDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poShipDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${poShipDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPoShipDetail">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPoShipDetail.jhtml?strAction=editPoShipDetail&detailId=${poShipDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="detailId" title="poShipDetail.detailId" />
				<ec:column property="shipId" title="poShipDetail.shipId" />
				<ec:column property="companyCode" title="poShipDetail.companyCode" />
				<ec:column property="productNo" title="poShipDetail.productNo" />
				<ec:column property="unitPrice" title="poShipDetail.unitPrice" />
				<ec:column property="unitPv" title="poShipDetail.unitPv" />
				<ec:column property="quantity" title="poShipDetail.quantity" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoShipDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poShipDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoShipDetail";
	
	showLoading();
	theForm.submit();
}
</script>