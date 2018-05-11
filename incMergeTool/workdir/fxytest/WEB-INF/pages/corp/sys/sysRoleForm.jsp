<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemPowerManage.roleManage"/>"/>
</head>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/ztree/zTreeStyle.css" type="text/css"/>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.core-3.5.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.ztree.excheck-3.4.min.js"></script>

<script language="JavaScript">
//var showLoading=false;
var companyCode="${sysRole.companyCode}";
var userType="${sysRole.userType}";
var setting = {
		async: {
			enable: true,
			autoParam:[],
			otherParam:{"roleId":"${sysRole.roleId}","companyCode":companyCode,"userType":userType},
			url:"ajax/sysRolePowerAjax.jhtml"
		},
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};

function reloadTree() {
	$.fn.zTree.init($("#managerTree"), setting);
}
$(document).ready( function() {
	reloadTree();
});
</script>

<div class="contentBody">
    <form:form commandName="sysRole" method="post" action="editSysRole.jhtml" onsubmit="return validateForm(this)" id="sysRoleForm">
    
    <spring:bind path="sysRole.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr><th class="required">
		        <fmt:message  key="bdReconsumMoneyReport.company"/>
		    </th>
		    <td align="left" width="100%">
		        <form:select path="companyCode" id="companyCode" onchange="reloadRolePowers(this.form)">
		        	<option value=""></option>
		        	<c:forEach items="${alCompanys}" var="alCompanyVar">
	        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==sysRole.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
		    		</c:forEach>
		        </form:select>
     	</td></tr>
    	<tr>
    		<th class="required"><fmt:message key="sysRole.roleCode"/>:</th>
    		<td><form:input path="roleCode" id="roleCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysRole.roleName"/>:</th>
    		<td><form:input path="roleName" id="roleName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysRole.roleDes"/>:</th>
    		<td><form:input path="roleDes" id="roleDes" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysClickLog.isValid"/>:</th>
    		<td><win:list listCode="yesno" name="available" value="${status.value}" defaultValue="1"/></td>
    	</tr>
    	<tr><th> <fmt:message  key="sysRole.modules"/> </th>
		    <td align="left">
		    	<div class="zTreeDemoBackground left" style="border:1px solid #EEEEEE;width:400px;height:250px;overflow: auto;">
					<ul id="managerTree" class="ztree"></ul>
				</div>
		    </td></tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="userType" value="M"/>
    				<form:hidden path="roleId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysRole.roleId }">
    					<win:power powerCode="deleteSysRole">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysRole')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysRoles.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    <input type="hidden" name="moduleIds" value="${moduleIds }"/>
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	validateOthers(theForm);
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.userType.value == ""){
		alert("<fmt:message key="sysRole.userType.required"/>");
		theForm.userType.focus();
		return false;
	}else if(theForm.roleCode.value == ""){
		alert("<fmt:message key="sysRole.roleCode.required"/>");
		theForm.roleCode.focus();
		return false;
	}else if(theForm.roleName.value == ""){
		alert("<fmt:message key="sysRole.roleName.required"/>");
		theForm.roleName.focus();
		return false;
	}else{
		showLoading();
		return true;
	}
}
function reloadRolePowers(theForm){
	var companyCode=theForm.companyCode.value;
	var userType=theForm.userType.value;
	
	var treeObj = $.fn.zTree.getZTreeObj("managerTree");
	treeObj.setting.async.otherParam.companyCode=companyCode;
	treeObj.setting.async.otherParam.userType=userType;
	treeObj.reAsyncChildNodes(null, "refresh");
}
function validateOthers(theForm){
	var treeObj = $.fn.zTree.getZTreeObj("managerTree");
	 theForm.moduleIds.value = getCheckedNodesValueFromTree(treeObj);
}
</script>