<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="wap.main.menu.CountOrder"/></title>
    <meta name="heading" content="<fmt:message key="wap.main.menu.CountOrder"/>"/>
</head>


<div class="searchBar">
	<form method="get" action="poOrders.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
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
			<dd><fmt:message key="poOrder.orderNo"/></dd>
			<dd><input type="text" name="orderNo" id="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd>
				<input type="text" name="userCode" id="userCode" value="${param.userCode }" size="12"/>
			</dd>
		</dl>
		<%-- <dl>
			<dd><fmt:message key="sys.agent.agentNo"/></dd>
			<dd>
				<input type="text" name="agentNo" id="agentNo" value="${param.agentNo }" size="12"/>
			</dd>
		</dl> --%>
		<dl>
			<dd><fmt:message key="pd.orderType"/></dd>
			<dd><win:list listCode="po_order_type" name="orderType" defaultValue="" value="${param.orderType }" showBlankLine="true"/></dd>
		</dl>
		<%-- <dl>
			<dd><fmt:message key="fiPayAdvice.dealType"/></dd>
			<dd>
				<win:list listCode="order_payment_method" name="paymentMethod" defaultValue="" value="${param.paymentMethod }" showBlankLine="true"/>
			</dd>
		</dl> --%>
		<dl>
			<dd><fmt:message key="poOrder.payStatus"/></dd>
			<dd>
				<win:list listCode="order_payment_status" name="paymentStatus" defaultValue="" value="${param.paymentStatus }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="poOrder.billType"/></dd>
			<dd>
				<win:list listCode="order_generate_method" name="generateMethod" defaultValue="" value="${param.generateMethod }" showBlankLine="true"/>
			</dd>
		</dl>

		<dl>
			<dd><fmt:message key="poOrder.billFromPersonNo"/></dd>
			<dd>
				<input type="text" name="creatorCode" id="creatorCode" value="${param.creatorCode }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="busi.product.productno"/></dd>
			<dd>
				<input type="text" name="productNo" id="productNo" value="${param.productNo }"/>
			</dd>
		</dl>
		<dl>
			<dd>
				<win:list listCode="order_search_date_types" name="dateType" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dd>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;"/>
			</dd>
		</dl>
		<%-- <dl>
			<dd><fmt:message key="poOrder.dateCY"/></dd>
			<dd><win:list name="orderDateDiff" listCode="order_date_diff" defaultValue="" value="${param.orderDateDiff}" showBlankLine=""/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="po.is.item.lable"/></dd>
			<dd><win:list name="isItem" listCode="yesno" defaultValue="0" value="${param.isItem}"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="order.is.refund"/></dd>
			<dd><win:list name="isRefund" listCode="yesno" defaultValue="" value="${param.isRefund}" showBlankLine="true"/></dd>
		</dl> --%>
		<%-- <dl>
			<dt>地区</dt>
			<dd>
				<div id="regionDiv"></div>
			</dd>
		</dl>
		<dl>
			<dt>含子地区</dt>
			<dd>
				<input type="checkbox" name="includeChildRegion" value="1"<c:if test="${param.includeChildRegion==1 }"> checked</c:if>/>
			</dd>
		</dl> --%>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="save"><fmt:message key="button.report"/></button>
			</dd>
		</dl>
	</form>
</div>


<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="4"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${poOrdersSumList.total_amount_sum }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${poOrdersSumList.total_pv_sum }</fmt:formatNumber></b>
		</td>
		<td class="footer" align="right" colspan="2"></td>
		<%-- <td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${poOrdersSumList.total_a0_amount }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${poOrdersSumList.total_a1_amount }</fmt:formatNumber></b>
		</td> --%>
		<td class="footer" align="right" colspan="6"></td>
	</tr>
</c:set>

