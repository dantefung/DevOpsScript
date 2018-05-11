<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.basicDataManage.countryManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.basicDataManage.countryManage"/>"/>
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

	{ id:'A', pId:'0', name:"<fmt:message key='alCountry.allType'/>",  open:true, target:"frmAlRegionList"}
	 
	<c:if test="${not empty alRegions}">
		<c:forEach items="${alRegions}" var="row">
			<c:set var="parentRegionId" value="${row.parentRegionId}"/>
			<c:if test="${row.parentRegionId==0}">
				<c:set var="parentRegionId" value="A"/>
			</c:if>
			 
			,{id:'${row.regionId}', pId:'${parentRegionId}', name:"<fmt:message key="${row.regionName}"/>", icon:"${menuIcon}", url:"${ctx}/corp/alRegions.jhtml?strAction=editAlRegion&parentRegionId=${row.regionId}", target:"frmAlRegionList"}
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