<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miCreditAdjustDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miCreditAdjustDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miCreditAdjust" method="post" id="miCreditAdjustForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.memberNo"/>:</th>
    		<td>${miCreditAdjust.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.oldStatus"/>:</th>
    		<td>${miCreditAdjust.oldStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.newStatus"/>:</th>
    		<td>${miCreditAdjust.newStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.creatorCode"/>:</th>
    		<td>${miCreditAdjust.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.createTime"/>:</th>
    		<td>${miCreditAdjust.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miCreditAdjust.remark"/>:</th>
    		<td>${miCreditAdjust.remark }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miCreditAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>