<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<form  method="post" action="${sdoPaymentBean.sendUrl }"  name="sdoPaymentForm" id="sdoPaymentForm" >  
	<input type="hidden" name="Name"  value="${sdoPaymentBean.name}">
   <input type="hidden" name="Version"  value="${sdoPaymentBean.version}">
	<input type="hidden" name="Charset"  value="${sdoPaymentBean.charset}">
	<input type="hidden" name="MsgSender"  value="${sdoPaymentBean.msgSender}">
	<input type="hidden" name="SendTime"  value="${sdoPaymentBean.sendTime}">
	
	<input type="hidden" name="OrderNo"  value="${sdoPaymentBean.orderNo}">
	<input type="hidden" name="OrderAmount"  value="${sdoPaymentBean.orderAmount}">
	<input type="hidden" name="OrderTime"  value="${sdoPaymentBean.orderTime}">
	<input type="hidden" name="Currency"  value="${sdoPaymentBean.currency}">
	<input type="hidden" name="PayType"  value="${sdoPaymentBean.payType}">
	<input type="hidden" name="PayChannel"  value="${sdoPaymentBean.payChannel}"><!-- 支付渠道，当指定PayType 为 PT001网银直连支付模式时有效（19 储蓄卡，20 信用卡 12企业网银） -->
	
	<input type="hidden" name="InstCode"  value="${sdoPaymentBean.instCode}">
	<input type="hidden" name="PageUrl"  value="${sdoPaymentBean.pageUrl}">
	<input type="hidden" name="BackUrl"  value="${sdoPaymentBean.backUrl }">
	<input type="hidden" name="NotifyUrl"  value="${sdoPaymentBean.notifyUrl}">
	<input type="hidden" name="ProductName"  value="${sdoPaymentBean.productName}">
	<input type="hidden" name="BuyerContact"  value="${sdoPaymentBean.buyerContact}">
	<input type="hidden" name="BuyerIp"  value="${sdoPaymentBean.buyerIp}">
	
	<input type="hidden" name="realName"  value="${sdoPaymentBean.realName}">
	<input type="hidden" name="idNo"  value="${sdoPaymentBean.idNo}">
	<input type="hidden" name="Mobile"  value="${sdoPaymentBean.mobile}">
	
	<input type="hidden" name="Ext1"  value="${sdoPaymentBean.ext1}">
	<input type="hidden" name="SignType"  value="${sdoPaymentBean.signType}">
	<input type="hidden" name="SignMsg"  value="${sdoPaymentBean.signMsg}">
</form>
<script type="text/javascript">
$(document).ready(function(){
	showLoading();
	document.getElementById("sdoPaymentForm").submit();
});

</script>