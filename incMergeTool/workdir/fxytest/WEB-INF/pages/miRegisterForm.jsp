<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="register.us.legend.member.register"/></title>
    <meta name="heading" content="<fmt:message key="register.us.legend.member.register"/>"/>
    <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/member-login.css" />
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/SysIdAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery-entropizer.min.css" />
<script type="text/javascript" src="${ctx}/scripts/entropizer.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery-entropizer.min.js"></script>

<style>
.register .panel .panel-heading {
	background-image:none;
	background-color: #c9151e;
	color: #fff;
	font-weight: bold;
	font-size: 16px;
	text-align: center;
}
#meter2 .entropizer-track {
    background-color: #e8e8e8;
    border-radius: 2px;
    height: 4px;
}
#meter2 .entropizer-bar {
    height: 4px;
}
</style>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
		
			<form:form commandName="miMember" method="post" action="register.jhtml" id="registerForm" name="registerForm" onsubmit="return validateForm(this);" enctype="multipart/form-data" cssClass="form-signin">
				<div class="panel panel-default login-panel">
					<div class="panel-body">
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
						<table class="detail" width="100%">
							<tr>
								<th></th>
								<td>
									<span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
								</td>
							</tr>
							<tr>
								<th><fmt:message key="miMember.memberNo"/>：</th>
								<td>
									<span id="memberNoLabel">${miMember.memberNo }</span>
					    			<form:hidden path="memberNo" id="memberNo"/>
					    			<%-- <button type="button" name="refresh" class="btn btn-info btn-xs" onclick="javascript:changeMemberNo();"><fmt:message key="mi.exchange"/></button> --%>
								</td>
							</tr>
							<tr>
								<th class="required"><fmt:message key="mi.recommendNo"/>：</th>
								<td>
									<form:input path="recommendNo" cssClass="form-control"/>
								</td>
							</tr>
							<tr>
								<th class="required"><fmt:message key="mi.lable.linkNo"/>：</th>
								<td><form:input path="linkNo" id="linkNo" cssClass="form-control"/></td>
							</tr>
							<tr>
								<th class="required"><fmt:message key="miMember.delivery.moblie"/>：</th>
								<td><form:input path="mobile" cssClass="form-control"/></td>
							</tr>
							<tr>
								<th class="required"><fmt:message key="mi.register.petName"/>：</th>
								<td><form:input path="petName" cssClass="form-control"/></td>
							</tr>
			
							<tr>
					    		<th class="required"><fmt:message key="mi.realname"/>:</th>
					    		<td><form:input path="lastName" id="lastName" cssClass="form-control"/></td>
					    	</tr>
							<tr>
					    		<th class="required"><fmt:message key="miMember.certificateType"/>:</th>
					    		<td>
					    			<win:list name="idType" listCode="member.cardtype" defaultValue="" value="${miMember.idType }" styleClass="form-control"/>
					    		</td>
					    	</tr>
					    	
					    	<tr>
					    		<th class="required"><fmt:message key="miMember.cardNo"/>:</th>
					    		<td>
					    			<form:input path="idNo" id="idNo" maxlength="18" cssClass="form-control"/>
					    		</td>
					    	</tr>
							<tr>
								<th class="required" valign="top"><fmt:message key="sysUser.password"/>：</th>
								<td>
									<input type="password" class="form-control" name="password" id="password" placeholder="<fmt:message key="sysUser.password"/>"/>
									<div id="meter2"></div>
								</td>
							</tr>
							<tr>
								<th class="required"><fmt:message key="sysUser.repeatPassword"/>：</th>
								<td>
									<input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="<fmt:message key="sysUser.repeatPassword"/>"/>
								</td>
							</tr>
							<tr>
								<th></th>
								<td><fmt:message key="notice.password1.same.password2"/></td>
							</tr>
							<tr>
								<th></th>
								<td>
									<input type="hidden" name="redirectUrl" value="${param.redirectUrl}"/>
									<form:hidden path="cardType"/>
					  				<input type="submit" name="Submit" class="btn btn-warning col-md-6 col-xs-12" value="<fmt:message key="register.us.legend.member.register"/>"/>
								</td>
							</tr>
							<tr>
								<th></th>
								<td>
									<a class="ui-btn ui-shadow ui-corner-all" href="<c:url value="/member/login.jhtml?redirectUrl=${param.redirectUrl}"/>"><fmt:message key="info.use.exists.account.login"/></a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
			</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
$("#recommendNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(document).ready(function(){
	$('#meter2').entropizer({
	    target: '#password',
	    update: function(data, ui) {
	        ui.bar.css({
	            'background-color': data.color,
	            'width': data.percent + '%'
	        });
	    }
	});
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if (theForm.recommendNo.value=="") {
		alert("<fmt:message key="prompt.commandNo.null.require"/>.");
		theForm.recommendNo.focus();
		return false;
	}
	
	if (theForm.linkNo.value=="") {
		alert("<fmt:message key="mi.link.no.required"/>.");
		theForm.linkNo.focus();
		return false;
	}
	
	if (theForm.mobile.value == null || theForm.mobile.value == '') {
		alert("<fmt:message key='mi.telephone.null.requie'/>.");
		theForm.mobile.focus();
		return false;
	}
	
	if (theForm.petName.value == null || theForm.petName.value == '') {
		alert("<fmt:message key='mi.null.petname'/>.");
		theForm.petName.focus();
		return false;
	}
	
	if (theForm.lastName.value == null || theForm.lastName.value == '') {
		alert("<fmt:message key='mi.realName.null.requie'/>.");
		theForm.lastName.focus();
		return false;
	}
	
	if (theForm.idType.value == null || theForm.idType.value == '') {
		alert("<fmt:message key='mi.cardType.null.requie'/>.");
		theForm.idType.focus();
		return false;
	}
	
	if (theForm.idNo.value == null || theForm.idNo.value == '') {
		alert("<fmt:message key='mi.null.idcard'/>.");
		theForm.idNo.focus();
		return false;
	}

	if(theForm.password.value=="" || theForm.password.value.length<8){
		alert("<fmt:message key="tips.password"/>.");
		theForm.password.focus();
		return false;
	}
	if(theForm.rePassword.value==""){
		alert("<fmt:message key="sysUser.repeatPassword.required"/>. <fmt:message key="tips.password"/>");
		theForm.rePassword.focus();
		return false;
	}
	if(theForm.password.value!=theForm.rePassword.value){
		alert("<fmt:message key="prompt.pwd.inconformity"/>.");
		return false;
	}
	
	showLoading();
	return true;

}

function changeMemberNo() {
	//20141010根据国家来获取会员编号的规则
	SysIdAjax.getMemberNoForRegister(function(data) {
		document.getElementById("memberNoLabel").innerHTML = data;
		document.getElementById("memberNo").value = data;
	});
}
</script>