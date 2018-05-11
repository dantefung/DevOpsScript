<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>


<div class="zTreeDemoBackground left" style="height:100%;overflow: auto;">
<ul id="myModMTree" class="ztree"></ul>
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
       	<c:forEach items="${sysModules}" var="row">
       		<c:if test="${loopCount>0}">,</c:if>
       		{ id:'${row.module_id}', pId:'${row.parent_id}', name:"<fmt:message key="${row.module_name}"/>",open:false,nocheck:true,click:"onNodeSelect('${companyCode}',${row.module_id})"}
       		<c:set var="loopCount" value="${loopCount+1}"/>
       	</c:forEach>
       	];

function reloadTree() {
	$.fn.zTree.init($("#myModMTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});
function onNodeSelect(companyCode,moduleId){
	window.parent.frmManMTree.location="/corp/sysMyManMTree.jhtml?companyCode="+companyCode+"&moduleId="+moduleId;
}
function valideSelectNode(){
	var treeObj = $.fn.zTree.getZTreeObj("myModMTree");
	var nodes = treeObj.getSelectedNodes();
	if(!nodes || nodes=="" || nodes==null || nodes.id=="" || nodes.id==0 ){
		return null;
	}else{
		var nodeId = null;
		for(var i=0; i<nodes.length; i++){
			nodeId = nodes[i].id;
		}
		return nodeId;
	}
	
}
</script>