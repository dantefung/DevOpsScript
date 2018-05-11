<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/>1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPoOrderDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="poOrderDetailFunctionForm" id="poOrderDetailFunctionForm" action="editPoOrderDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoOrderDetail">
				<a href="editPoOrderDetail.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePoOrderDetail">
				<a href="javascript:multiDeletePoOrderDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderDetailListTableForm" method="get" >
		<ec:table 
			tableId="poOrderDetailListTable"
			items="poOrderDetails"
			var="poOrderDetailVar"
			action="poOrderDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderDetailListTableForm">
			<ec:row>
				<ec:column alias="chkDetailId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkDetailId" value="${poOrderDetailVar.detailId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editPoOrderDetail">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPoOrderDetail.jhtml?strAction=editPoOrderDetail&detailId=${poOrderDetailVar.detailId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="detailId" title="poOrderDetail.detailId" />
				<ec:column property="orderId" title="poOrderDetail.orderId" />
				<ec:column property="companyCode" title="poOrderDetail.companyCode" />
				<ec:column property="productNo" title="poOrderDetail.productNo" />
				<ec:column property="unitPrice" title="poOrderDetail.unitPrice" />
				<ec:column property="unitPv" title="poOrderDetail.unitPv" />
				<ec:column property="quantity" title="poOrderDetail.quantity" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePoOrderDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkDetailId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.poOrderDetailFunctionForm;
	theForm.selectedDetailIds.value=selectedValues;
	theForm.strAction.value="multiDeletePoOrderDetail";
	
	showLoading();
	theForm.submit();
}
</script>