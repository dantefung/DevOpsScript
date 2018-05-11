<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<script type="text/javascript" src="<c:url value='${ctx }/scripts/validate.js'/>"></script>
<head>
    <title><fmt:message key="title.change.password"/></title>
    <meta name="heading" content="<fmt:message key="title.change.password"/>"/>
</head>

<form:form commandName="sysUser" method="post" action="/corp/editSysManagerPwd.jhtml" onsubmit="return validatePassword(this)" id="sysUserEditForm">
<%@ include file="/common/messages.jsp" %>
<input type="hidden" name="strAction" value="sysModifyPwd" />
<input type="hidden" name="modifyType" value="${param.modifyType }" />
<input type="hidden" name="departmentId" value="${departmentId }" />
<table class="detail">
<form:hidden path="userCode"/>
	<tr>
		<td class="title" colspan="2">
			<input type="checkbox" value="userPassword" name="passwordType" id="userPassword" class="checkbox" checked="checked"/>
			<label for="userPassword"><fmt:message key="sysUser.userPassword"/></label>
		</td>
		<td class="title" colspan="2">
			<input type="checkbox" value="password2" name="passwordType" id="password2" class="checkbox"/>
			<label for="password2"><fmt:message key="sysUser.password2"/></label>
		</td>
	</tr>
	
	<c:if test="${empty param.modifyType}">
	<tr>
		<th class="required"><fmt:message key="sysUser.oldPassword" />:</th>
		<td><input type="password" id="oldPassword" name="oldPassword" style="-moz-user-select:none;"  onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="1"/></td>
		<th class="required"><fmt:message key="sysUser.oldPassword" />:</th>
		<td><input type="password" id="oldPasswordTwo" name="oldPasswordTwo" style="-moz-user-select:none;"  onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="5"/></td>
	</tr>
	</c:if>
	
	<tr>
		<th class="required"><fmt:message key="sysUser.newPassword" />:</th>
		<td>
			<input type="password" id="newPassword" name="newPassword" onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="2"/><br>
		</td>
		<th class="required"><fmt:message key="sysUser.newPassword" />:</th>
		<td>
			<input type="password" id="newPasswordTwo" name="newPasswordTwo" onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="6"/><br>
		</td>
	</tr>

	<tr>
		<th class="required"><fmt:message key="sysUser.repeatPassword" />:</th>
		<td><input type="password" id="newPassword2" name="newPassword2" onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="3"/></td>
		<th class="required"><fmt:message key="sysUser.repeatPassword" />:</th>
		<td><input type="password" id="newPassword2Two" name="newPassword2Two" onselectstart="return false;"  ondragenter="return false;"   onpaste="return false" tabindex="7"/></td>
	</tr>
	
	<tr>
		<th class="required"><fmt:message key="login.verifyCode"/>:</th>
		<td colspan="3"><input name="verifyCode" tabindex="3" type="text" class="textInput" tabindex="4"/>
			<a href="javascript:refreshCaptchaImage('captchaImg');"><img id="captchaImg" src="${ctx}/captcha.jhtml?rnd=<%=Math.random() * 1000000%>" width="60" height="18" border="0"/></a></td>
	</tr>
	
	<tr>
		<th class="command">&nbsp;</th>
		<td class="command" colspan="3" >
			<fmt:message key="tips.password"/><br/><br/>
			<win:power powerCode="sysModifyPwd">
				<button type="submit" name="submit" onclick="bCancel=false"><fmt:message key="button.save"/></button>
			</win:power>
			<c:if test="${empty param.modifyType}">
				<button type="button" name="cancel" onclick="window.location='editSysManagerPwd.jhtml?strAction=sysModifyPwd'"><fmt:message key="operation.button.cancel"/></button>
			</c:if>
			
			<c:if test="${param.modifyType=='other'}">
					<button type="button" name="cancel" onclick="window.location='sysManagerOrg.jhtml?companyCode=${sysUser.companyCode }&departmentId=${departmentId }'"><fmt:message key="operation.button.cancel"/></button>
			</c:if>
			
			<c:if test="${param.modifyType=='account'}">
				<button type="button" name="cancel" onclick="window.location='sysManagers.jhtml?companyCode=${sysUser.companyCode }&departmentId=${sysManager.sysDepartment.departmentId }&searchs=1'"><fmt:message key="operation.button.cancel"/></button>
			</c:if>
		</td>
	</tr>
	</table>
</form:form>

<script type="text/javascript">
function validatePassword(theForm){
	var isSub = true;
	if($id("userPassword").checked){
		isSub = validatePwd(theForm);
	}
	if($id("password2").checked){
		isSub = validatePwd2(theForm);
	}
	if(!isSub){
		return false;
	} 
	if(!$id("userPassword").checked && !$id("password2").checked){
		return false;
	}
	if(theForm.verifyCode.value==""){
		alert("<fmt:message key="login.verifyCode.null"/>");
		theForm.verifyCode.focus();
		return false;
	}
	return isSub;
}
function validatePwd(theForm){
	<c:if test="${empty param.modifyType}">
		if(theForm.oldPassword.value==""){
			alert("<fmt:message key="please.input.oldPassword"/>");
			theForm.oldPassword.focus();
			return false;
		}	
	</c:if>
	if(!isValidatePassword(theForm.newPassword.value)){
		alert("<fmt:message key="tips.password"/>");
		theForm.newPassword.focus();
		return false;
	}
	if(theForm.newPassword2.value==""){
		alert("<fmt:message key="please.reInput.newPassword"/>");
		theForm.newPassword2.focus();
		return false;
	}
	if(theForm.newPassword.value!=theForm.newPassword2.value){
		alert("<fmt:message key="error.password.not.accord"/>");
		theForm.newPassword.focus();
		return false;
	}
	<c:if test="${empty param.modifyType}">
	if(theForm.oldPassword.value==theForm.newPassword.value){
		alert("<fmt:message key='mi.newPwd.difrent.oldPwd' />!");
		theForm.newPassword.focus();
		return false;
	}
	</c:if>
	return true;
}
function validatePwd2(theForm){
	<c:if test="${empty param.modifyType}">
		if(theForm.oldPasswordTwo.value==""){
			alert("<fmt:message key="please.input.oldPassword"/>");
			theForm.oldPasswordTwo.focus();
			return false;
		}	
	</c:if>
	if(!isValidatePassword(theForm.newPasswordTwo.value)){
		alert("<fmt:message key="tips.password"/>");
		theForm.newPasswordTwo.focus();
		return false;
	}
	if(theForm.newPassword2Two.value==""){
		alert("<fmt:message key="please.reInput.newPassword"/>");
		theForm.newPassword2Two.focus();
		return false;
	}
	if(theForm.newPasswordTwo.value!=theForm.newPassword2Two.value){
		alert("<fmt:message key="error.password.not.accord"/>");
		theForm.newPasswordTwo.focus();
		return false;
	}
	<c:if test="${empty param.modifyType}">
	if(theForm.oldPasswordTwo.value==theForm.newPasswordTwo.value){
		alert("<fmt:message key='mi.newPwd.difrent.oldPwd' />!");
		theForm.newPassword.focus();
		return false;
	}
	</c:if>
	return true;
}
function $id(tagId){
	return document.getElementById(tagId);
}
</script>