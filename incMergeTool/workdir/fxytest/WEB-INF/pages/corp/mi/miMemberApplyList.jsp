<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.modify.memberInfo"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.modify.memberInfo"/>"/>
</head>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<div class="searchBar">
	<form method="get" action="miMemberApplys.jhtml" onsubmit="return validateSearch(this)">
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
		<dl>
			<dt><fmt:message key="mi.current.step.lable"/></dt>
			<dd><win:list listCode="mi.check.step.list" defaultValue="" name="currentStep" value="${param.currentStep }" showBlankLine="true"/></dd>
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
			<dt><fmt:message key="contains.attachment"/></dt>
			<dd><win:list listCode="yesno" defaultValue="" name="hasAttach" value="${param.hasAttach }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<c:if test="${empty param.strAction || param.strAction=='listMiMemberApplys'}">
		<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm" action="editMiMemberApply.jhtml" method="post" >
			<%@ include file="/common/messages.jsp" %>
			<div class="functionBar">
				<win:power powerCode="addMiMemberApply">
					<a href="miMemberApplyStep1.jhtml" name="add"><fmt:message key="mi.applyFor.modify.member.info"/></a>
					<span class="divider">&nbsp;</span>
				</win:power>
				<%-- <win:power powerCode="submitMiMemberApply">
					<a href="javascript:multiSubmitMiMemberApply();" name="submit"><fmt:message key="button.submit"/></a>
					<span class="divider">&nbsp;</span>
				</win:power> --%>
				<win:power powerCode="deleteMiMemberApply">
					<a href="javascript:multiDeleteMiMemberApply();" name="nosubmit"><fmt:message key="efubo.card.zf"/></a>
					<span class="divider">&nbsp;</span>
				</win:power>
			</div>
			<input type="hidden" name="selectedApplyCodes">
			<input type="hidden" name="strAction">
			<input type="hidden" name="_form_uniq_id" value="${form.token}" />
		</form>
	</c:if>
	<form id="miMemberApplyListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyListTable"
			items="miMemberApplys"
			var="miMemberApplyVar"
			action="miMemberApplys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberApplyListTableForm">
			<ec:row>
				<ec:column alias="chkApplyCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${miMemberApplyVar.apply_type != '7' && (miMemberApplyVar.status == -1 || miMemberApplyVar.status == 0)}">
						<input type="checkbox" name="chkApplyCode" value="${miMemberApplyVar.apply_code}" class="checkbox" viewsAllowed="html" />
					</c:if>
				</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiMemberApply">
						<c:if test="${not empty param.strAction }">
							<a href="viewMiMemberApply.jhtml?applyCode=${miMemberApplyVar.apply_code}&strAction=viewMiMemberApply" name="view"><fmt:message key="function.menu.view"/></a>
						</c:if>
						<c:if test="${empty param.strAction }">
							<a href="viewMiMemberApply.jhtml?applyCode=${miMemberApplyVar.apply_code}&strAction=viewMiMemberApply&isApply=1" name="view"><fmt:message key="function.menu.view"/></a>
						</c:if>
					</win:power>
					<c:if test="${empty param.strAction || param.strAction=='listMiMemberApplys'}">
						<win:power powerCode="addMiMemberApplyFile">
							<a href="editMiMemberApplyFile.jhtml?strAction=addMiMemberApplyFile&applyCode=${miMemberApplyVar.apply_code}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
						</win:power>
					</c:if>
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
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiSubmitMiMemberApply(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplyCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToSubmit'/>.");//请选择需要提交的单据
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToSubmitSelectedOrder'/>.")){//确认提交当前所选择的单据
		return;
	}
	var theForm=document.miMemberApplyFunctionForm;
	theForm.selectedApplyCodes.value=selectedValues;
	theForm.strAction.value="submitMiMemberApply";
	
	showLoading();
	theForm.submit();
}

function multiDeleteMiMemberApply(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplyCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToCancel'/>.");//请选择需要作废的单据
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToCancelSelectedOrder'/>.")){//确认作废当前所选择的单据
		return;
	}
	var theForm=document.miMemberApplyFunctionForm;
	theForm.selectedApplyCodes.value=selectedValues;
	theForm.strAction.value="deleteMiMemberApply";
	
	showLoading();
	theForm.submit();
}

$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});
$(function() {
	$( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
});

</script>