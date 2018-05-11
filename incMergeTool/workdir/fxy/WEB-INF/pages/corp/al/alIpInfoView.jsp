<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alIpInfoDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="alIpInfoDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="alIpInfo" method="post" id="alIpInfoForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alIpInfo.startIp"/>:</th>
    		<td>${alIpInfo.startIp }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alIpInfo.endIp"/>:</th>
    		<td>${alIpInfo.endIp }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alIpInfo.ipLocale"/>:</th>
    		<td>${alIpInfo.ipLocale }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="infoId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='alIpInfos.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>