<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<%
request.setAttribute("vEnter1", "\n");
request.setAttribute("vEnter2", "\r");
%>

<head>
    <title>${pmProduct.productName}</title>
    <meta name="heading" content="${pmProduct.productName}"/>
</head>

<style type="text/css">
body {
	background-image: none;
	background-color: #fff;
}
</style>

<strong>${pmProduct.productName}</strong>
<hr/>
${pmProductExtra.productDesc}

<script type="text/javascript">

</script>