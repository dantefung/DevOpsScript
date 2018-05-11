<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="报单中心管理" /></title>
	<meta name="heading" content="<fmt:message key="报单中心管理"/>" />
</head>

<style>
<!--
ul.alRegionUl{
	list-style: none;
	margin: 0px;
	padding: 0px;
}

ul.alRegionUl li{
	padding: 6px;
	border-bottom: 1px solid #eeeeee;
}
-->
</style>

<div class="contentBody">
	<table width="100%">
		<tr>
			<td><strong>${provinceAlRegion.regionName}</strong></td>
			<td align="right">（*）代表已有报单中心</td>
		</tr>
		<tr>
			<td valign="top" width="80" nowrap="nowrap">
				<ul class="alRegionUl">
					<c:forEach items="${mainAlRegions }" var="mainAlRegionVar">
						<a href="viewMiAgentsInTable.jhtml?pyName=${param.pyName }&parentRegionId=${mainAlRegionVar.region_id}">
							<li>
								<c:if test="${param.parentRegionId==mainAlRegionVar.region_id }"><strong></c:if>
								${mainAlRegionVar.region_name }
								<c:if test="${mainAlRegionVar.agent_count>0 }">（*）</c:if>
								<c:if test="${param.parentRegionId==mainAlRegionVar.region_id }"></strong></c:if>
							</li>
						</a>
					</c:forEach>
				</ul>
			</td>
			<td valign="top" style="border-left: 1px solid #eee;">
				<ul class="alRegionUl">
					<c:forEach items="${childAlRegions }" var="childAlRegionVar">
						<li>
							${childAlRegionVar.region_name }
							<c:if test="${childAlRegionVar.agent_count>0 }">（*）</c:if>
						</li>
					</c:forEach>
				</ul>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">

</script>