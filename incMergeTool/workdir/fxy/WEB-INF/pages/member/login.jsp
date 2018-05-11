<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="operation.button.login"/></title>
    <meta name="heading" content="<fmt:message key="operation.button.login"/>"/>
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/member-login.css" />
</head>

<script type="text/javascript" src="${ctx }/scripts/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx }/scripts/jquery-bgstretcher-3.3.0.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bgstretcher.css" />

<c:remove var="errors" scope="session" />

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div style="padding: 20px 50px">
			<img alt="" src="<%--${ctx }/themes/default/images/member/logo.png--%>" height="50">
		</div>
	</div>
</nav>
<div class="container" style="padding-top: 10%;">
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<form:form commandName="sysUser" method="post" action="" id="loginForm" cssClass="form-signin">
				<div class="panel panel-default login-panel">
					<div class="panel-body" style="padding: 10px 20px;">
						<%@ include file="/common/messages.jsp" %>
				
						<div class="alert bg-info title-tips" role="alert"><fmt:message key="info.please.input.usercode.and.pwd"/></div>

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
						<button class="btn btn-success btn-block" type="submit"><fmt:message key="me.login"/></button>
						<br/>
				      	<div class="row">
				      		<div class="col-xs-6 col-md-6">
					      		<a href="forgetPwd.jhtml"><fmt:message key="me.forgetpwd"/>?</a>
				      		</div>
				      		<div class="col-xs-6 col-md-6 text-right">
				      			<%-- <a href="<c:url value="/register.jhtml"/>"><fmt:message key="register.us.legend.member.register"/></a> --%>
				      		</div>
				      		<div class="col-xs-6 col-md-6 text-right">
								<select id="theSelect" onchange="switchLanguage(this)">
									<c:forEach items="${alLangCodes}" var="alLangCodeVar">
										<c:if test="${alLangCodeVar.langCode==sessionScope.sessionLoginUser.locale }">
											<option value="${alLangCodeVar.langCode}" checked>
													${alLangCodeVar.langName }
											</option>
										</c:if>
									</c:forEach>

									<c:forEach items="${alLangCodes}" var="alLangCodeVar">
										<c:if test="${alLangCodeVar.langCode!=sessionScope.sessionLoginUser.locale }">
											<option value="${alLangCodeVar.langCode}">${alLangCodeVar.langName }</option>
										</c:if>
									</c:forEach>
								</select>
				      		</div>
				      	</div>
		      		
					</div>
				  
				</div>
			</form:form>
	
		</div>
	</div>
</div>

<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container">
		<%@ include file="/common/front/footer.jsp"%>
  	</div>
</nav>

<script type="text/javascript">
function showResponse(responseText, statusText, xhr, $form)  { 
	if(statusText=="success"){
		var redirectUrl=$.cookie("redirectUrl");
		if(responseText=="ok"){
			if(redirectUrl=="" || redirectUrl==undefined){
				window.location="index.jhtml";
			}else{
				$.cookie("redirectUrl", "", { expires: -1 });
				window.location=redirectUrl;
			}
		}else if(responseText=="needChangePwd"){
			if(redirectUrl=="" || redirectUrl==undefined){
				window.location="editPwd.jhtml";
			}else{
				$.cookie("redirectUrl", "", { expires: -1 });
				window.location=redirectUrl;
			}
		}else{
			hideLoading();
			showSelfAlert(responseText);
			refreshCaptchaImage("captchaImg");
		}
	}else{
		hideLoading();
		showSelfAlert("<fmt:message key="mi.error.retry "/>");
		refreshCaptchaImage("captchaImg");
	}
}
	
function validateForm(formData, jqForm, options) {
	//其它验证
	if(jqForm[0].userCode.value==""){
		showSelfAlert("<fmt:message key="sysUser.userCode.required"/>");
		jqForm[0].userCode.focus();
		return false;
	}
	if(jqForm[0].password.value==""){
		showSelfAlert("<fmt:message key="sysUser.password.required"/>");
		jqForm[0].password.focus();
		return false;
	}
	if(jqForm[0].captchaCode.value==""){
		showSelfAlert("<fmt:message key="login.verifyCode.null"/>");
		jqForm[0].captchaCode.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}

function switchLanguage(o){
    var langCode = $(o).val();
    window.location.href = '${ctx}/member/login.jhtml?selLangCode='+langCode;
}

$(document).ready(function(){
    var options = {
            beforeSubmit:  validateForm,
            success:       showResponse
        }; 
	$('#loginForm').ajaxForm(options); 
	
	$("body").bgStretcher({
        images: ["${ctx}/themes/default/images/member/login/login-bg-01.jpg", "${ctx}/themes/default/images/member/login/login-bg-02.jpg"],
        imageWidth: 1920,
        imageHeight: 931,
        nextSlideDelay:5000,
        slideShow: true/* ,
        slideShowSpeed: "slow",
        transitionEffect:"simpleSlide",
        slideDirection:"W",
        sequenceMode:"back" */
    })
})
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}

$("#userCode").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 
</script>