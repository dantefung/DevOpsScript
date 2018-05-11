<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.exchange.mine"/></title>
    <meta name="heading" content="<fmt:message key="mi.exchange.mine"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miExchangeList.jhtml" onsubmit="return validateSearch(this)" class="form-inline">	
		<fmt:message key="busi.pdExchangeOrder.no"/>:
		<input type="text" name="exchangeCode" id="exchangeCode" class="form-control" value="${param.exchangeCode }" placeholder="<fmt:message key="busi.pdExchangeOrder.no"/>"/>
		<fmt:message key="pdSendInfo.siNo"/>:
		<input type="text" name="siNo" id="siNo" class="form-control" value="${param.siNo }" placeholder="<fmt:message key="pdSendInfo.siNo"/>"/>
		<button type="submit" name="search" class="btn btn-info"><fmt:message key="operation.button.search"/></button>
	</form>
</div>

<hr/>

<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="sysOperationLog.moduleName"/></th>
				<th><fmt:message key="busi.pdExchangeOrder.no"/></th>
				<th><fmt:message key="pdSendInfo.siNo"/></th>
				<th><fmt:message key="miMember.memberNo"/></th>
				<th><fmt:message key="pd.createTime"/></th>
				<th><fmt:message key="mi.needmoney"/></th>
				<th><fmt:message key="poOrder.payStatus"/></th>
				<th><fmt:message key="mem.paytime"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pdExchanges}" var="exchangeVar">
				<tr>
					<td>
						<win:power powerCode="miExchangeView">
							<a href="miExchangeView.jhtml?exchangeCode=${exchangeVar.exchange_code}" class="btn btn-info btn-xs"><fmt:message key="function.menu.view"/></a>
						</win:power>
						<c:if test="${exchangeVar.pay_status=='0' && exchangeVar.exchange_total_amount>0}">
						<win:power powerCode="miExchangeOrderPay">
							<a class="btn btn-success btn-xs" href="miExchangeOrderPay.jhtml?exchangeCode=${exchangeVar.exchange_code}" title="<fmt:message key="mem.pay"/>" name="pay"><fmt:message key="mem.pay"/></a>
						</win:power>
						</c:if>
					</td>
					<td>${exchangeVar.exchange_code }</td>
					<td>${exchangeVar.si_no }</td>
					<td>${exchangeVar.user_code }- ${exchangeVar.user_name }</td>
					<td>${exchangeVar.creator_code } - ${exchangeVar.create_time }</td>
					<td><fmt:formatNumber pattern="###,##0.00" value="${exchangeVar.exchange_total_amount }"/></td>
					<td><win:code listCode="order_payment_status" value="${exchangeVar.pay_status }"/></td>
					<td>${exchangeVar.exchange_pay_time }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



<script type="text/javascript">
$(function() {
	//$( "#startDate,#endDate" ).datepicker();
});
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