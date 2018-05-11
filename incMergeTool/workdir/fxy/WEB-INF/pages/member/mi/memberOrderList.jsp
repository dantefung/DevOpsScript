<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.memberOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberOrders"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="memberOrders.jhtml" onsubmit="return validateSearch(this)" class="form-inline">	
		<fmt:message key="miMember.memberNo"/>:
		<input type="text" name="userCode" id="userCode" class="form-control input-sm" value="${param.userCode }" placeholder="<fmt:message key="miMember.memberNo"/>"/>
		<fmt:message key="poOrder.orderNo"/>:
		<input type="text" name="orderNo" id="orderNo" class="form-control" value="${param.orderNo }" placeholder="<fmt:message key="poOrder.orderNo"/>"/>
		<%-- <fmt:message key="mi.order.choose.date.lable"/>:
		<input type="hidden" name="dateType" id="dateType" value="create_time"/>
		<fmt:message key="mi.ic.from"/>
		<input type="date" name="startDate" id="startDate" value="${param.startDate }"  class="form-control" readonly="readonly" size="12"/>
		<fmt:message key="mi.ic.to"/>
		<input type="date" name="endDate" id="endDate" value="${param.endDate }"  class="form-control" size="12"/> --%>
		<button type="submit" name="search" class="btn btn-info"><fmt:message key="operation.button.search"/></button>
	</form>
</div>

<hr/>

<font color="red">${recieveFlag }</font>
<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="memberOrders.jhtml" method="post" >
	<%@ include file="/common/messages.jsp" %>
	
	<div class="functionBar">
	</div>
	<input type="hidden" name="selectedOrderIds">
	<input type="hidden" name="strAction">
	<input type="hidden" name="_form_uniq_id" value="${form.token}" />
</form>

