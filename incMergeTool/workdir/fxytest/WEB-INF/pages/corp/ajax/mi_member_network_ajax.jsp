<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
[
<c:if test="${not empty miMembers}">
	<c:set var="loopCount" value="0"/>
	<c:forEach items="${miMembers}" var="miMemberVar">
		<c:if test="${loopCount>0}">,</c:if>
		<c:set var="starColor" value="gray"/>
		<c:set var="starColor_member" value="gray"/>
		<c:if test="${not empty star}">
			<c:set var="starColor" value="red"/>
			<c:set var="starColor_member" value="blue"/>
		</c:if>
		{id:'${miMemberVar.member_no}', name:"<font color='${starColor_member }'>${miMemberVar.member_no} - ${miMemberVar.pet_name}</font>
		<c:if test='${not empty miMemberVar.star}'><font color='${starColor }'>[<win:code listCode="stars_level" value="${miMemberVar.star}"/>]</font></c:if>
		<c:if test="${miMemberVar.suspend_status==1}">[<win:code listCode="sysuser.suspendstatus" value="${miMemberVar.suspend_status}"/>]</c:if>
		<c:if test="${miMemberVar.exit_status==1}">[<win:code listCode="mimember.exitstatus" value="${miMemberVar.exit_status}"/>]</c:if>
	    <font color=#FF0000>${level}</font>
		<c:if test="${not empty miMemberVar.active_time}">[<fmt:message key="mimember.activetime"/>:${miMemberVar.active_time }]</c:if>"
		<c:if test="${miMemberVar.child_count>0}">, isParent:true</c:if>}
		<c:set var="loopCount" value="${loopCount+1}"/>
	</c:forEach>
</c:if>
]