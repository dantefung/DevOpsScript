<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<div class="zTreeDemoBackground left" style="height:100%;overflow: auto;">
<ul id="mymodTree" class="ztree"></ul>
</div>

<script type="text/javascript">
var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

var simpleNodes =[
		<c:set var="loopCount" value="0"/>
       	<c:forEach items="${sysModules}" var="sysModuleVar">
       		<c:if test="${loopCount>0}">,</c:if>
       		<c:if test="${sysModuleVar.module_type==1}">
       			{ id:'${sysModuleVar.module_id}', pId:'${sysModuleVar.parent_id}', name:"<fmt:message key="${sysModuleVar.module_name}"/>",open:false,nocheck:false <c:if test="${not empty sysModuleVar.slave_power_id}">,checked : true </c:if>}
       		</c:if> 
       		<c:if test="${sysModuleVar.module_type==0}">
       			{ id:'${sysModuleVar.module_id}', pId:'${sysModuleVar.parent_id}', name:"<fmt:message key="${sysModuleVar.module_name}"/>",open:false,nocheck:false <c:if test="${not empty sysModuleVar.slave_power_id}">,checked : true </c:if>}
       		</c:if> 
       		<c:set var="loopCount" value="${loopCount+1}"/>
       	</c:forEach>
       	];

function reloadTree() {
	$.fn.zTree.init($("#mymodTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});

function getChecks(){
	var treeObj = $.fn.zTree.getZTreeObj("mymodTree");
	return getCheckedNodesValueFromTree(treeObj);
}
function expandAll(expandFlag){
	var treeObj = $.fn.zTree.getZTreeObj("mymodTree");
	treeObj.expandAll(expandFlag);
} 
</script>