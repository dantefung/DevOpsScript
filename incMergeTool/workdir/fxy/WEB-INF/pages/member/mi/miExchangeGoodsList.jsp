<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.exchange.goods.lable"/></title>
    <meta name="heading" content="<fmt:message key="mi.exchange.goods.lable"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miExchangeGoodsList.jhtml" onsubmit="return validateSearch(this)" class="form-inline">	
		<fmt:message key="pdSendInfo.siNo"/>:
		<input type="text" name="siNo" id="siNo" class="form-control" value="${param.siNo }" placeholder="<fmt:message key="pdSendInfo.siNo"/>"/>
		<button type="submit" name="search" class="btn btn-info"><fmt:message key="operation.button.search"/></button>
	</form>
</div>

<hr/>

<font color="red">${recieveFlag }</font>
<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="miExchangeGoodsList.jhtml" method="post" >
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
				<th><fmt:message key="pdSendInfo.siNo"/></th>
				<th><fmt:message key="po.ship.recievedno.lable"/></th>
				<th><fmt:message key="po.shipment.type"/></th>
				<th><fmt:message key="poOrder.orderNo"/></th>
				<th><fmt:message key="bonus.order.amount"/></th>
				<th><fmt:message key="pd.createTime"/></th>
				<th><fmt:message key="busi.common.remark"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${poShips}" var="poShip">
				<tr>
					<td>
						<win:power powerCode="miExchangeGoodsView">
							<a href="miExchangeGoodsView.jhtml?shipId=${poShip.ship_id}" class="btn btn-info btn-xs"><fmt:message key="function.menu.view"/></a>
						</win:power>
						<c:if test="${poShip.exchange_flag==0 }">
							<win:power powerCode="miExchangeGoods">
								<a href="miExchangeGoodsStep1.jhtml?shipId=${poShip.ship_id}&strAction=miExchangeGoods" class="btn btn-danger btn-xs"><fmt:message key="mi.exchange.goods.lable"/></a>
							</win:power>
						</c:if>
					</td>
					<td>${poShip.si_no }</td>
					<td>${poShip.recpt_code }</td>
					<td><win:code listCode="poship.shiptype" value="${poShip.ship_type }"/></td>
					<td>${poShip.order_no }</td>
					<td> <fmt:formatNumber pattern="###,##0.00">${poShip.order_total_price }</fmt:formatNumber></td>
					<td>${poShip.create_time }</td>
					<td>${poShip.remark } </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
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