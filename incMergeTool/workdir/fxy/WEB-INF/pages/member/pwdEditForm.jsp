<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fucntion.menu.member.firstLogin"/>:<fmt:message key ="fucntion.menu.modifyPwd"/></title>
    <meta name="heading" content="<fmt:message key ="fucntion.menu.modifyPwd"/>"/>
</head>

<form:form commandName="miMember" method="post" action="editPwd.jhtml" onsubmit="return validateForm(this)" id="MemberTwoChooseProductForm">
<input type="hidden" name="sid" id="sid" value="${sid }"/>
	<spring:bind path="miMember.*">
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

<table class="detail">
	<tr>
		<td colspan="2" class="title">
			<span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
		</td>
	</tr>
	<tr>
		 <th class="required"><fmt:message key="mi.oldpwd"/>：</th>
		<td><input type="password" name="oldPassword" id="oldPassword" value="" class="form-control" required/></td>
	</tr>
	<tr>
		 <th class="required"><fmt:message key="sysUser.newPassword"/>：</th>
		<td><input type="password" name="newPassword1" id="newPassword1" value="" class="form-control" required/></td>
	</tr>
	<tr>
		 <th class="required"><fmt:message key="please.reInput.newPassword"/>：</th>
		<td><input type="password" name="newPassword2" id="newPassword2" value="" class="form-control" required/></td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="buttonBar">
				<input type="hidden" name="memberNo" value="${miMember.memberNo }"/>
				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
				<button type="submit" name="save" class="btn btn-primary btn-block" onclick="bCancel=false"><fmt:message key="button.next"/></button>    				
			</div>
		</td>
	</tr>
</table>
</form:form>
	   
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	 
	if (theForm.oldPassword.value == "" || theForm.oldPassword.value == null) {
		alert("<fmt:message key='please.input.oldPassword'/>");
		theForm.oldPassword.focus();
		return false;
	}
	 
	if (theForm.newPassword1.value == "" || theForm.newPassword1.value == null) {
		alert("<fmt:message key='please.input.newPassword'/>");
		theForm.newPassword1.focus();
		return false;
	}
	 
	if (theForm.newPassword2.value == "" || theForm.newPassword2.value == null) {
		alert("<fmt:message key='please.reInput.newPassword'/>");
		theForm.newPassword2.focus();
		return false;
	}
	
	if (theForm.newPassword1.value != theForm.newPassword2.value) {
		alert("<fmt:message key='error.password.not.accord'/>");
		theForm.newPassword1.focus();
		return false;
	}
	
	if (theForm.oldPassword.value == theForm.newPassword1.value) {
		alert("两次输入的密码不能相同。");
		theForm.newPassword1.focus();
		return false;
	}
	
	//其它验证
	showLoading();
	return true;
}

function loadJHTML() {
	
	confirm("<fmt:message key='mi.overload'/>");
	var sid = document.getElementById("sid").value;
	document.location = "memberOneChangePwd.jhtml";
}
 
</script>