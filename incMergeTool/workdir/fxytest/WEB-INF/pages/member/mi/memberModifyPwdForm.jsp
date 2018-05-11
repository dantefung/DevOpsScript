<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.updatememberpwd"/></title>
    <meta name="heading" content="<fmt:message key="mi.updatememberpwd"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form method="post" action="memberModifyPwd.jhtml" onsubmit="return validateForm(this)" id="miMemberForm">
    <input type="hidden" name="sid" id="sid" value="${sid }"/>
    <spring:bind path="miMember.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="alert alert-danger alert-dismissible fade in error">
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
    		<th><fmt:message key="mi.choosetype"/>：</th>
    		<td>
					<label for="pwdType1">
				  		<input type="radio" name="pwdType" id="pwdType1" value="1" checked="checked"/>
				  		<fmt:message key="mi.first.pwd"/>
					</label>
    				<label for="pwdType2">
    					<input type="radio" name="pwdType" id="pwdType2" value="2" />
    					<fmt:message key="mi.second.pwd"/>
    				</label>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.oldpwd"/>：</th>
    		<td><input type="password" class="form-control input-sm" name="oldPassword" id="oldPassword" value=""/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.newPassword"/>：</th>
    		<td><input type="password" class="form-control input-sm" name="newPassword1" id="newPassword1" value=""/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="please.reInput.newPassword"/>：</th>
    		<td><input type="password" class="form-control input-sm" name="newPassword2" id="newPassword2" value=""/></td>
    	</tr>
    	<tr>
    		<th></th>
    		<td>
    			<input type="hidden" name="memberNo" value="${miMember.memberNo }"/>
    			<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    			<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>    				
    		</td>
    	</tr>
    </table>
    </form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	var oldPassword = theForm.oldPassword.value;
	if (oldPassword == "" || oldPassword == null) {
		alert("<fmt:message key='please.input.oldPassword'/>");
		theForm.oldPassword.focus();
		return false;
	}
	
	var newPassword1 = theForm.newPassword1.value;
	if (newPassword1 == "" || newPassword1 == null) {
		alert("<fmt:message key='please.input.newPassword'/>");
		theForm.newPassword1.focus();
		return false;
	}
	
	var newPassword2 = theForm.newPassword2.value;
	if (newPassword2 == "" || newPassword2 == null) {
		alert("<fmt:message key='mi.inputnewpew'/>");
		theForm.newPassword2.focus();
		return false;
	}
	
	if (newPassword1 != newPassword2) {
		alert("<fmt:message key='error.password.not.accord'/>");
		theForm.newPassword1.focus();
		return false;
	}
	
	if(!confirm("<fmt:message key='mi.sure.updatepwd'/>")){
		return false;
	}

	//其它验证
	showLoading();
	return true;
}

function loadJHTML() {
	
	confirm("<fmt:message key='mi.overload'/>");
	var sid = document.getElementById("sid").value;
	document.location = "memberModifyPwd.jhtml";
}
// 5分钟后自动跳转到二级密码输入界面
setTimeout(loadJHTML, 1000*60*1);

</script>