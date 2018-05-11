<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="商品分类管理"/></title>
    <meta name="heading" content="<fmt:message key="商品分类管理"/>"/>
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

	{ id:'A', pId:'0', name:"所有分类",  open:true, url:"${ctx}/corp/pmProductTypes.jhtml?strAction=listPmProductTypes", target:"frmPmProductTypeList"}
	 
	<c:if test="${not empty pmProductTypes}">
		<c:forEach items="${pmProductTypes}" var="row">
			<c:set var="parentTypeId" value="${row.parentTypeId}"/>
			<c:if test="${row.parentTypeId==0}">
				<c:set var="parentTypeId" value="A"/>
			</c:if>
			 
			,{id:'${row.typeId}', pId:'${parentTypeId}', name:"<fmt:message key="${row.typeName}"/>", icon:"${menuIcon}", url:"${ctx}/corp/pmProductTypes.jhtml?strAction=listPmProductTypes&parentTypeId=${row.typeId}", target:"frmPmProductTypeList"}
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