<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysUserRoleList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.systemPowerManage.roleManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysUserRoles.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sys.user.hasrole"/></dd>
			<dd><win:list id="hasrole" name="hasrole" listCode="yesno" value="${param.hasrole}" defaultValue="1"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="label.member.or.agent.code"/></dd>
			<dd><input type="text" name="searchusercode" value="${param.searchusercode }" size="14"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sys.user.state"/></dd>
			<dd><win:list id="state" name="state" listCode="prohibit" value="${param.state}" defaultValue="1"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<button type="button" name="return" onclick="window.location='/corp/sysRoles.jhtml';"><fmt:message key="operation.button.return"/></button>
				<input type="hidden" name="strAction" value="${param.strAction}"/>
				<input type="hidden"  id="roleId" name="roleId"  value="${param.roleId}"/>
				<input type="hidden" id="userCode" name="userCode" value="${param.userCode}"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysUserRoleFunctionForm" id="sysUserRoleFunctionForm" action="editSysUserRole.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<div class="functionBar">
			<c:if test="${param.hasrole == 1 || empty param.hasrole}">
				<a href="#" name="multiDelete" onclick="multiDeleteSysUserRole();">
					<fmt:message key="operation.button.delrole"/>
				</a>
			</c:if>
			<c:if test="${param.hasrole == 0}">
				<a href="#" onclick="addUsersToRole()">
					<img alt="<fmt:message  key='member.new.num'/>" src="${ctx }/themes/default/images/icons/arrangeReply.gif" border="0" align="absmiddle">
					<font color=black><fmt:message  key='operation.button.addrole'/></font>
				</a>
			</c:if>
		</div>
		<input type="hidden" name="selectedRuIds" id="selectedRuIds">
		<input type="hidden" name="strAction" >
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysUserRoleListTableForm" method="get" name="sysUserRoleListTableForm">
		<ec:table 
			tableId="sysUserRoleListTable"
			items="sysUserRoles"
			var="sysUserRoleVar"
			action="sysUserRoles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysUserRoleListTableForm">
			<ec:row>
				<c:if test="${param.hasrole == 1 ||empty param.hasrole }">					
					<ec:column alias="chkSel" headerCell="selectAll" style="width:5px;">  
					      <input type="checkbox" name="chkSel" value="${sysUserRoleVar.ru_id}"/>
					</ec:column>
					
					
					<ec:column property="user_code" title="label.member.or.agent.code" />
					<ec:column property="role_name" title="sysRole.roleName" />						
					<ec:column property="state" title="sys.user.state">
					<c:if test="${sysUserRoleVar.state==0}">
							<fmt:message key="button.lock"/>
						</c:if>
						<c:if test="${sysUserRoleVar.state==1}">
							<fmt:message key="button.unlock"/>
						</c:if>
					</ec:column>
				</c:if>
				<c:if test="${param.hasrole == 0}">
					<ec:column alias="chkSel" headerCell="selectAll" style="width:5px;">  
					      <input type="checkbox" name="chkSel" value="${sysUserRoleVar.user_code}"/>
					</ec:column>
					<ec:column property="user_code" title="label.member.or.agent.code" />
					<ec:column property="user_name" title="sys.user.username" />
					<ec:column property="state" title="sys.user.state" >
						<c:if test="${sysUserRoleVar.state==0}">
							<fmt:message key="button.lock"/>
						</c:if>
						<c:if test="${sysUserRoleVar.state==1}">
							<fmt:message key="button.unlock"/>
						</c:if>
					</ec:column>
				</c:if>
			</ec:row>
		</ec:table>
		<input type="hidden" name="strAction" >
	</form>
</div>
	<form method="post" action="/corp/editSysUserRole.jhtml" name="_frm" id="_frm">
		<input type="hidden" name="users" id="_users">
		<input type="hidden" name="roleId" id="_roleId">
		<input type="hidden" name="strAction" id="_strAction" value="addSysUserRole">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysUserRole(){
	//var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkRuId"));
	var str = getSelectedInfoRows('sysUserRoleListTable','chkSel');
	if(str.length==0){
		alert("<fmt:message key="sys.role.noselect"/>");
		return;
	}else{
		if(confirm("<fmt:message key="bdOutWardBank.confirm.delete"/>")){
			var theForm=document.sysUserRoleFunctionForm;
			theForm.selectedRuIds.value=str;
			theForm.strAction.value="multiDeleteSysUserRole";
			
			
			//showLoading();
			theForm.submit();
		}
	}

	
}
function getSelectedInfoRows(formId,checkName){
	var temp = "";
	 var ck = document.getElementsByName(checkName);
	 for ( var i=0; i<ck.length; i++ ){
	  	if((!ck[i].disabled)&&(ck[i].checked)){
	  		temp += temp==""? ck[i].value: "," +  ck[i].value ;
	 	 }
	 }
	 return temp;
}

function addUsersToRole(){
	var users = getSelectedInfoRows('sysUserRoleListTable','chkSel');
	var roleId = '${param.roleId}';
	if(users.length==0){
		alert("<fmt:message key="sys.role.noselect"/>");
		return;
	}
	$id("_users").value = users;
	$id("_roleId").value = roleId;
	$id("_strAction").value = "addSysUserRole";
	
	$id("_frm").submit();
	//sysUserRoleManager.saveSysUserRoleBatch(users,roleId,function(){window.location.reload();});
	
	//window.location = "/corp/editSysUserRole.jhtml?strAction=addSysUserRole&users="+users+"&roleId="+roleId;
}
 function $id(tagId){
	 return document.getElementById(tagId);
 }
</script>