<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="sysOperationLog.moduleName"/></th>
				<th><fmt:message key="poOrder.orderNo"/></th>
				<th><fmt:message key="miMember.memberNo"/></th>
				<th><fmt:message key="busi.order.amount"/>/<fmt:message key="poSell.totalPv"/></th>
				<th><fmt:message key="pocounterorder.csstatus"/></th>
				<th><fmt:message key="poOrder.billTime"/></th>
				<th><fmt:message key="mem.paytime"/></th>
				<th><fmt:message key="物流单号"/></th>
				<th><fmt:message key="物流公司"/></th>
				<%-- <th><fmt:message key="poOrder.calcDate"/></th> --%>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${poOrders}" var="poOrder">
				<tr>
					<td>
						<nobr>
							<c:if test="${poOrder.status != 100 && poOrder.status != 999}">
								<a onclick="return confirmRemove();" class="btn btn-danger btn-xs" href="memberOrderView.jhtml?doType=removeOrder&orderId=${poOrder.order_id}" name="remove"><fmt:message key="efubo.card.zf"/></a>
							</c:if>
							<!--跨国报单  (sessionLoginUser.userCode == poOrder.user_code && poOrder.flag==3) -->
							<%-- <c:if test="${(poOrder.status == 20 && (poOrder.payment_method == '02' || poOrder.payment_method == '05' || (poOrder.payment_method == '04' && sessionScope.sessionLoginUser.userCode==poOrder.creator_code)) && poOrder.order_type!=4 ) && 
										(sessionScope.sessionLoginUser.userCode == poOrder.creator_code && poOrder.company_code == sessionScope.sessionLoginUser.companyCode) }"> --%>
							<c:if test="${(poOrder.status == 20 && (poOrder.payment_method == '02' || poOrder.payment_method == '05' || poOrder.payment_method == '07' || (poOrder.payment_method == '04' && sessionScope.sessionLoginUser.userCode==poOrder.creator_code)) && poOrder.order_type!=4 ) && 
									(sessionScope.sessionLoginUser.userCode == poOrder.creator_code && poOrder.company_code == sessionScope.sessionLoginUser.companyCode) }">
								<a class="btn btn-success btn-xs" href="memberOrderPay.jhtml?orderId=${poOrder.order_id}" title="<fmt:message key="mem.pay"/>" name="pay"><fmt:message key="mem.pay"/></a>
							</c:if>
							<c:if test="${poOrder.status == 20 && poOrder.payment_method == '03' && sessionScope.sessionLoginUser.userCode==poOrder.creator_code}">
								<a class="btn btn-success btn-xs" href="memberOrderCheckStock.jhtml?orderId=${poOrder.order_id}" title="<fmt:message key="operation.button.check"/>" name="check"><fmt:message key="operation.button.check"/></a>
							</c:if>
						</nobr>
					</td>
					<td>
						<a href="memberOrderView.jhtml?orderId=${poOrder.order_id}">${poOrder.order_no }</a>
						<span class="label label-info"><win:code listCode="po_order_type" value="${poOrder.order_type }"/></span>
						<c:if test="${not empty poOrder.pr_status }">
							<br/>
							<span class="label label-default">
								<c:if test="${poOrder.pr_status==0 || poOrder.pr_status==1 }"><fmt:message key="lang.refunded.applied"/></c:if>
								<c:if test="${poOrder.pr_status==3 }"><fmt:message key="operation.notice.js.refunded"/></c:if>
								<c:if test="${poOrder.pr_status==5 }"><fmt:message key="operation.notice.total.refunded"/></c:if>
							</span>
						</c:if>
					</td>
					<td>${poOrder.user_code } <br/> ${poOrder.pet_name }</td>
					<td>
						<fmt:formatNumber pattern="##,###,#00.00" value="${poOrder.total_amount }"/>
						<br/><nobr><fmt:formatNumber pattern="##,###,#00.00" value="${poOrder.total_pv }"/> <fmt:message key="busi.pv"/></nobr>
					</td>
					<td> <win:code listCode="po_order_status" value="${poOrder.status }"/></td>
					<td>${poOrder.createtime }</td>
					<td>${poOrder.checktime }</td>
					<td>${poOrder.delivery_no }</td>
					<td>${poOrder.delivery_name }</td>
					<%-- <td>${poOrder.calcdate } </td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<%-- <c:forEach items="${poOrders }" var="poOrder">
	<div class="row">
		<div class="col-md-6">
			<fmt:message key="poOrder.orderNo"/>: ${poOrder.order_no }
			<span class="label label-info"><win:code listCode="po_order_type" value="${poOrder.order_type }"/></span>
		</div>
		<div class="col-md-6 text-right">
			<win:power powerCode="memberOrderView">
				<a href="memberOrderView.jhtml?orderId=${poOrder.order_id}" class="btn btn-info btn-xs"><fmt:message key="function.menu.view"/></a>
				<c:if test="${poOrder.status != 100 && poOrder.status != 999}">
					<a onclick="return confirmRemove();" class="btn btn-danger btn-xs" href="memberOrderView.jhtml?doType=removeOrder&orderId=${poOrder.order_id}" name="remove"><fmt:message key="efubo.card.zf"/></a>
				</c:if>
			</win:power>
			<!--跨国报单  (sessionLoginUser.userCode == poOrder.user_code && poOrder.flag==3) -->
			<c:if test="${(poOrder.status == 20 && (poOrder.payment_method == '02' || poOrder.payment_method == '05' || (poOrder.payment_method == '04' && sessionScope.sessionLoginUser.userCode==poOrder.creator_code)) && poOrder.order_type!=4 ) && 
						(sessionScope.sessionLoginUser.userCode == poOrder.creator_code && poOrder.company_code == sessionScope.sessionLoginUser.companyCode) }">
				<a class="btn btn-success btn-xs" href="memberOrderPay.jhtml?orderId=${poOrder.order_id}" title="<fmt:message key="mem.pay"/>" name="pay"><fmt:message key="mem.pay"/></a>
			</c:if>
			<c:if test="${poOrder.status == 20 && poOrder.payment_method == '03' && sessionScope.sessionLoginUser.userCode==poOrder.creator_code}">
				<a class="btn btn-success btn-xs" href="memberOrderCheckStock.jhtml?orderId=${poOrder.order_id}" title="<fmt:message key="operation.button.check"/>" name="check"><fmt:message key="operation.button.check"/></a>
			</c:if>
		</div>
		<div class="col-md-12">
			<fmt:message key="miMember.memberNo"/>: ${poOrder.user_code } - ${poOrder.pet_name }<br/>
			<fmt:message key="busi.order.amount"/>: <fmt:formatNumber pattern="##,###,#00.00" value="${poOrder.total_amount }"/><br/>
			<fmt:message key="poSell.totalPv"/>: <fmt:formatNumber pattern="##,###,#00.00" value="${poOrder.total_pv }"/><br/>
			<fmt:message key="fiPayAdvice.dealType"/>: <win:code listCode="order_payment_method" value="${poOrder.payment_method }"/><br/>
			<fmt:message key="pocounterorder.csstatus"/>: <win:code listCode="po_order_status" value="${poOrder.status }"/><br/>
		    <fmt:message key="poOrder.billTime"/>: ${poOrder.createtime }<br/>
			<fmt:message key="mem.paytime"/>: ${poOrder.checktime }<br/>
			<fmt:message key="poOrder.calcDate"/>: ${poOrder.calcdate } 
			<fmt:message key="poOrder.calcDate"/>: <fmt:parseDate value="${poOrder.calc_date}" var="calcDate" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${calcDate}"/>
			<hr/>
		</div>
	</div>

</c:forEach> --%>

<win:page pageId="poOrderListPager" action="memberOrders.jhtml" autoIncludeParameters="true"/>
	
<form action="memberOrderRecieve.jhtml" method="post" name="recieveFrm" id="recieveFrm">
	<input type="hidden" name="orderId" id="orderId">
	<input type="hidden" name="orderNo" id="orderNo">
	<input type="hidden" name="userCode" id="userCode">
	<input type="hidden" name="strAction" id="strAction" value="memberOrderReceived">
</form>	



<script type="text/javascript">
$(function() {
	//$( "#startDate,#endDate" ).datepicker();
});
function recieve(orderId,orderNo,userCode){
	if(confirm("<fmt:message key="mi.recieve.sure.prompt"/>?")){
		document.recieveFrm.orderId.value= orderId;
		document.recieveFrm.orderNo.value= orderNo;
		document.recieveFrm.userCode.value= userCode;
		document.recieveFrm.submit();
	}
}
function validateSearch(theForm) {
	showLoading();
	return true;
}

function confirmRemove(){
	if(confirm("<fmt:message key="mi.button.cancle.sure"/>?")){
		return true;
	}
	return false;
}
</script>