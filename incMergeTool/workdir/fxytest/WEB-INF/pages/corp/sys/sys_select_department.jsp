<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<div class="zTreeDemoBackground left" style="border:1px solid #EEEEEE;width:100%;height:100%;overflow: auto;">
<ul id="departmentTree" class="ztree"></ul>

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
		 {id:'R', pId:'0', name:"<fmt:message key="webapp.company.title"/>",click:"selectRoot()",open:true,nocheck:true},
		<c:forEach items="${treeMap}" var="treeRow">
			{ id:'C${treeRow.key.companyId}', pId:'R', name:"${treeRow.key.companyName}",open:false,nocheck:true},
		   	<c:forEach items="${treeRow.value}" var="deptRow">
		   		<c:if test="${deptRow.parentId==0}">
		   			{ id:'D${deptRow.departmentId}', pId:'C${treeRow.key.companyId}', name:"${deptRow.departmentName}",click:"_selectDepartment('${treeRow.key.companyCode}','${deptRow.departmentId}','${deptRow.departmentName}')",open:false,nocheck:true},
		   			//{ id:'D${deptRow.departmentId}', pId:'C${treeRow.key.companyId}', name:"${deptRow.departmentName}",open:false,nocheck:true},
		   		</c:if> 
		   		<c:if test="${deptRow.parentId!=0}">
		   			{ id:'D${deptRow.departmentId}', pId:'D${deptRow.parentId}', name:"${deptRow.departmentName}",click:"_selectDepartment('${treeRow.key.companyCode}','${deptRow.departmentId}','${deptRow.departmentName}')",open:false,nocheck:true},
		   			//{ id:'D${deptRow.departmentId}', pId:'D${deptRow.parentId}', name:"${deptRow.departmentName}",open:false,nocheck:true},
		   		</c:if> 
		   	</c:forEach>
		</c:forEach>
	];

function reloadTree() {
	$.fn.zTree.init($("#departmentTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});


</script>

<script type="text/javascript">
function _selectDepartment(companyCode, departmentId, departmentName){
    $("#spnCompanyCode").html(companyCode);
    $("#companyCode").val(companyCode);
    $("#spnDepartmentName").html(departmentName);
    $("#departmentId").val(departmentId);
	$.fn.colorbox.close();
}
</script>