<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.membersearch"/></title>
    <meta name="heading" content="<fmt:message key='function.menu.membersearch'/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberSearchs.jhtml" onsubmit="return validateSearch(this)">
	<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="sys.common.companyCode"/></dt>
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
			<dt><fmt:message key="mi.recommendNo"/></dt>
			<dd><input type="text" name="recommendNo" value="${param.recommendNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.recommendName"/></dt>
			<dd><input type="text" name="recommendName" value="${param.recommendName }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.delivery.moblie"/></dt>
			<dd><input type="text" name="mobile" value="${param.mobile }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.lable.cardNo"/></dt>
			<dd><input type="text" name="idNO" value="${param.idNO }" size="24"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.email"/></dt>
			<dd><input type="text" name="email" value="${param.email }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search" value="1"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<form id="miMemberListTableForm" method="get" >
			<ec:table 
			tableId="miMemberListTable"
			items="miMembers"
			var="miMemberVar"
			action="miMemberSearchs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" 
			sortable="false" form="miMemberListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:90px;">
					<win:power powerCode="viewMiMember">
						<a href="viewMiMember.jhtml?strAction=viewMiMember&source=3&memberNo=${miMemberVar.member_no}" name="view"><fmt:message key="function.menu.memberView"/></a>
					</win:power>
					<win:power powerCode="resetMiMemberPwd">
						<a href="resetMiMemberPwd.jhtml?strAction=resetMiMemberPwd&memberNo=${miMemberVar.member_no}" name="password"><fmt:message key="function.menu.resetPassword_1"/></a>
					</win:power>
					<win:power powerCode="miMemberLoginTool">
						<a href="javascript:loginAsMember('${miMemberVar.member_no}');" name="logintool"><fmt:message key="sys.logintool"/></a>
					</win:power>
				</ec:column>
				<ec:column property="company_code" title="label.company"/>
				<ec:column property="member_no" title="miMember.memberNo">
					${miMemberVar.member_no}
					<c:if test="${miMemberVar.is_credit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
				</ec:column>
				<ec:column property="user_name" title="poOrder.memberName"/>
				<ec:column property="card_type" title="bdCalculatingSubDetail.cardType">
					<win:code listCode="member.card.type" value="${miMemberVar.card_type }"/>
				</ec:column>
			   <%-- <ec:column property="star" title="mi.starType">
					<win:code listCode="stars_level" value="${miMemberVar.star }"/>
				</ec:column> 
				<ec:column property="is_agent" title="社区店">
					<win:code listCode="yesno" value="${miMemberVar.is_agent }"/>
				</ec:column> --%>
				<ec:column property="register_type" title="mi.register.sourceProp">
					<win:code listCode="mimember.registertype" value="${miMemberVar.register_type }"/>
				</ec:column>
				<ec:column property="recommend_no" title="mi.recommendNo"/>
				<ec:column property="recommend_name" title="miMember.recommendName"/>
				<ec:column property="create_time" title="mi.joindate" styleClass="centerColumn">
					<c:if test="${miMemberVar.create_time!=null && miMemberVar.create_time!='' && fn:length(miMemberVar.create_time)>=19}">
						${fn:substring(miMemberVar.create_time,0,19)} 
					</c:if>
				</ec:column>
				<ec:column property="active_time" title="mi.activity.time" styleClass="centerColumn">
					<c:if test="${miMemberVar.active_time!=null && miMemberVar.active_time!='' && fn:length(miMemberVar.active_time)>=19}">
						${fn:substring(miMemberVar.active_time,0,19)} 
					</c:if>
				</ec:column>
				<ec:column property="active_status" title="mi.activity.status" styleClass="centerColumn">
					<c:if test="${miMemberVar.active_status=='1'}">
						<c:set var="advStateColor" value="green"/>
					</c:if>
					<c:if test="${miMemberVar.active_status=='0'}">
						<c:set var="advStateColor" value="red"/>
					</c:if>
					<font color="${advStateColor }"><win:code listCode="member.activestatus" value="${miMemberVar.active_status }"/></font>
				</ec:column>
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
						<c:set var="advStateColor" value="green"/>
					</c:if>
					<c:if test="${miMemberVar.exit_status=='1'}">
						<c:set var="advStateColor" value="red"/>
					</c:if>
					<font color="${advStateColor }"><win:code listCode="mimember.exitstatus" value="${miMemberVar.exit_status }"/></font>
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