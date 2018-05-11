<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.organizePeopleManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.organizePeopleManage"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<div class="zTreeDemoBackground left">
<ul id="myManTree" class="ztree"></ul>
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
		{ id:'R', pId:'0', name:"<fmt:message key="menu.organizePeopleManage"/>",click:"selectRoot()",open:true,nocheck:true},
       	<c:forEach items="${treeMap}" var="treeRow">
       		<c:if test="${loopCount>0}">,</c:if>
       		{ id:'C${treeRow.key.companyId}', pId:'R', name:"${treeRow.key.companyName}",click:"selectCompany('${treeRow.key.companyCode}')",open:false,nocheck:true}
	       	<c:forEach items="${treeRow.value}" var="deptRow">
	       		<c:if test="${deptRow.parentId==0}">
	       			,{ id:'D${deptRow.departmentId}', pId:'C${treeRow.key.companyId}', name:"${deptRow.departmentName}",click:"selectDepartment('${treeRow.key.companyCode}','${deptRow.departmentId}')",open:false,nocheck:true}
	       		</c:if> 
	       		<c:if test="${deptRow.parentId!=0}">
	       			,{ id:'D${deptRow.departmentId}', pId:'D${deptRow.parentId}', name:"${deptRow.departmentName}",click:"selectDepartment('${treeRow.key.companyCode}','${deptRow.departmentId}')",open:false,nocheck:true}
	       		</c:if> 
	       	</c:forEach>
	       	<c:set var="loopCount" value="${loopCount+1}"/>
       	</c:forEach>
       	];

function reloadTree() {
	$.fn.zTree.init($("#myManTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});

</script>

<script type="text/javascript">
function selectRoot(){
	window.parent.frmDepartmentList.location="<c:url value="/corp/alCompanys.jhtml"/>";
	window.parent.frmManagerList.location="<c:url value="/corp/sysManagerOrg.jhtml"/>?departmentId=0";
}

function selectCompany(companyCode){
	window.parent.frmDepartmentList.location="<c:url value="/corp/sysDepartments.jhtml"/>?companyCode="+companyCode+"&parentId=0";
	window.parent.frmManagerList.location="<c:url value="/corp/sysManagerOrg.jhtml"/>?departmentId=0";
}

function selectDepartment(companyCode, departmentId){
	window.parent.frmDepartmentList.location="<c:url value="/corp/sysDepartments.jhtml"/>?companyCode="+companyCode+"&parentId="+departmentId;
	window.parent.frmManagerList.location="<c:url value="/corp/sysManagerOrg.jhtml"/>?companyCode="+companyCode+"&departmentId="+departmentId;
}
</script>