<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxUserBindLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxUserBindLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxUserBindLog" method="post" id="wxUserBindLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUserBindLog.wxOpenid"/>:</th>
    		<td>${wxUserBindLog.wxOpenid }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUserBindLog.oldUserCode"/>:</th>
    		<td>${wxUserBindLog.oldUserCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUserBindLog.newUserCode"/>:</th>
    		<td>${wxUserBindLog.newUserCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUserBindLog.changeTime"/>:</th>
    		<td>${wxUserBindLog.changeTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUserBindLog.changeType"/>:</th>
    		<td>${wxUserBindLog.changeType }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxUserBindLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>