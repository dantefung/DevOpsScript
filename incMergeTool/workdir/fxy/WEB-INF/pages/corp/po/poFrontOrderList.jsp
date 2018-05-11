<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="前台辅销品订购"/></title>
    <meta name="heading" content="<fmt:message key="前台辅销品订购"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poFrontOrders.jhtml" onsubmit="return validateSearch(this)">
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
		<dl>
			<dd><fmt:message key="poOrder.payStatus"/></dd>
			<dd>
				<win:list listCode="order_payment_status" name="paymentStatus" defaultValue="" value="${param.paymentStatus }" showBlankLine="true"/>
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
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="editPoFrontOrder.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPoFrontOrder">
				<a href="editPoFrontOrder.jhtml?strAction=addPoFrontOrder" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkPoFrontOrder">
				<a href="javascript:multiCheckPoFrontOrder()" name="check">
					审核
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedOrderIds" id="selectedOrderIds">
		<input type="hidden" name="strAction" id="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderListTableForm" method="get" >
		<ec:table 
			tableId="poOrderListTable"
			items="poOrders"
			var="poOrder"
			action="poFrontOrders.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderListTableForm" footer="${footTotalVar }">
			<ec:row>
				<ec:column alias="chkOrderId" headerCell="selectAll" style="width:5px;">
					<c:if test="${poOrder.status!=100 && poOrder.status!=999}">
						<input type="checkbox" name="chkOrderId" value="${poOrder.order_id}" class="checkbox"/>
					</c:if>
					<c:if test="${poOrder.status==100 || poOrder.status==999}">
						&nbsp;
					</c:if>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:15px;">
					<nobr>
						<a href="poOrderView.jhtml?orderId=${poOrder.order_id}" name="view"><fmt:message key="function.menu.view"/></a>
						<c:if test="${poOrder.status!=100 && poOrder.status!=999}">
							<!-- 未审核 -->
							<win:power powerCode="editPoFrontOrder">
								<a href="editPoFrontOrder.jhtml?strAction=editPoFrontOrder&orderId=${poOrder.order_id}" name="edit"><fmt:message key="button.edit"/></a>
							</win:power>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="order_no" title="poOrder.orderNo" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="total_amount" title="busi.order.amount" style="text-align: right;">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrder.total_amount }"/>
				</ec:column>
				<ec:column property="total_pv" title="poSell.totalPv" style="text-align: right;"/>
				<ec:column property="order_type" title="pd.orderType">
					<win:code listCode="po_order_type" value="${poOrder.order_type }"/>
				</ec:column>
				<ec:column property="payment_status" title="poOrder.payStatus"> 
					<win:code listCode="po_order_status" value="${poOrder.status }"/>
				</ec:column>
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
	
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker();
});

function validateSearch(theForm) {
	//showLoading();
	return true;
}

function multiCheckPoFrontOrder(){
	var selectedValues = getCheckedBoxesValue(document.getElementsByName("chkOrderId"));
	if(selectedValues == null || selectedValues == ''){
		alert("<fmt:message key='请选择需要审核的单据'/>.");
		return;
	}

	if(confirm("<fmt:message key='确认审核所选择的单据'/>.")){
		
		var theForm = document.memberOrderSearchForm;
		theForm.selectedOrderIds.value = selectedValues;
		theForm.strAction.value="checkPoFrontOrder";
		
		showLoading();
		theForm.submit();
	}
}
</script>