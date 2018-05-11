<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="sysmodles.all.modle"/></title>
    <meta name="heading" content="<fmt:message key="sysmodles.all.modle"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<div class="zTreeDemoBackground left">
	<ul id="_treebox" class="ztree"></ul>
</div>

<script type="text/javascript">
var zTreeRolePower;

var settingRolePower = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

function _reloadTree() {
	$.fn.zTree.init($("#_treebox"), settingRolePower, simpleNodesRolePower);
	zTreeRolePower=$.fn.zTree.getZTreeObj("_treebox");
}
var simpleNodesRolePower =[
<c:if test="${not empty sysModules}">
	<c:forEach items="${sysModules}" var="sysModuleVar">
		{id:'${sysModuleVar.module_id}', pId:'${sysModuleVar.parent_id}', name:"<fmt:message key="${sysModuleVar.module_name}"/>" <c:if test="${not empty sysModuleVar.rp_id}">, checked : true</c:if>},
	</c:forEach>
</c:if>
      		 ];

$(document).ready( function() {
	_reloadTree();
});
</script>