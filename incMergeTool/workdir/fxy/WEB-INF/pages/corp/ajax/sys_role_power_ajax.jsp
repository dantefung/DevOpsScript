<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
[
<c:if test="${not empty sysModules}">
	<c:set var="loopCount" value="0"/>
	<c:forEach items="${sysModules}" var="sysModuleVar">
		<c:if test="${loopCount>0}">,</c:if>
		{id:'${sysModuleVar.module_id}', pId:'${sysModuleVar.parent_id}', name:"<fmt:message key="${sysModuleVar.module_name}"/>" <c:if test="${not empty sysModuleVar.rp_id}">, checked : true</c:if>}
		<c:set var="loopCount" value="${loopCount+1}"/>
	</c:forEach>
</c:if>
]