<c:set var="goodsFootTotalVar">
	<tr>
		<td class="footer" align="right"><fmt:message key="poOrder.amtCount"/>：</td>
		<c:if test="${param.isItem!='1' }">
			<td class="footer" style="text-align: right;">
					<c:if test="${not empty poOrderGoodsSumList}">
						<fmt:formatNumber pattern="###,##0">${poOrderGoodsSumList.total_quantity-poOrderGoodsSumList.total_handsel_quantity }</fmt:formatNumber>
					</c:if>
					<c:if test="${empty poOrderGoodsSumList}">
						0
					</c:if>
			</td>
			<td class="footer" style="text-align: right;">
					<c:if test="${not empty poOrderGoodsSumList}">
						<fmt:formatNumber pattern="###,##0">${poOrderGoodsSumList.total_handsel_quantity }</fmt:formatNumber>
					</c:if>
					<c:if test="${empty poOrderGoodsSumList}">
						0
					</c:if>
			</td>
		</c:if>
		<td class="footer" style="text-align: right;">
				<c:if test="${not empty poOrderGoodsSumList}">
					<fmt:formatNumber pattern="###,##0">${poOrderGoodsSumList.total_quantity}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty poOrderGoodsSumList}">
					0
				</c:if>
		</td>
		<td class="footer" align="right" colspan="2"></td>
		<td class="footer" style="text-align: right;">
				<c:if test="${not empty poOrderGoodsSumList}">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrderGoodsSumList.total_unit_price }"/>
				</c:if>
				<c:if test="${empty poOrderGoodsSumList}">
					0.00
				</c:if>
		</td>
		<td class="footer" style="text-align: right;">
				<c:if test="${not empty poOrderGoodsSumList}">
					${poOrderGoodsSumList.total_unit_pv }
				</c:if>
				<c:if test="${empty poOrderGoodsSumList}">
					0.00
				</c:if>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="poOrders.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<%-- <div class="functionBar">
			<win:power powerCode="multiDeletePoOrder">
				<a href="javascript:multiDeletePoOrder();" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div> --%>
		<div class="functionBar">
			<%--<win:power powerCode="importOrder">--%>
			<%--<a href="importOrder.jhtml?" name="add">--%>
				<%--<fmt:message key="物流单号导入"/>--%>
			<%--</a>--%>
			<%--</win:power>--%>
		<input type="hidden" name="selectedOrderIds" id="selectedOrderIds">
		<input type="hidden" name="strAction" id="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderListTableForm" method="get" >
		<ec:table 
			tableId="poOrderListTable"
			items="poOrders"
			var="poOrder"
			action="poOrders.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderListTableForm" footer="${footTotalVar }">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:15px;">
					<a href="poOrderView.jhtml?orderId=${poOrder.order_id}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="order_no" title="poOrder.orderNo">
					${poOrder.order_no }
					<c:if test="${poOrder.pr_count>0 }">
						<font class="important">[退]</font>
					</c:if>
				</ec:column>
				<ec:column property="user_code" title="miMember.memberNo">
					${poOrder.user_code}
				</ec:column>
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="card_type" title="会员级别" >
					<win:code listCode="member.card.type" value="${poOrder.card_type}"></win:code>
				</ec:column>
				<%-- <ec:column property="agent_no" title="sys.agent.agentNo" /> --%>
				<ec:column property="total_amount" title="busi.order.amount" style="text-align: right;">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrder.total_amount }"/>
				</ec:column>
				<ec:column property="total_pv" title="poSell.totalPv" style="text-align: right;">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrder.total_pv }"/>
				</ec:column>
				<ec:column property="order_type" title="pd.orderType">
					<win:code listCode="po_order_type" value="${poOrder.order_type }"/>
				</ec:column>
				<%-- <ec:column property="payment_method" title="fiPayAdvice.dealType">
					<win:code listCode="order_payment_method" value="${poOrder.payment_method }"></win:code>
				</ec:column> --%>
				<ec:column property="payment_status" title="poOrder.payStatus"> 
					<c:choose>
						<c:when test="${poOrder.is_refund==1 }">
							<fmt:message key="pr.refund2"/>
						</c:when>
						<c:otherwise>
							<win:code listCode="po_order_status" value="${poOrder.status }"/>
						</c:otherwise>
					</c:choose>
				</ec:column>
				<%-- <ec:column property="a0_amount" title="现金支付" cell="currency" format="###,##0.00" styleClass="numberColumn"/>
				<ec:column property="a1_amount" title="重消支付" cell="currency" format="###,##0.00" styleClass="numberColumn"/>  --%>
				<ec:column property="generate_method" title="poOrder.billType">
					<win:code listCode="order_generate_method" value="${poOrder.generate_method }" />
				</ec:column>
				<ec:column property="creator_code" title="poOrder.billFromPersonNo" />
				<ec:column property="creator_name" title="poOrder.billFromPersonName" />
				<ec:column property="create_time" title="poOrder.billTime" >
					<c:if test="${poOrder.create_time!=null && poOrder.create_time!='' && fn:length(poOrder.create_time)>=19}">
						${fn:substring(poOrder.create_time,0,19)} 
					</c:if>
				</ec:column>
				<ec:column property="check_time" title="poOrder.payTime" />
				<ec:column property="calc_date" title="poOrder.calcDate" />

			</ec:row>
		</ec:table>
	</form>
	
	
	<form id="poOrderGoodsListTableForm" method="get" >
		<ec:table 
			tableId="poOrderGoodsListTable"
			items="poOrderGoods"
			var="poOrderGood"
			action="poOrders.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			showPagination="false"
			rowsDisplayed="20" sortable="false" form="poOrderGoodsListTableForm" footer="${goodsFootTotalVar }">
			<ec:row>
				<ec:column property="product_name" title="pdWarehouseStock.productNo">
					${poOrderGood.product_no }-${poOrderGood.product_name }
				</ec:column>
				<c:choose>
					<c:when test="${param.isItem=='1' }">
						<ec:column property="quantity" title="poOrder.count" styleClass="numberColumn"/>
					</c:when>
					<c:otherwise>
						<ec:column property="quantity" title="poOrder.count" styleClass="numberColumn">
							${poOrderGood.quantity-poOrderGood.handsel_quantity}
						</ec:column>
						<ec:column property="handsel_quantity" title="busi.handsel.quantity" styleClass="numberColumn"/>
						<ec:column property="quantity" title="busi.qty.subtotal" styleClass="numberColumn"/>
					</c:otherwise>
				</c:choose>
				<ec:column property="unit_price" title="prRefund.price" styleClass="numberColumn">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrderGood.unit_price }"/>
				</ec:column>
				<ec:column property="unit_pv" title="busi.direct.pv" styleClass="numberColumn"/>
				<ec:column property="unit_price_sum" title="busi.order.price.total" styleClass="numberColumn">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrderGood.unit_price_sum }"/>
				</ec:column>
				<ec:column property="unit_pv_sum" title="busi.order.pv.total" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
	
</div>
	
<script type="text/javascript">


$(function() {
	$( "#startDate,#endDate" ).datepicker();
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