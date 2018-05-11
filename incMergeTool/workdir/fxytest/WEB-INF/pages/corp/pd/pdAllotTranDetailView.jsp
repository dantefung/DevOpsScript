<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdAllotTranDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdAllotTranDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdAllotTranDetail" method="post" id="pdAllotTranDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAllotTranDetail.tranNo"/>:</th>
    		<td>${pdAllotTranDetail.tranNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAllotTranDetail.productCode"/>:</th>
    		<td>${pdAllotTranDetail.productCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAllotTranDetail.qty"/>:</th>
    		<td>${pdAllotTranDetail.qty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAllotTranDetail.price"/>:</th>
    		<td>${pdAllotTranDetail.price }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pdAllotTranDetail.transferPrice"/>:</th>
    		<td>${pdAllotTranDetail.transferPrice }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='pdAllotTranDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>