<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fi.zhcz"/></title>
    <meta name="heading" content="<fmt:message key="fi.zhcz"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/payment.css" type="text/css"/>
<form  method="post" action="${fiAlipayBuySafe.url }"  name="fiAlipayLogForm" id="fiAlipayLogForm">  
    <input type="hidden" name="web" value="${fiAlipayBuySafe.web }"/>
    <input type="hidden" name="MN" value="${fiAlipayBuySafe.MN }"/>
    <input type="hidden" name="OrderInfo" value="${fiAlipayBuySafe.orderInfo }"/>
    <input type="hidden" name="Td" value="${fiAlipayBuySafe.td }"/> 
     <input type="hidden" name="sna" value="${fiAlipayBuySafe.sna }"/>
    <input type="hidden" name="sdt" value="${fiAlipayBuySafe.sdt }"/>
    <input type="hidden" name="email" value="${fiAlipayBuySafe.email }"/>
     <input type="hidden" name="note1" value="${fiAlipayBuySafe.note1 }"/>
    <input type="hidden" name="note2" value="${fiAlipayBuySafe.note2 }"/>
    <input type="hidden" name="Card_Type" value="${fiAlipayBuySafe.card_Type }"/>
    <input type="hidden" name="ChkValue" value="${fiAlipayBuySafe.chkValue }"/> 
</form>

<script type="text/javascript">
$(document).ready(function(){
	document.getElementById("fiAlipayLogForm").submit();
});
</script>