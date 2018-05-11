<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.link.map"/></title>
    <meta name="heading" content="<fmt:message key="mi.link.map"/>"/>
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
	<form method="get" action="miMemberUplink.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="mi.lable.structure.type"/></dt>
			<dd><win:list name="uplinkType" listCode="uplink_type" value="${param.uplinkType }" defaultValue="recommend" /></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="function.menu.view"/></button>
				<button type="button" class="button" name="search"  onclick="expandAll();" value="" ><fmt:message key="button.expandAll"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
				<input type="hidden" name="uplinkType" value="recommend"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
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
	showLoading();
	return true;
}
</script>

<c:if test="${not empty upLinkTree}">
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
		<c:set var="loopCount" value="0"/>
		<c:forEach items="${upLinkTree}" var="row">
			<c:if test="${loopCount>0}">,</c:if>
			<c:if test="${param.networkType=='agent' }">
				<c:if test="${param.uplinkType=='recommend' }">
					<c:set var="pid" value="${row.value.miMember.agentRecommendNo}"/>
				</c:if>
				<c:if test="${param.uplinkType=='link' }">
					<c:set var="pid" value="${row.value.miMember.agentLinkNo}"/>
				</c:if>
			</c:if>
			<c:if test="${param.networkType!='agent' }">
				<c:if test="${param.uplinkType=='recommend' }">
					<c:set var="pid" value="${row.value.miMember.recommendNo}"/>
				</c:if>
				<c:if test="${param.uplinkType=='link' }">
					<c:set var="pid" value="${row.value.miMember.linkNo}"/>
				</c:if>
			</c:if>
			<c:if test="${row.value.miMember.activeStatus == 1}">
				<c:set var="color_member" value="black"/>
				<c:if test="${miMemberVar.active_status == 0}">
					<c:set var="color_member" value="gray"/>
				</c:if>
				{id:'${row.key}',pId:'${pid}', name:"<font color='${color_member }'>${row.key} - ${row.value.miMember.lastName}</font>"
					+"<c:if test="${sessionScope.sessionLoginUser.companyCode!=row.value.miMember.companyCode}"> [${row.value.miMember.companyCode}] </c:if>"
					+"[<font class='cardType cardType${row.value.miMember.cardType}'><win:code listCode="member.card.type" value="${row.value.miMember.cardType}"/>"
					+",<win:code listCode="stars_level" value="${row.value.miMember.star}"/>"
					+"</font>]"
					+"<c:if test="${row.value.sysUser.freezeStatus==1}">[<font color='red'><win:code listCode="sysuser.freezestatus" value="${row.value.sysUser.freezeStatus}"/></font>]</c:if>"
					/* +"<c:if test="${row.value.sysUser.freezeMenuAccounts==1 || row.value.sysUser.freezeMenuBonus==1 || row.value.sysUser.freezeMenuInfo==1 }"><font color='red'><win:code listCode="sysuser.freezestatus" value="1"/></font>"
						+"[<c:if test="${row.value.sysUser.freezeMenuAccounts==1}"><font color='red'></c:if><c:if test="${row.value.sysUser.freezeMenuAccounts==0}"><font color='green'></c:if><fmt:message key="mi.freeze.accounts"/></font>"
						+"&nbsp;<c:if test="${row.value.sysUser.freezeMenuBonus==1}"><font color='red'></c:if><c:if test="${row.value.sysUser.freezeMenuBonus==0}"><font color='green'></c:if><fmt:message key="mi.freeze.bonus"/></font>"
						+"&nbsp;<c:if test="${row.value.sysUser.freezeMenuInfo==1}"><font color='red'></c:if><c:if test="${row.value.sysUser.freezeMenuInfo==0}"><font color='green'></c:if><fmt:message key="mi.userupdate"/></font>]"
					+"</c:if>" */
					+"<c:if test="${row.value.sysUser.suspendStatus==1}">[<font color='red'><win:code listCode="sysuser.suspendstatus" value="${row.value.sysUser.suspendStatus}"/></font>]</c:if>"
					+"<c:if test="${row.value.miMember.exitStatus==1}">[<font color='red'><win:code listCode="mimember.exitstatus" value="${row.value.miMember.exitStatus}"/></font>]</c:if>"
				    +"<font color='red'>${allSize-row.value.other.level+1}</font>"
					+"<c:if test="${not empty row.value.other.activeTime}">[<fmt:message key="mimember.activetime"/>:${row.value.other.activeTime }]</c:if>"
				}
			</c:if>
			<c:if test="${row.value.miMember.activeStatus != 1}">
				{id:'${row.key}',pId:'${pid}', name:"<font color='black'>${row.key} - ${row.value.miMember.lastName}</font>"
					+"<c:if test="${sessionScope.sessionLoginUser.companyCode!=row.value.miMember.companyCode}"> [${row.value.miMember.companyCode}] </c:if>"
					+"[<font color='red'><win:code listCode="member.activestatus" value="${row.value.miMember.activeStatus}"/></font>]"
				    +"<font color='red'>${allSize-row.value.other.level+1}</font>"
				}
			</c:if>
			<c:set var="loopCount" value="${loopCount+1}"/>
		</c:forEach>
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
</c:if>