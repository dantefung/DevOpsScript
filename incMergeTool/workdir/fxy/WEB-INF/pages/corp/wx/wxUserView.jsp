<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxUserDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxUser" method="post" id="wxUserForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.sponsorWxOpenid"/>:</th>
    		<td>${wxUser.sponsorWxOpenid }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.userCode"/>:</th>
    		<td>${wxUser.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.wxUserCode"/>:</th>
    		<td>${wxUser.wxUserCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.nickName"/>:</th>
    		<td>${wxUser.nickName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.signature"/>:</th>
    		<td>${wxUser.signature }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.country"/>:</th>
    		<td>${wxUser.country }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.province"/>:</th>
    		<td>${wxUser.province }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.city"/>:</th>
    		<td>${wxUser.city }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.sex"/>:</th>
    		<td>${wxUser.sex }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.avatar"/>:</th>
    		<td>${wxUser.avatar }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.avatarRemote"/>:</th>
    		<td>${wxUser.avatarRemote }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.isAuth"/>:</th>
    		<td>${wxUser.isAuth }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.isUnfollow"/>:</th>
    		<td>${wxUser.isUnfollow }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.authExpireTime"/>:</th>
    		<td>${wxUser.authExpireTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.isService"/>:</th>
    		<td>${wxUser.isService }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceType"/>:</th>
    		<td>${wxUser.serviceType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceName"/>:</th>
    		<td>${wxUser.serviceName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceNo"/>:</th>
    		<td>${wxUser.serviceNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastServiceTime"/>:</th>
    		<td>${wxUser.lastServiceTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastGetinfoTime"/>:</th>
    		<td>${wxUser.lastGetinfoTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.markName"/>:</th>
    		<td>${wxUser.markName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.createTime"/>:</th>
    		<td>${wxUser.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastVisitTime"/>:</th>
    		<td>${wxUser.lastVisitTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastAlertTime"/>:</th>
    		<td>${wxUser.lastAlertTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wxOpenid"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxUsers.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>