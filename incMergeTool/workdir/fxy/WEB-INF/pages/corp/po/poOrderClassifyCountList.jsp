<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/messages.jsp"%>

<head>
<title><fmt:message key="wap.main.order.classify.count" /></title>
<meta name="heading"
	content="<fmt:message key="wap.main.order.classify.count"/>" />
</head>

<div class="searchBar">
	<form method="get" action="poOrderClassifyCount.jhtml"
		onsubmit="return validateSearch(this)">
		<dl>
			<dd>
				<fmt:message key="poOrder.payTime" />
			</dd>
			<dd>
				<fmt:message key="from" />
				&nbsp;<input type="text" name="startDate" id="startDate"
					value="${param.startDate }" style="width: 80px;" />
				<fmt:message key="to" />
				&nbsp;<input type="text" name="endDate" id="endDate"
					value="${param.endDate }" style="width: 80px;" />
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search">
					<fmt:message key="operation.button.search" />
				</button>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="save">
					<fmt:message key="button.report" />
				</button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="poOrderClassifyCountListTableForm" method="get" >
		<ec:table 
			tableId="poOrderClassifyCountListTable"
			items="poOrderlist"
			var="poOrder"
			action="poOrderClassifyCount.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderClassifyCountListTableForm">
			<ec:row>
				<ec:column property="ordertype" title="pd.orderType">
					<win:code listCode="po_order_type" value="${poOrder.ordertype }"/>
					<c:if test="${empty poOrder.totalamount}">
						<fmt:message key="report.subtotal"/>
					</c:if>
				</ec:column>
				<ec:column property="totalamount" title="poOrder.shopAmount" />
				<ec:column property="amount" title="po.quantity" />
				<ec:column property="total" title="busi.poMemberOrder.total.amount" />
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate" ).datepicker();
});

$(function() {
	$( "#endDate" ).datepicker();
});

function validateSearch(theForm) {
	//showLoading();
	return true;
}

function multiDeletePoOrder(){
	var selectedValues = getCheckedBoxesValue(document.getElementsByName("chkOrderId"));
	if(selectedValues == null || selectedValues == ''){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}

	if(confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		
		var theForm = document.memberOrderSearchForm;
		theForm.selectedOrderIds.value = selectedValues;
		theForm.strAction.value="multiDeletePoOrder";
		
		showLoading();
		theForm.submit();
	}
}	
</script>