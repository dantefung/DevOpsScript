<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.memberStatus"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.memberStatus"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="miStateAdjusts.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><input type="text" name="adjustCode" value="${param.adjustCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt><win:list name="timeType" listCode="mi.time.type.list" defaultValue="" value="${param.timeType }" showBlankLine="true"/></dt>
			<dd><fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.current.step.lable"/></dt>
			<dd><win:list listCode="mi.status.check.step.list" defaultValue="" name="currentStep" value="${param.currentStep }" showBlankLine="true"/></dd>
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
				<input type="hidden" name="strAction" value="listMiStateAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miStateAdjustFunctionForm" id="miStateAdjustFunctionForm" action="editMiStateAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiStateAdjust">
				<a href="editMiStateAdjust.jhtml?strAction=addMiStateAdjust" name="add"><fmt:message key="mi.add.memberStatus.update.applyFor"/></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="submitMiStateApply">
				<a href="javascript:multiSubmitMiStateAdjust();" name="submit"><fmt:message key="button.submit"/></a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="deleteMiStateAdjust">
				<a href="javascript:multiDeleteMiStateAdjust();" name="nosubmit"><fmt:message key="efubo.card.zf"/></a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedAdjustCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miStateAdjustListTableForm" method="get" >
		<ec:table 
			tableId="miStateAdjustListTable"
			items="miStateAdjusts"
			var="miStateAdjustVar"
			action="miStateAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miStateAdjustListTableForm">
			<ec:row>
				<ec:column alias="chkAdjustCode" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
					<c:if test="${miStateAdjustVar.status == -1 || miStateAdjustVar.status == 0}">
						<input type="checkbox" name="chkAdjustCode" value="${miStateAdjustVar.adjust_code}" class="checkbox" viewsAllowed="html" />
					</c:if>
				</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiStateAdjust">
						<a href="viewMiStateAdjust.jhtml?strAction=viewMiStateAdjust&adjustCode=${miStateAdjustVar.adjust_code}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<win:power powerCode="addMiStateFile">
						<a href="editMiStateFile.jhtml?strAction=addMiStateFile&adjustCode=${miStateAdjustVar.adjust_code}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
					</win:power>
				</ec:column>
				<ec:column property="adjust_code" title="mi.askFor.no" />
				<ec:column property="member_no" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="apply_department" title="mi.department.apply" styleClass="centerColumn">
					<win:code listCode="mi.department.list" value="${miStateAdjustVar.apply_department }"/>
				</ec:column>
				<ec:column property="change_team" title="mi.team.update">
					<win:code listCode="yesno" value="${miStateAdjustVar.change_team }"/>
				</ec:column>
				<ec:column property="change_suspend_status" title="mi.lable.limit.status">
					<c:if test="${miStateAdjustVar.change_suspend_status==1}">
						<span class="important"><win:code listCode="sysuser.suspendstatus" value="${miStateAdjustVar.new_suspend_status }"/></span>
					</c:if>
					<c:if test="${miStateAdjustVar.change_suspend_status!=1}">
						-
					</c:if>
				</ec:column>
				<ec:column property="change_freeze_status" title="mi.congelation.status">
					<c:if test="${miStateAdjustVar.change_freeze_status==1}">
						<span class="important"><win:code listCode="sysuser.freezestatus" value="${miStateAdjustVar.new_freeze_status }"/></span>
					</c:if>
					<c:if test="${miStateAdjustVar.change_freeze_status!=1}">
						-
					</c:if>
				</ec:column>
				<ec:column property="change_exit_status" title="mi.concle.status">
					<c:if test="${miStateAdjustVar.change_exit_status==1}">
						<span class="important"><win:code listCode="mimember.exitstatus" value="${miStateAdjustVar.new_exit_status }"/></span>
					</c:if>
					<c:if test="${miStateAdjustVar.change_exit_status!=1}">
						-
					</c:if>
				</ec:column>
				<ec:column property="status" title="fi.status">
					<win:code listCode="member_apply_status" value="${miStateAdjustVar.status}"/>
				</ec:column>
				<ec:column property="creater_code" title="pmProductSppm.createUser">
					${miStateAdjustVar.creater_code}<br/>${miStateAdjustVar.create_time}
				</ec:column>
				<ec:column property="approver_code" title="mi.handler">
					${miStateAdjustVar.approver_code}<br/>${miStateAdjustVar.approve_time}
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
function subApply(adjustCode){
	<win:power powerCode="submitMiStateApply">
		if(confirm("<fmt:message key='mi.suresubmitm'/>")){
			window.location.href = "submitMiStateApply.jhtml?strAction=submitMiStateApply&adjustCode="+adjustCode;
		}
	</win:power>
}

function multiSubmitMiStateAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToSubmit'/>.");//请选择需要提交的单据
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToSubmitSelectedOrder'/>.")){//确认提交当前所选择的单据
		return;
	}
	var theForm=document.miStateAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="submitMiStateApply";
	
	showLoading();
	theForm.submit();
}

function multiDeleteMiStateAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("<fmt:message key='lang.plsSelectOrderToCancel'/>.");//请选择需要作废的单据
		return;
	}
	if(!confirm("<fmt:message key='lang.confirmToCancelSelectedOrder'/>.")){//确认作废当前所选择的单据
		return;
	}
	var theForm=document.miStateAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="deleteMiStateAdjust";
	
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