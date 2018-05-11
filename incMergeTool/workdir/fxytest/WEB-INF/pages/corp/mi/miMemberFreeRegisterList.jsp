<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMember.zero.purchase.regist"/></title>
    <meta name="heading" content="<fmt:message key="miMember.zero.purchase.regist"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberFreeRegisters.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.memberName"/></dt>
			<dd><input type="text" name="fullName" value="${param.fullName }"/></dd>
		</dl>
		<dl>
			<dt><win:list name="dateField" listCode="member_search_date_types" defaultValue="" value="${param.dateField }" showBlankLine="true"/></dt>
			<dd><input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/> - <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="memberFreeRegisterSearchForm" id="memberFreeRegisterSearchForm" action="memberOrders.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<div class="functionBar">
			<win:power powerCode="addMemberFreeRegister">
				<a href="addMemberFreeRegister.jhtml" name="add"><fmt:message key="mi.add.register.zeroBuy"/></a>
				<span class="divider">&nbsp;</span>
			</win:power>			
		</div>
	</form>
	
	<form id="miMemberListTableForm" method="get" >
		<ec:table 
			tableId="miMemberListTable"
			items="miMembers"
			var="miMemberVar"
			action="miMemberSearchs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:10px;">
					<win:power powerCode="viewMiMember">
						<a href="viewMiMember.jhtml?strAction=viewMiMember&source=3&memberNo=${miMemberVar.member_no}" name="profile"><fmt:message key="function.menu.memberView"/></a>
					</win:power>					
				</ec:column>
				<ec:column property="member_no" title="miMember.memberNo"/>
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="card_type" title="mi.cardType">
					<win:code listCode="member.card.type" value="${miMemberVar.card_type }"/>
				</ec:column>
				<ec:column property="recommend_no" title="mi.recommendNo"/>
				<ec:column property="recommend_name" title="mi.recommendName"/>
				<ec:column property="link_no" title="mi.lable.linkNo"/>
				<ec:column property="link_name" title="mi.linkname.lable"/>
				<ec:column property="active_time" title="mi.activity.time" styleClass="centerColumn"/>
				<ec:column property="freeze_status" title="mi.congelation.status" styleClass="centerColumn">
					<c:if test="${miMemberVar.freeze_status=='0' && miMemberVar.freeze_menu_accounts=='0' && miMemberVar.freeze_menu_bonus=='0' && miMemberVar.freeze_menu_info=='0'}">
						<c:set var="advStateColor" value="green"/>
						<c:set var="advStateStatus" value="0"/>
					</c:if>
					<c:if test="${miMemberVar.freeze_status=='1' || miMemberVar.freeze_menu_accounts=='1' || miMemberVar.freeze_menu_bonus=='1' || miMemberVar.freeze_menu_info=='1'}">
						<c:set var="advStateColor" value="red"/>
						<c:set var="advStateStatus" value="1"/>
					</c:if>
					<font color="${advStateColor }"><win:code listCode="sysuser.freezestatus" value="${advStateStatus }"/></font>
				</ec:column>
				<ec:column property="suspend_status" title="mi.lable.limit.status" styleClass="centerColumn">
					<c:if test="${miMemberVar.suspend_status=='0'}">
						<c:set var="stateColor" value="green"/>
					</c:if>
					<c:if test="${miMemberVar.suspend_status=='1'}">
						<c:set var="stateColor" value="red"/>
					</c:if>
					<font color="${stateColor }"><win:code listCode="sysuser.suspendstatus" value="${miMemberVar.suspend_status }"/></font>
				</ec:column>
				<ec:column property="exit_status" title="mi.concle.status" styleClass="centerColumn">
					<c:if test="${miMemberVar.exit_status=='0'}">
						<c:set var="stateColor" value="green"/>
					</c:if>
					<c:if test="${miMemberVar.exit_status=='1'}">
						<c:set var="stateColor" value="red"/>
					</c:if>
					<font color="${stateColor }"><win:code listCode="mimember.exitstatus" value="${miMemberVar.exit_status }"/></font>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function loginAsMember(memberNo){
	window.top.location="miMemberLoginTool.jhtml?strAction=miMemberLoginTool&memberNo="+memberNo;
}

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiMember(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMemberNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miMemberFunctionForm;
	theForm.selectedMemberNos.value=selectedValues;
	theForm.strAction.value="multiDeleteMiMember";
	
	showLoading();
	theForm.submit();
}
</script>