<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.memberInfo.maintain"/></title>
    <meta name="heading" content="<fmt:message key="mi.memberInfo.maintain"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMembers.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
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
			<dt><fmt:message key="mi.linkno.lable"/></dt>
			<dd><input type="text" name="linkNo" value="${param.linkNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.linkname.lable"/></dt>
			<dd><input type="text" name="linkName" value="${param.linkName }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.cardType"/></dt>
			<dd><win:list name="cardType" listCode="member.card.type" defaultValue="" value="${param.cardType }" showBlankLine="true"/></dd>
		</dl>
		<%-- <dl>
			<dt><fmt:message key="mi.starType"/></dt>
			<dd><win:list listCode="stars_level" name="_startype" defaultValue="" value="${param._startype }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>荣衔</dt>
			<dd><win:list name="awards" listCode="member_awards" defaultValue="" value="${param.awards }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>报单中心</dt>
			<dd>
				<win:list name="isAgent" listCode="yesno" defaultValue="" value="${param.isAgent }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt>所属报单中心</dt>
			<dd><input type="text" name="agentNo" value="${param.agentNo }" size="14"/></dd>
		</dl> --%>
		<dl>
			<dt><fmt:message key="mi.register.sourceProp"/></dt>
			<dd>
				<win:list name="registerType" listCode="mimember.registertype" defaultValue="" value="${param.registerType }" showBlankLine="true"/>
			</dd>
		</dl>
		<%-- <dl>
			<dt>认识渠道</dt>
			<dd>
				<win:list name="knewMethod" listCode="knew_methods" defaultValue="" value="${param.knewMethod }" showBlankLine="true"/>
			</dd>
		</dl> --%>
		<dl>
			<dt><fmt:message key="poOrder.billFromPersonNo"/></dt>
			<dd><input type="text" name="creatorCode" value="${param.creatorCode }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.billFromPersonName"/></dt>
			<dd><input type="text" name="creatorName" value="${param.creatorName }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.activity.status"/></dt>
			<dd><win:list name="activeStatus" listCode="member.activestatus" defaultValue="" value="${param.activeStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.congelation.status"/></dt>
			<dd><win:list name="freezeStatus" listCode="sysuser.freezestatus" defaultValue="" value="${param.freezeStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.lable.limit.status"/></dt>
			<dd><win:list name="suspendStatus" listCode="sysuser.suspendstatus" defaultValue="" value="${param.suspendStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.concle.status"/></dt>
			<dd><win:list name="exitStatus" listCode="mimember.exitstatus" defaultValue="" value="${param.exitStatus }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>旧会员</dt>
			<dd><win:list name="isOld" listCode="yesno" defaultValue="" value="${param.isOld }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><win:list name="dateField" listCode="member_search_date_types" defaultValue="" value="${param.dateField }" showBlankLine="true"/></dt>
			<dd><input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/> - <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
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
			<dt>旧会员编号</dt>
			<dd><input type="text" name="oldMemberNo" value="${param.oldMemberNo }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="miMemberMaintain"/>
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
			action="miMembers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" 
			sortable="false" form="miMemberListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:90px;">
					<win:power powerCode="viewMiMember">
						<a href="viewMiMember.jhtml?strAction=viewMiMember&source=1&memberNo=${miMemberVar.member_no}" name="profile"><fmt:message key="function.menu.memberView"/></a>
					</win:power>
					<win:power powerCode="editMiMember">
						<a href="editMiMember.jhtml?strAction=editMiMember&memberNo=${miMemberVar.member_no}" name="edit"><fmt:message key="button.edit"/></a>
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
				<ec:column property="awards" title="荣衔">
					<win:code listCode="member_awards" value="${miMemberVar.awards }"/>
				</ec:column>
				<ec:column property="email" title="mi.email"/>
				<ec:column property="is_agent" title="报单中心">
					<win:code listCode="yesno" value="${miMemberVar.is_agent }"/>
				</ec:column>
				<ec:column property="agent_region_name" title="代理区域"/>
				<ec:column property="register_type" title="mi.register.sourceProp">
					<win:code listCode="mimember.registertype" value="${miMemberVar.register_type }"/>
				</ec:column>
				<ec:column property="knew_method" title="认识渠道">
					<win:code listCode="knew_methods" value="${miMemberVar.knew_method }"/>
				</ec:column> --%>
				<ec:column property="recommend_no" title="mi.recommendNo"/>
				<ec:column property="recommend_name" title="miMember.recommendName"/>
				<ec:column property="link_no" title="mi.linkno.lable"/>
				<ec:column property="link_name" title="mi.linkname.lable"/>
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