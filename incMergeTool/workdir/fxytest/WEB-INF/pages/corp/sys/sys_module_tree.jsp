<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="sysmodles.all.modle"/></title>
    <meta name="heading" content="<fmt:message key="sysmodles.all.modle"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>

<script language="JavaScript">
var zTree1;
var showLoading=false;

var setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
	};

var simpleNodes =[
	<c:set var="loopCount" value="0"/>
	<c:forEach items="${userTypes}" var="userTypeRow">
	<c:if test="${loopCount>0}">,</c:if>
	{ id:'${userTypeRow.key}', pId:'0', name:"<fmt:message key='sysmodles.all.modle'/>(<fmt:message key="${userTypeRow.value}"/>)",icon:"${ctx}/themes/${theme}/images/icons/global.gif", open:true, url:"${ctx}/corp/sysModules.jhtml?userType=${userTypeRow.key}&parentId=0", target:"frmSysModuleList"}
	<c:set var="loopCount" value="${loopCount+1}"/>
	</c:forEach>
	<c:if test="${not empty sysModules}">
		<c:forEach items="${sysModules}" var="row">
			<c:set var="parentId" value="${row.parentId}"/>
			<c:if test="${row.parentId==0}">
				<c:set var="parentId" value="${row.userType}"/>
			</c:if>
			<c:set var="menuIcon" value="${ctx}/themes/${theme}/images/icons/folderClosedMenu.gif"/>
			<c:if test="${row.moduleType==0}">
				<c:set var="menuIcon" value="${ctx}/themes/${theme}/images/icons/folderClosedModule.gif"/>
			</c:if>
			,{id:'${row.moduleId}', pId:'${parentId}', name:"<fmt:message key="${row.moduleName}"/>", icon:"${menuIcon}", url:"${ctx}/corp/sysModules.jhtml?parentId=${row.moduleId}&userType=${row.userType}", target:"frmSysModuleList"}
		</c:forEach>
	</c:if>
	];

function reloadTree() {
	$.fn.zTree.init($("#menuTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});
</script>

<div class="zTreeDemoBackground left">
	<ul id="menuTree" class="ztree"></ul>
</div>