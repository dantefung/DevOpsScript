<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.miblacklist.view"/></title>
    <meta name="heading" content="<fmt:message key="mi.miblacklist.view"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
    <form:form commandName="miBlacklist" method="post" action="editMiStateAdjust.jhtml" onsubmit="return validateForm(this)" id="miStateAdjustForm">
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="labe.application.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miBlacklist.member_no }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.memberName"/>:</th>
    		<td>${miBlacklist.last_name }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
    		<td>${miBlacklist.id_no }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="memberblacklist_apply_status" value="${miBlacklist.status }"></win:code></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.createUser"/>:</th>
    		<td>${miBlacklist.creator_code }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.createTime"/>:</th>
    		<td>${miBlacklist.create_time }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>${miBlacklist.remark }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.cancle.remark"/>:</th>
    		<td>${miBlacklist.cancle_remark }</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApalyCheck.relevance.file"/>:</th>
    		<td colspan="2">
    			<c:forEach items="${miBlacklistFiles }" var="miBlacklistFileVar">
    				<img src="${ctx}/themes/${theme }/images/attach/${miBlacklistFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${miBlacklistFileVar.fileUrl}"/>">${miBlacklistFileVar.fileName }</a>
					<br/>
    			</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.examine.info"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pmProductSppm.checkUser"/>:</th>
    		<td>${miBlacklist.checker_code }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icAnnounce.checkTime"/>:</th>
    		<td>${miBlacklist.check_time }</td>
    	</tr>
    </table>
    
    </form:form>
</div>