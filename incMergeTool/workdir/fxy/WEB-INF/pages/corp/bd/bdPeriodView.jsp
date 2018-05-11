<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdPeriodDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdPeriodDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdPeriod" method="post" id="bdPeriodForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.wyear"/>:</th>
    		<td>${bdPeriod.wyear }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.wmonth"/>:</th>
    		<td>${bdPeriod.wmonth }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.wweek"/>:</th>
    		<td>${bdPeriod.wweek }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.startTime"/>:</th>
    		<td>${bdPeriod.startTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.endTime"/>:</th>
    		<td>${bdPeriod.endTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.calcStatus"/>:</th>
    		<td>${bdPeriod.calcStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.confirmStatus"/>:</th>
    		<td>${bdPeriod.confirmStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.sendStatus"/>:</th>
    		<td>${bdPeriod.sendStatus }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.calcDate"/>:</th>
    		<td>${bdPeriod.calcDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.confirmDate"/>:</th>
    		<td>${bdPeriod.confirmDate }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.sendDate"/>:</th>
    		<td>${bdPeriod.sendDate }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wid"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdPeriods.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>