<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.checkmembersecondpwd"/></title>
    <meta name="heading" content="<fmt:message key="mi.checkmembersecondpwd"/>"/>
</head>

<form method="post" action="verifyMemberAdvPwd.jhtml" id="verifyAdvPwdForm" name="memberVerifyAdvPwdForm" onsubmit="verifyAdvPwd(this);">
	<div class="row">
		<div class="col-md-4">
			<div class="form-group">
				<label for="advPassword" class="required"><fmt:message key="member.inputpwd"/>:</label>
				<div class="input-group">
					<input type="password" class="form-control" name="advPassword" id="advPassword" oncopy="return false" onpaste="return false" onselectstart="return false"/>
					<span class="input-group-btn">
						<button type="submit" class="btn btn-success" name="submit" id="submitBtn">
							<i class="fa fa-check" aria-hidden="true"></i>
							<fmt:message key="button.submit"/>
						</button>
  						<input type="hidden" value="${sid}" name="sid" id="sid"/>
					</span>
				</div>
			</div>

		</div>
	</div>
</form>

<script type="text/javascript">
function verifyAdvPwd(theForm) {
	
	var advPassword = theForm.advPassword.value;
	if (advPassword == null || advPassword == '') {
		alert("<fmt:message key='member.inputsecondpwd'/>.");
		theForm.advPassword.focus();
		return false;
	}	
	
	return true;
}
</script>