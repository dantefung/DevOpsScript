<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<script language="JavaScript">
var showLoading=false;

var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

var simpleNodes =[
	<c:forEach items="${alCompanys}" var="alCompanyVar">
	{ id:'C#${alCompanyVar.companyCode}', pId:'0', name:"${alCompanyVar.companyName}",open:false,nocheck:true},
	</c:forEach>
	
	<c:forEach items="${sysDepartments}" var="sysDepartmentVar">
		<c:if test="${sysDepartmentVar.parentId==0}">
		{ id:'D#${sysDepartmentVar.departmentId}', pId:'C#${sysDepartmentVar.companyCode}', name:"${sysDepartmentVar.departmentName}",open:false,nocheck:true},
		</c:if> 
		<c:if test="${sysDepartmentVar.parentId!=0}">
		{ id:'D#${sysDepartmentVar.departmentId}', pId:'D#${sysDepartmentVar.parentId}', name:"${sysDepartmentVar.departmentName}",open:false,nocheck:true},
		</c:if> 
	</c:forEach>
	
	<c:forEach items="${sysManagers}" var="managerRow" varStatus="managerRowStatus">
	{ id:'M#${managerRow.user_code}', pId:'D#${managerRow.department_id}', name:"${managerRow.user_name}(${managerRow.user_code})",icon:"${ctx}/themes/${theme}/images/icons/user.gif",nocheck:false},
	</c:forEach>
	];

function reloadTree() {
	$.fn.zTree.init($("#managerTree"), setting, simpleNodes);
}
$(document).ready( function() {
	reloadTree();
});
</script>

<div class="contentBody">
	<form:form commandName="sysRole" method="post" action="sys_role_company_user.jhtml" onsubmit="return validateOthers(this)" id="sysRoleForm">
	
	<table class="detail">
	
	<form:hidden path="roleId"/>
	<form:hidden path="companyCode"/>
		<tr><th><fmt:message  key="bdReconsumMoneyReport.company"/>:</th>
	    	<td>${sysRole.companyCode }</td>
	    </tr>
	    <tr>
		<th>
	        <fmt:message  key="sysRole.roleCode"/>:
	    </th>
	    <td>${sysRole.roleCode }</td>
	    </tr>
	    <tr>
	    <th>
	        <fmt:message  key="sysRole.roleName"/>:
	    </th>
	    <td>${sysRole.roleName } </td>
		</tr>
		<tr>
	    <th>
	        <fmt:message  key="sysRole.roleDes"/>:
	    </th>
	    <td>${sysRole.roleDes }</td>
		</tr>
		<tr>
	    <tr><th>
	        <fmt:message key="sysRole.to.user"/>:
	    </th>
	    <td>
	    	<div class="zTreeDemoBackground left" style="border:1px solid #EEEEEE;width:400px;height:350px;overflow: auto;">
				<ul id="managerTree" class="ztree"></ul>
			</div>
	    </td>
	    </tr>
	    <tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<wbs:power powerCode="sysRoleCompanyUser">
						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
					</wbs:power>
			
					<button type="button" name="cancel" onclick="window.location='sysRoles.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
					<input type="hidden" name="strAction" value="sysRoleCompanyUser"/>
					<input type="hidden" name="selectedUser" value=""/>
					<input type="hidden" value="${form.token}" name="_form_uniq_id" />
                </div>
    		</td>
    	</tr>
	</table>
	
	</form:form>
</div>

<script type="text/javascript">
function validateOthers(theForm){
	if(!confirm("<fmt:message key="sysRole.notice.override.confirm"/>")){
		return false;
	}
	var treeObj = $.fn.zTree.getZTreeObj("managerTree");
	theForm.selectedUser.value=getCheckedNodesValueFromTree(treeObj);
	return true;
}
</script>
