<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="lang.orderCenter.enquery" /></title>
	<meta name="heading" content="<fmt:message key="lang.orderCenter.enquery"/>" />
</head>

<style type="text/css">
/* 效果CSS开始 */
.wrap .syntaxhighlighter{padding-top:10px!important; padding-bottom:10px!important;}
.wrap{ width:900px; margin:0 auto; background:url(bg.png); border-left:1px solid #DDD; border-right:1px solid #DDD; padding:15px; box-shadow:0 2px 6px rgba(0,0,0,0.3)}
.stateTip, #StateTip{display:none; position:absolute; padding:8px; background:#fff; border:2px solid #2385B1; -moz-border-radius: 4px; -webkit-border-radius: 4px; border-radius: 4px; font-size:12px; font-family:Tahoma; color:#333;}

.mapInfo i{ display:inline-block; width:15px; height:15px; margin-top:5px; line-height:15px; font-style:normal; background:#aeaeae; color:#fff; font-size:11px; font-family: Tahoma; -webkit-border-radius:15px; border-radius:15px; text-align:center}
.mapInfo i.active{background:#E27F21;}
.mapInfo span{ padding:0 5px 0 3px;}
.mapInfo b{ font-weight:normal; color:#2770B5}
/* 效果CSS结束 */
</style>

<script type="text/javascript" src="${ctx }/scripts/map/raphael-min.js"></script>
<script type="text/javascript" src="${ctx }/scripts/map/chinaMapConfig.js"></script>
<script type="text/javascript" src="${ctx }/scripts/map/map.js"></script>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<ul class="nav nav-tabs">
	<win:power powerCode="memberAgentView">
		<li role="presentation" class="active">
			<a href="viewMiAgentsInMap.jhtml"><fmt:message key="lang.orderCenter.enquery" /></a>
		</li>
	</win:power>
	<win:power powerCode="memberMiAgents">
		<li role="presentation">
			<a href="miAgents.jhtml"><fmt:message key="lang.my.application" /></a>
		</li>
	</win:power>
</ul>

<br/>

<win:power powerCode="memberAddMiAgent">
	<h5><fmt:message key="miAgentsViewInMap.msg.A1" /></h5>
</win:power>

<div class="contentBody">
	<div id="ChinaMap1"></div>
</div>

<script type="text/javascript">
$(function(){
	$('#ChinaMap1').SVGMap({
		mapName: 'china',
		mapWidth: 600,
		mapHeight: 500,
		clickCallback: function(stateData, obj){
			showMiAgentsInTable(obj.id);
	    },
		stateData: {
            'macau': {'diabled': true},
            'taiwan': {'diabled': true},
            'hongkong': {'diabled': true}
            <c:forEach items="${alRegions}" var="alRegionVar" varStatus="varStatus">
	        	<c:if test="${alRegionVar.agent_count>0 }">
	        		,'${alRegionVar.py_name }': {'stateInitColor': 3}
	        	</c:if>
	        </c:forEach>
	        <c:forEach items="${alRegions}" var="alRegionVar" varStatus="varStatus">
	        	<c:if test="${alRegionVar.wait_agent_count>0 }">
	        		,'${alRegionVar.py_name }': {'stateInitColor': 2}
	        	</c:if>
	        </c:forEach>
    	}
	});
});

function showMiAgentsInTable(pyName){
	$.colorbox({innerWidth: 600, innerHeight: 400,iframe:true, href:"viewMiAgentsInTable.jhtml?pyName="+pyName});
}
</script>