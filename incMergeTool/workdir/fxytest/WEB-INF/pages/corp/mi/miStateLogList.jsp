<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.memberStatus.log.update"/></title>
    <meta name="heading" content="<fmt:message key="mi.memberStatus.log.update"/>"/>
</head>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="miStateLogs.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="mi.status.type"/></dt>
			<dd><win:list name="statusType" listCode="member_status_type" defaultValue="" value="${param.statusType }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.time.update"/></dt>
			<dd>
				<input type="text" name="startEditDate" id="startEditDate" value="${param.startEditDate }" size="10"/>
				- <input type="text" name="endEditDate" id="endEditDate" value="${param.endEditDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.reason.update"/></dt>
			<dd><win:list name="editReason" listCode="member_state_change_source" defaultValue="" value="${param.editReason }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.relevance.no"/></dt>
			<dd><input type="text" name="receiptCode" value="${param.receiptCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiStateLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<form id="miStateLogListTableForm" method="get" >
		<ec:table 
			tableId="miStateLogListTable"
			items="miStateLogs"
			var="miStateLogVar"
			action="miStateLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miStateLogListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewMiStateAdjust">
						<a href="viewMiStateAdjust.jhtml?strAction=viewMiStateAdjust&adjustCode=${miStateLogVar.receipt_code}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
				</ec:column>
				<ec:column property="member_no" title="miMember.memberNo" />
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="apply_departmemt" title="mi.department.apply" styleClass="centerColumn">
					<win:code listCode="mi.department.list" value="${miStateLogVar.apply_department }"/>
				</ec:column>
				<ec:column property="change_team" title="mi.team.update" styleClass="centerColumn">
					<win:code listCode="yesno" value="${miStateLogVar.change_team }"/>
				</ec:column>
				<ec:column property="status_type" title="mi.status.type">
					<win:code listCode="member_status_type" value="${miStateLogVar.status_type }"/>
				</ec:column>
				<ec:column property="new_status" title="mi.changed.status">
					<c:if test="${miStateLogVar.status_type=='01'}">
						<win:code listCode="sysuser.suspendstatus" value="${miStateLogVar.new_status }"/>
					</c:if>
					<c:if test="${miStateLogVar.status_type=='02'||miStateLogVar.status_type=='04'||miStateLogVar.status_type=='05'||miStateLogVar.status_type=='06'}">
						<win:code listCode="sysuser.freezestatus" value="${miStateLogVar.new_status }"/>
					</c:if>
					<c:if test="${miStateLogVar.status_type=='03'}">
						<win:code listCode="member.exitstatus" value="${miStateLogVar.new_status }"/>
					</c:if>
				</ec:column>
				<ec:column property="editor_code" title="mi.changer.no" />
				<ec:column property="edit_time" title="mi.time.update" />
				<ec:column property="edit_reason" title="mi.edit.type">
					<win:code listCode="member_state_change_source" value="${miStateLogVar.edit_reason }"/>
				</ec:column>
				<ec:column property="receipt_code" title="mi.relevance.no" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript"> 
$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});
$(function() {
	$( "#startEditDate,#endEditDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiStateLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miStateLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiStateLog";
	
	showLoading();
	theForm.submit();
}
</script>