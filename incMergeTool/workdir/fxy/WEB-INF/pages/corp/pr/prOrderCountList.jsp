<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listPrOrdersCount"/></title>
    <meta name="heading" content="<fmt:message key="menu.listPrOrdersCount"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="prOrdersCount.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>	
		<dl>
			<dt><fmt:message key="prRefund.reNo"/></dt>
			<dd><input type="text" name="prNo" value="${param.prNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="prReFund.originateOrderNo"/></dt>
			<dd><input type="text" name="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.orderType"/></dt>
			<dd>
				<win:list name="orderType" listCode="po_order_type" defaultValue="" value="${param.orderType }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd>
				<win:list name="status" listCode="prorder.status" defaultValue="" value="${param.status }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.approvalStatus"/></dt>
			<dd>
				<win:list name="isFinished" listCode="prorder.isfinished" defaultValue="" value="${param.isFinished }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmProductSppm.createUser"/></dt>
			<dd><input type="text" name="creatorCode" value="${param.creatorCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q2"/></dt>
			<dd><input type="text" name="intoCode" value="${param.intoCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q3"/></dt>
			<dd><input type="text" name="refundCode" value="${param.refundCode }"/></dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="prorder.datetype" defaultValue="" value="${param.dateType }" showBlankLine="true"></win:list>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				-
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q4"/></dt>
			<dd><win:list name="hasAttach" listCode="yesno" defaultValue="" value="${param.hasAttach }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPrOrdersCount"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="8"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrdersSum}">
					<fmt:formatNumber pattern="###,##0.00">${prOrdersSum.total_price_sum }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrdersSum}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrdersSum}">
					<fmt:formatNumber pattern="###,##0.00">${prOrdersSum.total_amount_sum }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrdersSum}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrdersSum}">
					<fmt:formatNumber pattern="###,##0.00">${prOrdersSum.total_pv_sum }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrdersSum}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="6"></td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrdersSum}">
					<fmt:formatNumber pattern="###,##0.00">${prOrdersSum.refund_amt_sum }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrdersSum}">
					0.00
				</c:if>
			</b>
		</td>
	</tr>
</c:set>

