<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxUserDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxUser" method="post" action="editWxUser.jhtml" onsubmit="return validateForm(this)" id="wxUserForm">
    
    <spring:bind path="wxUser.*">
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
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.sponsorWxOpenid"/>:</th>
    		<td><form:input path="sponsorWxOpenid" id="sponsorWxOpenid"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.wxUserCode"/>:</th>
    		<td><form:input path="wxUserCode" id="wxUserCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxUser.nickName"/>:</th>
    		<td><form:input path="nickName" id="nickName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.signature"/>:</th>
    		<td><form:input path="signature" id="signature"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.country"/>:</th>
    		<td><form:input path="country" id="country"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.province"/>:</th>
    		<td><form:input path="province" id="province"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.city"/>:</th>
    		<td><form:input path="city" id="city"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxUser.sex"/>:</th>
    		<td><form:input path="sex" id="sex"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.avatar"/>:</th>
    		<td><form:input path="avatar" id="avatar"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.avatarRemote"/>:</th>
    		<td><form:input path="avatarRemote" id="avatarRemote"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.isAuth"/>:</th>
    		<td><form:input path="isAuth" id="isAuth"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.isUnfollow"/>:</th>
    		<td><form:input path="isUnfollow" id="isUnfollow"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.authExpireTime"/>:</th>
    		<td><form:input path="authExpireTime" id="authExpireTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxUser.isService"/>:</th>
    		<td><form:input path="isService" id="isService"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceType"/>:</th>
    		<td><form:input path="serviceType" id="serviceType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceName"/>:</th>
    		<td><form:input path="serviceName" id="serviceName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.serviceNo"/>:</th>
    		<td><form:input path="serviceNo" id="serviceNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastServiceTime"/>:</th>
    		<td><form:input path="lastServiceTime" id="lastServiceTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastGetinfoTime"/>:</th>
    		<td><form:input path="lastGetinfoTime" id="lastGetinfoTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.markName"/>:</th>
    		<td><form:input path="markName" id="markName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxUser.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastVisitTime"/>:</th>
    		<td><form:input path="lastVisitTime" id="lastVisitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxUser.lastAlertTime"/>:</th>
    		<td><form:input path="lastAlertTime" id="lastAlertTime"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wxOpenid"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty wxUser.wxOpenid }">
    					<win:power powerCode="deleteWxUser">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxUser')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxUsers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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