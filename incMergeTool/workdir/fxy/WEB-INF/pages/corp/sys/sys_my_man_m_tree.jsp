<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>


<div class="zTreeDemoBackground left" style="height:100%;overflow: auto;">
<ul id="myManMTree" class="ztree"></ul>
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
       	<c:forEach items="${alCompanys}" var="alCompanyVar">
       		<c:if test="${loopCount>0}">,</c:if>
       		{ id:'C#${alCompanyVar.companyCode}', pId:'0', name:"${alCompanyVar.companyName}",open:false,nocheck:true}
       		<c:set var="loopCount" value="${loopCount+1}"/>
       	</c:forEach>
       	
       	<c:forEach items="${sysDepartments}" var="sysDepartmentVar">
       		<c:if test="${sysDepartmentVar.parentId==0}">
       			,{ id:'D#${sysDepartmentVar.departmentId}', pId:'C#${sysDepartmentVar.companyCode}', name:"${sysDepartmentVar.departmentName}",open:false,nocheck:true}
       		</c:if> 
       		<c:if test="${sysDepartmentVar.parentId!=0}">
       			,{ id:'D#${sysDepartmentVar.departmentId}', pId:'D#${sysDepartmentVar.parentId}', name:"${sysDepartmentVar.departmentName}",open:false,nocheck:true}
       		</c:if> 
       	</c:forEach>
       	
       	<c:forEach items="${sysManagers}" var="managerRow" varStatus="managerRowStatus">
      		,{ id:'M#${managerRow.user_code}', pId:'D#${managerRow.department_id}', name:"${managerRow.user_name}(${managerRow.user_code})",icon:"${ctx}/themes/${theme}/images/icons/user.gif",nocheck:false   <c:if test="${not empty managerRow.power_id}">,checked : true </c:if>}
       	</c:forEach>
       	];

function reloadTree() {
	$.fn.zTree.init($("#myManMTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});

function getChecks(){
	var treeObj = $.fn.zTree.getZTreeObj("myManMTree");
	return getCheckedNodesValueFromTree(treeObj);
}
</script>