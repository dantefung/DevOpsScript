<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="报单中心查询" /></title>
	<meta name="heading" content="<fmt:message key="报单中心查询"/>" />
</head>

<style>
body {
	background-image: none;
	background-color: #fff;
}
ul.alRegionUl{
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.cityLink{
	/* display: block; */
	padding: 4px;
	outline: none;
}

.districtLink{
	padding: 4px;
}

hr{
	margin: 6px 0px;
}
</style>

<div class="container-fluid">
	<strong>${provinceAlRegion.regionName}</strong>
	<c:choose>
		<c:when test="${newCount>0 }"><span class="label label-default">*</span></c:when>
		<c:when test="${existCount>0 }"><span class="label label-primary">*</span></c:when>
		<c:otherwise>
			<a href="editMiAgent.jhtml?regionCode=${provinceAlRegion.regionCode }" class="btn btn-success btn-xs" target="_blank">申请</a>
		</c:otherwise>
	</c:choose>

	<br/>
	<div class="row">
		<div class="col-xs-6"><span class="label label-primary">*</span>：此区域已有报单中心<br/></div>
		<div class="col-xs-6"><span class="label label-info">n</span>：此区域n个下属区域已有报单中心</div>
		<div class="col-xs-6"><span class="label label-default">*</span>：此区域已被申请</div>
	</div>
	<hr/>

	<c:forEach items="${mainAlRegions }" var="mainAlRegionVar" varStatus="varStatus">
		<c:if test="${varStatus.index%3==0 }">
			<fmt:parseNumber var="tmpResult" integerOnly="true" value="${varStatus.index/3}"/>
			<c:set var="theDivId">cityDiv${tmpResult}</c:set>
			<div class="row" id="${theDivId }">
		</c:if>
			<div class="col-xs-4 cityLink">
				<a onfocus="this.blur();" href="javascript:viewChildMiAgents('${theDivId}','${mainAlRegionVar.region_id}',${varStatus.index%3});">
					${mainAlRegionVar.region_name }
				</a>
				<c:if test="${mainAlRegionVar.agent_count>0 }"><span class="label label-primary">*</span></c:if>
				<c:if test="${mainAlRegionVar.wait_agent_count>0 }"><span class="label label-default">*</span></c:if>
				<c:if test="${mainAlRegionVar.child_agent_count>0 }"><span class="label label-info">${mainAlRegionVar.child_agent_count}</span></c:if>
			</div>
		<c:if test="${(varStatus.index+1)%3==0 || ((varStatus.index+1)%3!=0 && varStatus.last)}">
			</div>
		</c:if>
	</c:forEach>

	<div id="testId"></div>
	<div class="popover bottom" id="childTipsDiv" style="position: relative;width: 100%; max-width: none;display: none;margin-bottom: 15px;z-index:100;">
		<div class="arrow" style="left: 50%;"></div>
		<h3 class="popover-title" style="display: none;"></h3>
		<div class="popover-content"></div>
	</div>

</div>
<script type="text/javascript">
function viewChildMiAgents(divId, parentRegionId, showCount){
	showLoading();
	$.getJSON("viewMiAgentsInTable.jhtml", {doType:"ajax",parentRegionId:parentRegionId}, function(json){
		var childRegionStr="";
		if(json!=null && json.length>0){
			childRegionStr+="<div class='row'>";
			for(var i=0;i<json.length;i++){
				childRegionStr+="<div class='col-xs-4 districtLink'>";
				childRegionStr+=json[i][0];
				if(json[i][1]>0){
					childRegionStr+="<span class=\"label label-primary\">*</span>";
				}
				if(json[i][2]>0){
					childRegionStr+="<span class=\"label label-default\">*</span>";
				}
				<win:power powerCode="memberAddMiAgent">
				if((json[i][1]+json[i][2])==0 && json[i][0].indexOf("辖")<0){
					childRegionStr+=" <a class=\"text-success\" href=\"editMiAgent.jhtml?strAction=memberAddMiAgent&regionCode="+json[i][3]+"\" target=\"_blank\">[申请]</a>";
				}
				</win:power>
				childRegionStr+="</div>";
			}
			childRegionStr+="</div>";
		}
		$(".popover-content").html(childRegionStr);
		var targetObj=$("#childTipsDiv");
		targetObj.css("display","block");
		$(".arrow").css("left",(showCount*35+5)+"%");
		$("#"+divId).after(targetObj.get(0));
		hideLoading();
	});
}
</script>