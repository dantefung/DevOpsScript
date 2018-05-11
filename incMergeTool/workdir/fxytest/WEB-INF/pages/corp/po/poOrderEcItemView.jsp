<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderEcItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderEcItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poOrderEcItem" method="post" id="poOrderEcItemForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderEcItem.detailId"/>:</th>
    		<td>${poOrderEcItem.detailId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderEcItem.companyCode"/>:</th>
    		<td>${poOrderEcItem.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderEcItem.ecProductNo"/>:</th>
    		<td>${poOrderEcItem.ecProductNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrderEcItem.quantity"/>:</th>
    		<td>${poOrderEcItem.quantity }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="itemId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='poOrderEcItems.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>