<c:set var="goodsFootTotalVar">
	<tr>
		<td class="footer" align="right"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrderGoodsSumList}">
					<fmt:formatNumber pattern="###,##0">${prOrderGoodsSumList.total_quantity-prOrderGoodsSumList.total_handsel_quantity }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrderGoodsSumList}">
					0
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrderGoodsSumList}">
					<fmt:formatNumber pattern="###,##0">${prOrderGoodsSumList.total_handsel_quantity }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrderGoodsSumList}">
					0
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrderGoodsSumList}">
					<fmt:formatNumber pattern="###,##0">${prOrderGoodsSumList.total_quantity}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty prOrderGoodsSumList}">
					0
				</c:if>
			</b>
		</td>
		<td class="footer" align="right" colspan="2"></td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrderGoodsSumList}">
					<fmt:formatNumber pattern="##,##0.00" value="${prOrderGoodsSumList.total_unit_price }"/>
				</c:if>
				<c:if test="${empty prOrderGoodsSumList}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty prOrderGoodsSumList}">
					${prOrderGoodsSumList.total_unit_pv }
				</c:if>
				<c:if test="${empty prOrderGoodsSumList}">
					0.00
				</c:if>
			</b>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="prOrderFunctionForm" id="prOrderFunctionForm" action="editPrOrder.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<input type="hidden" name="selectedPrIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="prOrderListTableForm" method="get" >
		<ec:table 
			tableId="prOrderListTable"
			items="prOrders"
			var="prOrderVar"
			action="prOrdersCount.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="prOrderListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="prOrderCount.xls"/>
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
					<a href="viewPrOrder.jhtml?strAction=viewPrOrder&prId=${prOrderVar.pr_id}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company"  viewsAllowed="html"/>
				<ec:column property="pr_no" title="prRefund.reNo" >
					${prOrderVar.pr_no }
					<c:if test="${prOrderVar.apply_file_num>0 }">
						<span class="ui-icon ui-icon-attachment" style="display:inline-block;vertical-align: text-bottom;"></span>
					</c:if>
				</ec:column>
				<ec:column property="order_no" title="prReFund.originateOrderNo" />
				<ec:column property="user_code" title="fiPayAdvice.userCode" />
				<ec:column property="user_name" title="会员姓名" />
				<ec:column property="payer_code" title="付款人">
					${prOrderVar.payer_code } - ${prOrderVar.payer_name }
				</ec:column>
				<ec:column property="payer_name" title="poOrder.payerName" />
				<ec:column property="total_price" title="poSell.totalPrice" styleClass="numberColumn"/>
				<ec:column property="total_amount" title="bonus.order.amount" styleClass="numberColumn"/>
				<ec:column property="total_pv" title="poSell.totalPv" styleClass="numberColumn"/>
				<ec:column property="Order_type" title="pd.orderType" >
					<win:code listCode="po_order_type" value="${prOrderVar.order_type }"></win:code>
				</ec:column>
				<ec:column property="Status" title="fi.status" >
					<win:code listCode="prorder.status" value="${prOrderVar.status }"></win:code>
				</ec:column>
				<ec:column property="create_time" title="pd.createTime" >
					${prOrderVar.creator_code } - ${prOrderVar.create_time }
				</ec:column>
				<ec:column property="into_time" title="pr.msg.q5">
					${prOrderVar.into_code } - ${prOrderVar.into_time }
				</ec:column>
				<ec:column property="refund_time" title="busi.order.refundTime">
					${prOrderVar.refund_code } - ${prOrderVar.refund_time }
				</ec:column>
				<ec:column property="calc_date" title="计算时间"/>
				<ec:column property="refund_amt" title="pr.msg.q6" styleClass="numberColumn" />
			</ec:row>
		</ec:table>
	</form>
	
	<form id="prOrderGoodsListTableForm" method="get" >
		<ec:table 
			tableId="prOrderGoodsListTable"
			items="prOrderGoods"
			var="prOrderGood"
			action="prOrdersCount.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			showPagination="false"
			rowsDisplayed="20" sortable="false" form="prOrderGoodsListTableForm" footer="${goodsFootTotalVar }">
			<ec:exportXls fileName="prOrderGoods.xls"/>
			<ec:row>
				<ec:column property="product_name" title="pdWarehouseStock.productNo">
					${prOrderGood.product_no }-${prOrderGood.product_name }
				</ec:column>
				<ec:column property="quantity" title="poOrder.count" styleClass="numberColumn">
					${prOrderGood.quantity-prOrderGood.handsel_quantity}
				</ec:column>
				<ec:column property="handsel_quantity" title="busi.handsel.quantity" styleClass="numberColumn"/>
				<ec:column property="quantity" title="busi.qty.subtotal" styleClass="numberColumn"/>
				<ec:column property="unit_price" title="prRefund.price" styleClass="numberColumn">
					<fmt:formatNumber pattern="##,##0.00" value="${prOrderGood.unit_price }"/>
				</ec:column>
				<ec:column property="unit_pv" title="busi.direct.pv" styleClass="numberColumn"/>
				<ec:column property="unit_price_sum" title="busi.order.price.total" styleClass="numberColumn">
					<fmt:formatNumber pattern="##,##0.00" value="${prOrderGood.unit_price_sum }"/>
				</ec:column>
				<ec:column property="unit_pv_sum" title="busi.order.pv.total" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
	
	<form action="editPrOrder.jhtml" method="post" name="editForm" id="editForm">
		<input type="hidden" name="strAction" value=""/>
		<input type="hidden" name="prId"/>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker();
});

function submitPrOrder(prId){
	if(confirm("<fmt:message key='mi.suresubmitm'/>")){
		document.editForm.prId.value = prId;
		document.editForm.strAction.value = "submitPrOrder";
		document.editForm.submit();
	}
}
function cancelPrOrder(prId){
	if(confirm("<fmt:message key='button.confirm.invalid'/>?")){
		document.editForm.prId.value = prId;
		document.editForm.strAction.value = "cancelPrOrder";
		document.editForm.submit();
	}
}

function validateSearch(theForm) {
	showLoading();
	return true;
}





function multiDeletePrOrder(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPrId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.prOrderFunctionForm;
	theForm.selectedPrIds.value=selectedValues;
	theForm.strAction.value="multiDeletePrOrder";
	
	showLoading();
	theForm.submit();
}
</script>