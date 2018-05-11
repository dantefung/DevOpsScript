<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.viewPmPersonLimitAdjust"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.viewPmPersonLimitAdjust"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="pmPersonLimitAdjust" method="post" id="pmPersonLimitAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.company"/>:</th>
    		<td>${pmPersonLimitAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${pmPersonLimitAdjust.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.product.productno"/>:</th>
    		<td>${pmProduct.productCode } - ${pmProduct.productName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmLimitAdjust.adjustQty"/>:</th>
    		<td>${pmPersonLimitAdjust.adjustQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.qty.before.adjust"/>:</th>
    		<td>${pmPersonLimitAdjust.beforeQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.qty.after.adjust"/>:</th>
    		<td>${pmPersonLimitAdjust.afterQty }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${pmPersonLimitAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${pmPersonLimitAdjust.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${pmPersonLimitAdjust.checkTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.checkUser"/>:</th>
    		<td>${pmPersonLimitAdjust.checkerCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="pm_limit_adjust_status" value="${pmPersonLimitAdjust.status}"/></td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="busi.common.remark"/>:</th>
    		<td>${fn:replace(pmPersonLimitAdjust.remark, vEnter, '<br>')}</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>