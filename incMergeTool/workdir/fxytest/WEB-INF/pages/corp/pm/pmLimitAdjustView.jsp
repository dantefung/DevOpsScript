<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.viewPmLimitAdjust"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.viewPmLimitAdjust"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="pmLimitAdjust" method="post" id="pmLimitAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.company"/>:</th>
    		<td>${pmLimitAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.product.productno"/>:</th>
    		<td>${pmProduct.productCode } - ${pmProduct.productName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmLimitAdjust.adjustQty"/>:</th>
    		<td>${pmLimitAdjust.adjustQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.qty.before.adjust"/>:</th>
    		<td>${pmLimitAdjust.beforeQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.qty.after.adjust"/>:</th>
    		<td>${pmLimitAdjust.afterQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${pmLimitAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${pmLimitAdjust.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${pmLimitAdjust.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.checkUser"/>:</th>
    		<td>${pmLimitAdjust.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="pm_limit_adjust_status" value="${pmLimitAdjust.status}"/></td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="busi.common.remark"/>:</th>
    		<td>${fn:replace(pmLimitAdjust.remark, vEnter, '<br>')}</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>