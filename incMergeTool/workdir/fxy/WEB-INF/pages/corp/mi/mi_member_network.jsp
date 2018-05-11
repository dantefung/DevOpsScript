<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<c:if test="${param.strAction=='miMemberRecommend' }">
	<c:set var="pageTitle"><fmt:message key='im.network.title'/></c:set>
</c:if>
<c:if test="${param.strAction=='miMemberLink' }">
	<c:set var="pageTitle"><fmt:message key='im.contact.network.title'/></c:set>
</c:if>
<head>
    <title>${pageTitle }</title>
    <meta name="heading" content="${pageTitle }"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>

<style>
.cardType{
	color: #ff0000;
}

.cardType0{
	color: #333;
}
</style>

<div class="searchBar">
	<form method="get" action="miMemberNetwork.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="lang.network.type"/></dt>
			<dd>
				<win:list name="networkType" listCode="network_type" defaultValue="normal" value="${param.networkType }"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.layerId"/></dt>
			<dd><input id="layerId" name="layerId" size="14" type="text" value="${param.layerId }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<button type="button" class="button" name="search"  onclick="expandAll();" value="" ><fmt:message key="button.expandAll"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">

	<div><fmt:message key="mimember.total"/>:${empty miMemberCount?0:miMemberCount }</div>
	<div class="zTreeDemoBackground left">
		<ul id="memberTree" class="ztree"></ul>
	</div>

</div>
<script type="text/javascript">
function validateSearch(theForm) {
	if(theForm.memberNo.value==""){
		alert("<fmt:message key='im.memberNo.see.null.requie'/>.");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.layerId.value != ""){
		if(theForm.layerId.value > 50){
			alert("<fmt:message key='miMember.layerId.indexof'/>");
			return false;
		}
	}
	<c:if test="${param.strAction=='miMemberLink' }">
		if(theForm.plateModel.value == ""){
			alert("<fmt:message key='palte.model.not.null.please.choose'/>");
			return false;
		}
	</c:if>
	showLoading();
	return true;
}
</script>

<SCRIPT type="text/javascript">
var setting = {
		view : {
			expandSpeed : "",
			nameIsHTML: true,
			showIcon: false,
			showTitle: false,
			txtSelectedEnable : true
		},
		data: {
			simpleData: {
				enable: true
			}

		}
	};
	
var simpleNodes =[
	<c:if test="${not empty miMembers}">
		<c:set var="loopCount" value="0"/>
		<c:forEach items="${miMembers}" var="miMemberVar">
			<c:if test="${loopCount>0}">,</c:if>
			//判断是推荐网络图还是报单中心网络图
			<c:if test="${param.networkType=='agent' }">
				<c:if test="${param.strAction=='miMemberRecommend' }">
					<c:set var="pid" value="${miMemberVar.agent_recommend_no}"/>
				</c:if>
				<c:if test="${param.strAction=='miMemberLink' }">
					<c:set var="pid" value="${miMemberVar.agent_link_no}"/>
				</c:if>
			</c:if>
			<c:if test="${param.networkType!='agent' }">
				<c:if test="${param.strAction=='miMemberRecommend' }">
					<c:set var="pid" value="${miMemberVar.recommend_no}"/>
				</c:if>
				<c:if test="${param.strAction=='miMemberLink' }">
					<c:set var="pid" value="${miMemberVar.link_no}"/>
				</c:if>
			</c:if>
			<c:set var="color_member" value="black"/>
			<c:if test="${miMemberVar.active_status == 0}">
				<c:set var="color_member" value="gray"/>
			</c:if>
			{id:"${miMemberVar.member_no}",pId:"${pid}", name:"<font color='${color_member }'>${miMemberVar.member_no} - ${miMemberVar.last_name}</font>"
				+"<c:if test="${sessionScope.sessionLoginUser.companyCode!=miMemberVar.company_code}"> [${miMemberVar.company_code}] </c:if>"
				+" [<font color='red'>${miMemberVar.level}</font>]"
				<c:if test="${param.strAction=='miMemberLink' }">
				+" [<font color='red'><win:code listCode="tree_left_right" value="${miMemberVar.leaf_type}"/></font>]"
				</c:if>
				/* <c:if test="${param.layerId > 0}"> 
					//安置网络图
					<c:if test="${param.strAction=='miMemberLink'}">
						+" [<font color='red'>${miMemberVar.level_-1}</font>]"
					</c:if>
					//推荐网络图
					<c:if test="${param.strAction=='miMemberRecommend' }">
						+" [<font color='red'>${miMemberVar.level}</font>]"
					</c:if>
				</c:if>
				<c:if test="${empty param.layerId || param.layerId == 0}">
					+" [<font color='red'>${miMemberVar.level}</font>]"
				</c:if> */
				+"<c:if test="${miMemberVar.active_status == 1}">"
					+"[<font class='cardType cardType${miMemberVar.card_type}'><win:code listCode="member.card.type" value="${miMemberVar.card_type}"/>"
					+"</font>]"
					+"<c:if test="${miMemberVar.freeze_status==1}">[<font color='red'><win:code listCode="sysuser.freezestatus" value="${miMemberVar.freeze_status}"/></font>]</c:if>"
					+"<c:if test="${miMemberVar.suspend_status==1}">[<font color='red'><win:code listCode="sysuser.suspendstatus" value="${miMemberVar.suspend_status}"/></font>]</c:if>"
					+"<c:if test="${miMemberVar.exit_status==1}">[<font color='red'><win:code listCode="mimember.exitstatus" value="${miMemberVar.exit_status}"/></font>]</c:if>"
				+"[<fmt:message key="mimember.activetime"/>:${miMemberVar.active_time }"
				+"]</c:if>"
				+"<c:if test="${miMemberVar.active_status == 0}">[<font color='gray'><fmt:message key="label.auto.ship.status.inactive"/></font>]</c:if>"
			}
			<c:set var="loopCount" value="${loopCount+1}"/>
		</c:forEach>
	</c:if>
	];

function reloadTree() {
	$.fn.zTree.init($("#memberTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});

function expandAll(){
	var zTree = $.fn.zTree.getZTreeObj("memberTree");
	zTree.expandAll(true);
}
</SCRIPT>
