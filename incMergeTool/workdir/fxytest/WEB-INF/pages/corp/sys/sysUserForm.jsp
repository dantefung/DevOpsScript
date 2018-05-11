<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysUserDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysUser" method="post" action="editSysUser.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">
    
    <spring:bind path="sysUser.*">
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
    	<tr>
    		<th class="required"><fmt:message key="sysUser.userName"/>:</th>
    		<td><form:input path="userName" id="userName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.password"/>:</th>
    		<td><form:input path="password" id="password"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.advPassword"/>:</th>
    		<td><form:input path="advPassword" id="advPassword"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.state"/>:</th>
    		<td><form:input path="state" id="state"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.userType"/>:</th>
    		<td><form:input path="userType" id="userType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.defLang"/>:</th>
    		<td><form:input path="defLang" id="defLang"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.ipCheck"/>:</th>
    		<td><form:input path="ipCheck" id="ipCheck"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.secCode"/>:</th>
    		<td><form:input path="secCode" id="secCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.loginTimes"/>:</th>
    		<td><form:input path="loginTimes" id="loginTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.lastLoginTime"/>:</th>
    		<td><form:input path="lastLoginTime" id="lastLoginTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysUser.currentLoginTime"/>:</th>
    		<td><form:input path="currentLoginTime" id="currentLoginTime"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="userCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysUser.userCode }">
    					<win:power powerCode="deleteSysUser">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysUser')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysUsers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>