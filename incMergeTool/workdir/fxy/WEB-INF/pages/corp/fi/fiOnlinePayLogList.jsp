<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listFiOnlinePayLogs"/></title>
    <meta name="heading" content="<fmt:message key="menu.listFiOnlinePayLogs"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiOnlinePayLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="fi.pay.memberNo"/></dt>
			<dd><input name="buyerCode" type="text" value="${param.buyerCode }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.pay.memberName"/></dt>
			<dd><input name="buyerName" type="text" value="${param.buyerName }"/></dd>
		</dl>
		<dl>
			<dt>订单编号</dt>
			<dd><input name="orderNo" type="text" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.remit.orderNo"/></dt>
			<dd><input name="outTradeNo" type="text" value="${param.outTradeNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.alipay.trade.no"/></dt>
			<dd><input name="tradeNo" type="text" value="${param.tradeNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.alipay.createTime"/></dt>
			<dd>
				<input type="hidden" name="dateType" id="dateType" value="create_time"/>
				<input name="startDate" id="startDate" type="text" value="${param.startDate }" size="12" class="readonly" readonly/>-
				<input name="endDate" id="endDate" type="text" value="${param.endDate }" size="12" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.pay.result"/></dt>
			<dd><win:list name="payResult" listCode="fialipaylogs.payresult" defaultValue="" value="${param.payResult }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.pay.money"/></dt>
			<dd><input name="startFee" type="text" value="${param.startFee }" size="10"/> - <input name="endFee" type="text" value="${param.endFee }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiOnlinePayLogs"/>
			</dd>
		</dl>
	</form>
</div>

<!-- 2014-11-03 Add 支付宝汇款明细增加显示付款金额合计数 -->
<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="10"><fmt:message key="report.allTotal"/></td>
		<td colspan="2" class="footer" style="text-align: left;">
			<b>
				<c:if test="${not empty fialipay_allTotal}">
					<fmt:formatNumber pattern="###,##0.00">${fialipay_allTotal }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty fialipay_allTotal}">
					0.00
				</c:if>
			</b>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="fiOnlinePayLogFunctionForm" id="fiOnlinePayLogFunctionForm" action="editFiOnlinePayLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="multiVerifyFiOnlinePayLog">
				<a href="#this" name="check" onclick="multiVerifyFiOnlinePayLog();">
					<fmt:message key="lang.confirm.rec.money"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="search">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiOnlinePayLogListTableForm" method="get" >
		<ec:table 
			tableId="fiOnlinePayLogListTable"
			items="fiOnlinePayLogs"
			var="fiOnlinePayLogVar"
			action="fiOnlinePayLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiOnlinePayLogListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="fi_balance.xls"/>
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${fiOnlinePayLogVar.pay_result==0}">
						<input type="checkbox" name="chkId" value="${fiOnlinePayLogVar.id}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				<ec:column property="payment_code" title="busi.order.payMode">
					<win:code listCode="online_payment_codes" value="${fiOnlinePayLogVar.payment_code}"/>
				</ec:column>
				<ec:column property="buyer_code" title="fi.pay.memberNo"/>
				<ec:column property="buyer_name" title="fi.pay.memberName"/>
				<ec:column property="order_no" title="poOrder.orderNo"/>
				<ec:column property="out_trade_no" title="fi.remit.orderNo" styleClass="centerColumn" viewsAllowed="html"/>
				<ec:column property="Out_trade_no" title="fi.remit.orderNo" styleClass="centerColumn" viewsDenied="html">'${fiOnlinePayLogVar.out_trade_no }</ec:column>
				<ec:column property="create_time" title="fi.alipay.createTime" styleClass="centerColumn"/>
				<ec:column property="return_time" title="fi.pay.return.time" styleClass="centerColumn"/>
				<ec:column property="pay_result" title="fi.pay.result" styleClass="centerColumn">
					<win:code listCode="fialipaylogs.payresult" value="${fiOnlinePayLogVar.pay_result }"></win:code>
				</ec:column>
				<ec:column property="trade_no" title="fi.alipay.trade.no" styleClass="centerColumn"/>
				<ec:column property="total_fee" title="fi.pay.money">
					<fmt:formatNumber pattern="###,##0.00" value="${fiOnlinePayLogVar.total_fee }"/>
				</ec:column>
				<ec:column property="remark" title="busi.common.remark"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiVerifyFiOnlinePayLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToConfirm'/>.");//请选择需要确认的条目
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToNoteSelectedOrderMoneyRec'/>?")){//确认标记所选条目为到款
		return;
	}
	var theForm=document.fiOnlinePayLogFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiVerifyFiOnlinePayLog";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>