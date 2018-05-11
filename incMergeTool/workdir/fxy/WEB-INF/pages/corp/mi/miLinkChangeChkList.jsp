<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.link.check.menu.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.link.check.menu.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miLinkChangeChks.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="miMemberApalyCheck.askForNo"/></dt>
			<dd><input type="text" name="applyCode" value="${param.applyCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.link.old.leble"/></dt>
			<dd><input type="text" name="linkNo" value="${param.linkNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.newLinkNo"/></dt>
			<dd><input type="text" name="newLinkNo" value="${param.newLinkNo }"/></dd>
		</dl>
		<dl>
			<dt><win:list name="timeType" listCode="mi.time.type.list" defaultValue="" value="${param.timeType }" showBlankLine="true"/></dt>
			<dd><fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list listCode="member_apply_status" defaultValue="" name="status" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="miLinkChangeChks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm" action="miMemberApplyStep1.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
	</form>
	
	<form id="miMemberApplyListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyListTable"
			items="miMemberApplys"
			var="miMemberApplyVar"
			action="miLinkChangeChks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="addMiLinkChangeFile">
						<a href="editMiMemberApplyFile.jhtml?strAction=addMiLinkChangeFile&applyCode=${miMemberApplyVar.apply_code}&isCheckPower=1" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
					</win:power>
					<win:power powerCode="miLinkChangeCheck">
						<c:choose>
							<c:when test="${(miMemberApplyVar.status==1 || miMemberApplyVar.status==3 || miMemberApplyVar.status==5 || miMemberApplyVar.status==7) && miMemberApplyVar.is_finished=='0' }">
								<a href="checkMiLinkChange.jhtml?strAction=miLinkChangeCheck&applyCode=${miMemberApplyVar.apply_code}" name="check"><fmt:message key="miMemberApalyCheck.check"/></a>
							</c:when>
							<c:otherwise>
								<a href="checkMiLinkChange.jhtml?strAction=miLinkChangeCheck&applyCode=${miMemberApplyVar.apply_code}" name="view"><fmt:message key="function.menu.view"/></a>
							</c:otherwise>
						</c:choose>
					</win:power>
					<%-- <c:if test="${miMemberApplyVar.apply_type == '2' && (miMemberApplyVar.status == '5' || miMemberApplyVar.status == '7')}">
						<win:power powerCode="exportApply">
							<a href="javascript:reportExl('${miMemberApplyVar.apply_code}')" name="profile"><fmt:message key="toolbar.tooltip.xls"/></a>
						 </win:power>
					</c:if> --%>
				</ec:column>
				<ec:column property="apply_code" title="mi.askFor.no" >
					<nobr>
						${miMemberApplyVar.apply_code }
						<c:if test="${miMemberApplyVar.attach_count>0 }">
						<span class="ui-icon ui-icon-attachment" style="display:inline-block;vertical-align: text-bottom;"></span>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="apply_type" title="mi.apply.type" >
					<win:code listCode="mi.apply.type.list"  value="${miMemberApplyVar.apply_type }" />
				</ec:column>
				<ec:column property="creater_code" title="pmProductSppm.createUser" />
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="checker_code" title="mi.handler" />
				<ec:column property="check_time" title="mi.handle.time" />
				<ec:column property="status" title="fi.status">
					<win:code listCode="member_apply_status" value="${miMemberApplyVar.status}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
	<form action="miMemberApplyReport.jhtml" name="reportExl" method="post">
		<input type="hidden" name="strAction" value="exportApply"/>
		<input type="hidden" name="applyCode"/>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
function reportExl(applyCode){
	document.reportExl.applyCode.value=applyCode;
	document.reportExl.submit();
}
$(function() {
	$( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
});
</script>