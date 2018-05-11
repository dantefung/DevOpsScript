<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxSponsorLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxSponsorLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxSponsorLog" method="post" id="wxSponsorLogForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.wxOpenid"/>:</th>
    		<td>${wxSponsorLog.wxOpenid }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.oldSponsorId"/>:</th>
    		<td>${wxSponsorLog.oldSponsorId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.newSponsorId"/>:</th>
    		<td>${wxSponsorLog.newSponsorId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.changeTime"/>:</th>
    		<td>${wxSponsorLog.changeTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxSponsorLog.sourceUrl"/>:</th>
    		<td>${wxSponsorLog.sourceUrl }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxSponsorLogs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>