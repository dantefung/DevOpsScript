<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysUserList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysUserList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysUsers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>搜索条件1</dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysUsers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysUserFunctionForm" id="sysUserFunctionForm" action="editSysUser.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysUser">
				<a href="editSysUser.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteSysUser">
				<a href="javascript:multiDeleteSysUser()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedUserCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysUserListTableForm" method="get" >
		<ec:table 
			tableId="sysUserListTable"
			items="sysUsers"
			var="sysUserVar"
			action="sysUsers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysUserListTableForm">
			<ec:row>
				<ec:column alias="chkUserCode" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkUserCode" value="${sysUserVar.userCode}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editSysUser">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editSysUser.jhtml?strAction=editSysUser&userCode=${sysUserVar.userCode}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="userCode" title="sysUser.userCode" />
				<ec:column property="userName" title="sysUser.userName" />
				<ec:column property="password" title="sysUser.password" />
				<ec:column property="advPassword" title="sysUser.advPassword" />
				<ec:column property="state" title="sysUser.state" />
				<ec:column property="companyCode" title="sysUser.companyCode" />
				<ec:column property="userType" title="sysUser.userType" />
				<ec:column property="defLang" title="sysUser.defLang" />
				<ec:column property="ipCheck" title="sysUser.ipCheck" />
				<ec:column property="secCode" title="sysUser.secCode" />
				<ec:column property="loginTimes" title="sysUser.loginTimes" />
				<ec:column property="lastLoginTime" title="sysUser.lastLoginTime" />
				<ec:column property="currentLoginTime" title="sysUser.currentLoginTime" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysUser(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkUserCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysUserFunctionForm;
	theForm.selectedUserCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteSysUser";
	
	showLoading();
	theForm.submit();
}
</script>