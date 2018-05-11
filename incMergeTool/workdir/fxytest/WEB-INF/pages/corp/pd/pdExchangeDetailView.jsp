<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdExchangeDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdExchangeDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdExchangeDetail" method="post" id="pdExchangeDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.exchangeCode"/>:</th>
    		<td>${pdExchangeDetail.exchangeCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.productId"/>:</th>
    		<td>${pdExchangeDetail.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.unitPrice"/>:</th>
    		<td>${pdExchangeDetail.unitPrice }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.unitPv"/>:</th>
    		<td>${pdExchangeDetail.unitPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.qty"/>:</th>
    		<td>${pdExchangeDetail.qty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdExchangeDetail.isOld"/>:</th>
    		<td>${pdExchangeDetail.isOld }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdExchangeDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>