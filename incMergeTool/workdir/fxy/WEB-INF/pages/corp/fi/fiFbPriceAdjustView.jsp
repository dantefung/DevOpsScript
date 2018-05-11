<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="FCF收盘价管理"/></title>
    <meta name="heading" content="<fmt:message key="FCF收盘价管理"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiFbPriceAdjust" method="post" id="fiFbPriceAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.companyCode"/>:</th>
    		<td>${fiFbPriceAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.stockPrice"/>:</th>
    		<td>${fiFbPriceAdjust.stockPrice }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.creatorCode"/>:</th>
    		<td>${fiFbPriceAdjust.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.createTime"/>:</th>
    		<td>${fiFbPriceAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.checkerCode"/>:</th>
    		<td>${fiFbPriceAdjust.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.checkTime"/>:</th>
    		<td>${fiFbPriceAdjust.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.remark"/>:</th>
    		<td>${fiFbPriceAdjust.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiFbPriceAdjust.status"/>:</th>
    		<td>${fiFbPriceAdjust.status }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='fiFbPriceAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>