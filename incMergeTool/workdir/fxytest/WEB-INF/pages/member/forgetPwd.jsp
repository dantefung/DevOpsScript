<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.memberGetPwd"/></title>
    <meta name="heading" content="<fmt:message key="menu.memberGetPwd"/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/member-getpwd.css" />
</head>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<form:form commandName="sysUser" method="post" action="forgetPwd.jhtml" id="loginForm" cssClass="form-getpwd" onsubmit="return validateForm(this);">
				<div class=" clearfix">
					<div class="pull-left" style="padding-right: 20px;">
						<%--<img alt="" src="${ctx }/themes/default/images/member/logo.png">--%>
					</div>
					<div class="pull-left">
						<h3>
							<fmt:message key="webapp.name"/><hr style="margin-top: 9px; margin-bottom: 5px;"/>
							<small>TRADE INFO MANAGEMENT SYSTEM</small>
						</h3>
					</div>
				</div>
				<br/>
				<div class="panel panel-default">
					<div class="panel-heading"><fmt:message key="function.menu.resetPassword_1"/></div>
					<div class="panel-body">
						<c:if test="${not empty errors}">
							<div class="alert alert-danger error" role="alert">
				            	<ul>
				        			<c:forEach var="error" items="${errors}">
							            <li>${error}</li>
							        </c:forEach>
						        </ul>
						        <c:remove var="errors" scope="session" />
					        </div>
					    </c:if>
						<div class="form-group">
							<label for="pwdType"><fmt:message key="me.choosetype"/></label>
							<win:list name="pwdType" id="pwdType" listCode="mi.pwd.repeat.type.list" defaultValue="" value="${param.pwdType }" styleClass="form-control"/>
			            </div>
			            <div class="form-group">
							<input type="text" name="userCode" id="userCode" class="form-control" required placeholder="<fmt:message key="miMember.memberNo"/>" value="${param.userCode }"/>
							<input type="text" name="userName" id="userName" class="form-control" required placeholder="<fmt:message key="poOrder.memberName"/>" value="${param.userName }"/>
							<input type="text" name="mobile" id="mobile" class="form-control" required placeholder="<fmt:message key="miMember.delivery.moblie"/>" value="${param.mobile }"/>
							
							<div class="input-group">
								<input type="text" name="captchaCode" id="captchaCode" class="form-control" placeholder="<fmt:message key="login.verifyCode"/>" required/>
								<span class="input-group-addon input-sm">
									<a href="javascript:refreshCaptchaImage('captchaImg');">
										<img id="captchaImg" src="${ctx}/captcha.jhtml?rnd=<%=Math.random() * 1000000%>" width="60" height="18" border="0"/>
									</a>
								</span>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<a class="btn btn-default btn-block" href="<c:url value="/member/login.jhtml"/>">返回登录</a>
							</div>
			  				<div class="col-md-6">
			  					<button class="btn btn-success btn-block" type="submit"><fmt:message key="me.sendtomobile"/></button>
			  				</div>
			  			</div>
					</div>
				  
				</div>
			</form:form>
		</div>
	</div>
</div>


<script type="text/javascript">
function validateForm(theForm) {
	if(theForm.userCode.value==""){
		showSelfAlert("<fmt:message key='memberNo.required'/>.");
		theForm.userCode.focus();
		return false;
	}
	
	if(theForm.userName.value==""){
		showSelfAlert("请输入会员姓名.");
		theForm.userName.focus();
		return false;
	}
	
	if(theForm.mobile.value==""){
		showSelfAlert("请输入手机号码.");
		theForm.mobile.focus();
		return false;
	}
	
	if(theForm.captchaCode.value==""){
		showSelfAlert("<fmt:message key='me.inputyzm'/>.");
		theForm.password.focus();
		return false;
	}
	
	//其它验证
	showLoading();
	return true;
}
</script>