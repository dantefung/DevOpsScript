<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApalyCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApalyCheck.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberApplyChks.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><win:list name="timeType" listCode="mi.time.type.list" defaultValue="" value="${param.timeType }" showBlankLine="true"/></dt>
			<dd><fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<%-- <dl>
			<dt><fmt:message key="mi.current.step.lable"/></dt>
			<dd><win:list listCode="mi.check.step.list" defaultValue="" name="currentStep" value="${param.currentStep }" showBlankLine="true"/></dd>
		</dl> --%>
		<dl>
			<dt><fmt:message key="mi.check.check.step"/></dt>
			<dd><win:list listCode="mi.check.check.list" defaultValue="" name="checkStep" value="${param.checkStep }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.apply.type"/></dt>
			<dd><win:list listCode="mi.apply.type.list" defaultValue="" name="applyType" value="${param.applyType }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list listCode="member_apply_status" defaultValue="" name="status" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.wait.repair.check"/></dt>
			<dd><win:list listCode="mi.check.repair.list" defaultValue="" name="repairStep" value="${param.repairStep }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="miMemberApplyChks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm" action="editMiMemberApply.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<div class="functionBar">
			<win:power powerCode="infoDepartment">
				<a href="javascript:multiExcuteMiMemberApply();" name="check"><fmt:message key="lang.infoDeptExecute"/></a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedApplyCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberApplyListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyListTable"
			items="miMemberApplys"
			var="miMemberApplyVar"
			action="miMemberApplyChks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyListTableForm">
			<ec:row>
				<ec:column alias="chkApplyCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${(miMemberApplyVar.status==1 || miMemberApplyVar.status==0 || miMemberApplyVar.status==5) && miMemberApplyVar.is_finished=='0' }">
						<input type="checkbox" name="chkApplyCode" value="${miMemberApplyVar.apply_code}" class="checkbox" viewsAllowed="html" />
					</c:if>
				</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="addMiMemberApplyFile">
						<a href="editMiMemberApplyFile.jhtml?strAction=addMiMemberApplyFile&applyCode=${miMemberApplyVar.apply_code}&isCheckPower=1" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
					</win:power>
					<c:choose>
						<c:when test="${(miMemberApplyVar.status==1 || miMemberApplyVar.status==0 || miMemberApplyVar.status==5 || miMemberApplyVar.status==7) && miMemberApplyVar.is_finished=='0' }">
							<a href="checkMiMemberApply.jhtml?strAction=checkMiMemberApply&applyCode=${miMemberApplyVar.apply_code}" name="check"><fmt:message key="miMemberApalyCheck.check"/></a>
						</c:when>
						<c:otherwise>
							<a href="checkMiMemberApply.jhtml?strAction=checkMiMemberApply&applyCode=${miMemberApplyVar.apply_code}" name="view"><fmt:message key="function.menu.view"/></a>
						</c:otherwise>
					</c:choose>
					<%-- <c:if test="${miMemberApplyVar.apply_type == '2' && (miMemberApplyVar.status == '5' || miMemberApplyVar.status == '7')}">
						<win:power powerCode="exportApply">
							<a href="javascript:reportExl('${miMemberApplyVar.apply_code}')" name="profile"><fmt:message key="toolbar.tooltip.xls"/></a>
						 </win:power>
					</c:if> --%>
				</ec:column>
				<ec:column property="apply_code" title="mi.askFor.no" />
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
				<ec:column property="111" title="mi.synchro.yesorno">
					<c:set var="param1"  value="${miMemberApplyVar.apply_code }"/>
					<c:set var="param2"  value="D"/>
				    <c:if test="${!fn:startsWith(param1,param2)}">
						<win:code listCode="yesno" value="1"/>
					</c:if> 
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

function multiExcuteMiMemberApply(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplyCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToExecute'/>?");//请选择需要执行的单据
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmOrderToExecute'/>.")){//确认执行当前所选择的单据
		return;
	}
	var theForm=document.miMemberApplyFunctionForm;
	theForm.selectedApplyCodes.value=selectedValues;
	theForm.strAction.value="infoDepartment";
	
	showLoading();
	theForm.submit();
}
</script>