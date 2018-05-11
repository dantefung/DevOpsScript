<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemPowerManage.roleManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysRoles.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="bdReconsumMoneyReport.company"/></dd>
				<dd><select name="companyCode">
			    		<option value=""></option>
			    		<c:forEach items="${alCompanys}" var="alCompanyVar">
			    			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			    	</select></dd>
			</dl>
		</c:if>
		<dl>
			<dd><fmt:message key="sysRole.roleCode"/></dd>
			<dd><input name="roleCode" type="text" value="${param.roleCode }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<input type="hidden" name="userType" value="M"/>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<!-- <input type="hidden" name="strAction" value="listSysRoles"/> -->
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysRoleFunctionForm" id="sysRoleFunctionForm" action="editSysRole.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysRole">
				<a href="editSysRole.jhtml?strAction=addSysRole" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedRoleIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysRoleListTableForm" method="get" >
		<ec:table 
			tableId="sysRoleListTable"
			items="sysRoles"
			var="sysRoleVar"
			action="sysRoles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysRoleListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editSysRole">
						<a href="editSysRole.jhtml?strAction=editSysRole&roleId=${sysRoleVar.roleId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					&nbsp;
					<c:if test="${sysRoleVar.userType=='C'}">
						<win:power powerCode="sysRoleCompanyUser">
						<a href="sys_role_company_user.jhtml?roleId=${sysRoleVar.roleId}" name="password"><fmt:message key="menu.systemPowerManage.roleManage"/></a>
						</win:power> 
					</c:if>
				</ec:column>
				<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				<ec:column property="userType" title="sysRole.userType">
					<win:code listCode="user_type" value="${sysRoleVar.userType }"/>
				</ec:column>
				<ec:column property="roleCode" title="sysRole.roleCode" />
				<ec:column property="roleName" title="sysRole.roleName" />
				<ec:column property="roleDes" title="sysRole.roleDes" />
				<ec:column property="available" title="sysClickLog.isValid">
					<win:code listCode="yesno" value="${sysRoleVar.available }"/>
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

function multiDeleteSysRole(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRoleId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysRoleFunctionForm;
	theForm.selectedRoleIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysRole";
	
	showLoading();
	theForm.submit();
}
</script>