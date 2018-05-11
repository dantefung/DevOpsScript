<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="operation.button.login"/></title>
    <meta name="heading" content="<fmt:message key="operation.button.login"/>"/>
    
    <script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/select2.min.js"></script>
   	<script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
	<!-- Loading Bootstrap -->
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/corp-login.css" />
</head>

<div class="container">
	<form:form commandName="sysUser" method="post" action="" id="loginForm" cssClass="form-signin">
		<h2><fmt:message key="member.background.system.name"/></h2>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
	  				<div class="col-md-12">
	  					<spring:bind path="sysUser.*">
		  					<c:if test="${empty status.errorMessages}">
								<div class="alert alert-warning" role="alert"><fmt:message key="info.please.input.usercode.and.pwd"/></div>
							</c:if>
							<c:remove var="successMessages" scope="session" />
							<c:if test="${not empty status.errorMessages}">
				        		<div id="errorMsg" class="alert alert-danger alert-dismissible fade in error">
					                <c:forEach var="error" items="${status.errorMessages}">
					                   ${error}
					                </c:forEach>
							    </div>
						    </c:if>
					    </spring:bind>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon glyphicon glyphicon-user"  aria-hidden="true"></span>
								<input type="text" name="userCode" id="userCode" class="form-control" placeholder="<fmt:message key="bdOutwardBank.accountCode"/>" required autofocus/>
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon glyphicon glyphicon-lock"  aria-hidden="true"></span>
								<input type="password" name="password" id="password" class="form-control" placeholder="<fmt:message key="sysUser.password"/>" required/>
							</div>
						</div>
						
						<div class="row">
					        <div class="col-md-12">
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon glyphicon glyphicon-font"  aria-hidden="true"></span>
										<input type="text" name="captchaCode" id="captchaCode" class="form-control" placeholder="<fmt:message key="login.verifyCode"/>" required/>
										<span class="input-group-addon">
											<a href="javascript:refreshCaptchaImage('captchaImg');">
												<img id="captchaImg" src="${ctx}/captcha.jhtml?rnd=<%=Math.random() * 1000000%>" width="60" height="18" border="0"/>
											</a>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
					        <div class="col-md-12">
								<div class="form-group">
									<div class="input-group">
										<select id="theSelect" onchange="switchLanguage(this)">
											<c:forEach items="${alLangCodeList}" var="alLangCodeVar">
												<c:if test="${alLangCodeVar.langCode==sessionScope.sessionLoginUser.locale }">
													<option value="${alLangCodeVar.langCode}" checked>
															${alLangCodeVar.langName }
													</option>
												</c:if>
											</c:forEach>

											<c:forEach items="${alLangCodeList}" var="alLangCodeVar">
												<c:if test="${alLangCodeVar.langCode!=sessionScope.sessionLoginUser.locale }">
													<option value="${alLangCodeVar.langCode}">${alLangCodeVar.langName }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
						</div>

						<button class="btn btn-lg btn-primary btn-block login-btn" type="submit"><fmt:message key="me.login"/></button>
	  				</div>
	  			</div>
			</div>
		  
		</div>
	</form:form>
	<p></p>
	<p class="text-center" style="color: #fff;"><fmt:message key="login.page.footer.tips"/></p></p>
</div>

<script type="text/javascript">
function switchLanguage(o){
	var langCode = $(o).val();
	window.location.href = '${ctx}/corp/login.jhtml?selLangCode='+langCode;
}
function validateForm(theForm) {
	//其它验证
	if(theForm.userCode.value==""){
		alert("<fmt:message key="sysUser.userCode.required"/>");
		theForm.userCode.focus();
		return false;
	}
	if(theForm.password.value==""){
		alert("<fmt:message key="sysUser.password.required"/>");
		theForm.password.focus();
		return false;
	}
	if(theForm.captchaCode.value==""){
		alert("<fmt:message key="login.verifyCode.null"/>");
		theForm.captchaCode.focus();
		return false;
	} 
	//其它验证
	showLoading();
	return true;
}
</script>