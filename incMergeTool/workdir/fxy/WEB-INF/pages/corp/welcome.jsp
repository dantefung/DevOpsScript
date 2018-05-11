<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="欢迎使用"/></title>
    <meta name="heading" content="<fmt:message key='欢迎使用'/>"/>
</head>

<div style="margin:8px;">
您好，您当前是第<span class="redBold">
<c:if test="${empty sysUser.loginTimes }">1</c:if>
<c:if test="${not empty sysUser.loginTimes }">${sysUser.loginTimes}</c:if>
</span>
次登录本系统
<c:if test="${not empty sessionScope.sessionLoginUser.lastLoginTime}">
，最后的登录时间是
<b>${sessionScope.sessionLoginUser.lastLoginTime }</b>
</c:if>
。
<table border="0" class="detail">
	<tr>
		<td class="title">登录时间</td>
		<td class="title">IP</td>
		<td class="title">参考地点</td>
	</tr>
	<c:forEach items="${sysLoginLogs }" var="sysLoginLogVar">
		<tr>
			<td>${sysLoginLogVar.login_time}</td>
			<td style="padding-left:8px;padding-right:8px;">
				<c:forTokens items="${sysLoginLogVar.client_ip}" delims="." var="ipStr" varStatus="status">
					<c:if test="${!status.first }">.</c:if>
					<c:if test="${status.count>=3}">***</c:if>
					<c:if test="${status.count<3}">${ipStr }</c:if>
				</c:forTokens>
			</td>
			<td>${sysLoginLogVar.client_addr}</td> 
		</tr>
	</c:forEach>
</table>
</div>