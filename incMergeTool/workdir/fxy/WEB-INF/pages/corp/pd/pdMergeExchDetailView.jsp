<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdMergeExchDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdMergeExchDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdMergeExchDetail" method="post" id="pdMergeExchDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchDetail.exchangeCode"/>:</th>
    		<td>${pdMergeExchDetail.exchangeCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchDetail.productId"/>:</th>
    		<td>${pdMergeExchDetail.productId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchDetail.unitPrice"/>:</th>
    		<td>${pdMergeExchDetail.unitPrice }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchDetail.unitPv"/>:</th>
    		<td>${pdMergeExchDetail.unitPv }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdMergeExchDetail.qty"/>:</th>
    		<td>${pdMergeExchDetail.qty }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdMergeExchDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>