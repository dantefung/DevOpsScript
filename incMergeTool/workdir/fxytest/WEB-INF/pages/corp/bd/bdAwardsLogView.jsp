<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdAwardsLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdAwardsLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdAwardsLog" method="post" id="bdAwardsLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdAwardsLog.companyCode"/>:</th>
    		<td>${bdAwardsLog.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdAwardsLog.memberNo"/>:</th>
    		<td>${bdAwardsLog.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdAwardsLog.content"/>:</th>
    		<td>${bdAwardsLog.content }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdAwardsLog.createTime"/>:</th>
    		<td>${bdAwardsLog.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdAwardsLog.creator"/>:</th>
    		<td>${bdAwardsLog.creator }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='bdAwardsLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>