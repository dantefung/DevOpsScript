<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.memberRegisterList"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.memberRegisterList"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="memberRegisters.jhtml" onsubmit="return validateSearch(this)">
		<table class="detail" border="0" >
			<tr>
				<td><fmt:message key="miMember.memberNo"/></td>
				<td><input type="text" name="memberNo" id="memberNo" value="${param.memberNo }"/></td>
				<td><fmt:message key="poOrder.memberName"/></td>
				<td><input type="text" name="lastName" id="lastName" value="${param.lastName }"/></td>
				<td>
					<select name="dateType" id="dateType" style="width:110px;">
						<option value=""><fmt:message key="mi.choosedatetype"/></option>
						<c:forEach items="${dateTypeMap }" var="var">
							<option value="${var.key }" <c:if test="${param.dateType == var.key }">selected="selected"</c:if>>${var.value }</option>
						</c:forEach>
					</select>
				</td>
				<td>
					<fmt:message key="ic.lable.from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:70px;" readonly="readonly"/>
					<fmt:message key="ic.lable.to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:70px;" readonly="readonly"/>
				</td>
				<td><button type="submit" name="search"><fmt:message key="operation.button.search"/></button></td>
			</tr>			
		</table>
	</form>
</div>
<br/>
<div class="contentBody">
	<form id="miMemberListTableForm" method="get" >
		<ec:table 
			tableId="miMemberListTable"
			items="miMembers"
			var="miMemberVar"
			action="memberRegisters.jhtml"
			width="100%" method="get"
			showPagination="false"
			showStatusBar="false"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="5" showTooltips="false" sortable="false" form="miMemberListTableForm">
			<ec:row>
						
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<a href="memberView.jhtml?memberNo=${miMemberVar.memberNo}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="memberNo" title="miMember.memberNo" />
				<ec:column property="firstName" title="mi.realname" >
					<c:if test="${not empty miMemberVar.firstName }">${miMemberVar.firstName }&nbsp;</c:if>${miMemberVar.lastName }
				</ec:column>
				<ec:column property="petName" title="mi.register.petName" />
				<ec:column property="recommendNo" title="mi.recommendNo" />
				<ec:column property="mobile" title="miMember.delivery.moblie" />
				<ec:column property="createTime" title="mi.joindate" />
				<ec:column property="activeTime" title="mi.activity.time" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
});

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