<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<head>
    <title><fmt:message key="title.select.parent.module"/></title>
    <meta name="heading" content="<fmt:message key="title.select.parent.module"/>"/>
</head>
<script language="JavaScript">
var zTree1;
var showLoading=false;

var setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: zTreeOnClick
		}
	};

function zTreeOnClick(event, treeId, treeNode) {
    $("#spnParentModuleName").html(treeNode.name);
    $("#parentId").val(treeNode.id);
    $.fn.colorbox.close();
};

var simpleNodes =[
	<c:set var="loopCount" value="0"/>
	<c:forEach items="${userTypes}" var="userTypeRow">
	<c:if test="${loopCount>0}">,</c:if>
	{ id:'${userTypeRow.key}', pId:'0', name:"<fmt:message key="sysmodles.all.modle"/>(<fmt:message key="${userTypeRow.value}"/>)",icon:"${ctx}/themes/${theme}/images/icons/global.gif", open:true}
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
			,{id:'${row.moduleId}', pId:'${parentId}', name:"<fmt:message key="${row.moduleName}"/>", icon:"${menuIcon}"}
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