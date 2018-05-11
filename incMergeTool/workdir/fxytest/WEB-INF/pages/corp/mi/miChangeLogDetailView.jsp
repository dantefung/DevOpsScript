<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miChangeLogDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miChangeLogDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miChangeLogDetail" method="post" id="miChangeLogDetailForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.changeCode"/>:</th>
    		<td>${miChangeLogDetail.changeCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.tableName"/>:</th>
    		<td>${miChangeLogDetail.tableName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.columnName"/>:</th>
    		<td>${miChangeLogDetail.columnName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.oldValue"/>:</th>
    		<td>${miChangeLogDetail.oldValue }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.newValue"/>:</th>
    		<td>${miChangeLogDetail.newValue }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='miChangeLogDetails.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>