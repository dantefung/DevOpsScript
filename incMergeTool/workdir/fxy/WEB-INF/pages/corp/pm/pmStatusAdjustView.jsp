<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pm.viewPmStatusAdjust"/></title>
    <meta name="heading" content="<fmt:message key="menu.pm.viewPmStatusAdjust"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="pmStatusAdjust" method="post" id="pmStatusAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.company"/>:</th>
    		<td>${pmStatusAdjust.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.product.productno"/>:</th>
    		<td>${pmProduct.productCode } - ${pmProduct.productName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.new.status"/>:</th>
    		<td><win:code listCode="pmproduct.status" value="${pmStatusAdjust.newStatus}"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="pmstatusadjust.status" value="${pmStatusAdjust.status}"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${pmStatusAdjust.createrCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${pmStatusAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.checkUser"/>:</th>
    		<td>${pmStatusAdjust.approverCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${pmStatusAdjust.approveTime }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="busi.common.remark"/>:</th>
    		<td>${fn:replace(pmStatusAdjust.adjustRemark, vEnter, '<br>')}</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>