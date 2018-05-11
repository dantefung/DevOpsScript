<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysApiUserDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysApiUserDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysApiUser" method="post" action="editSysApiUser.jhtml" onsubmit="return validateForm(this)" id="sysApiUserForm">
    
    <spring:bind path="sysApiUser.*">
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
    		<th class="required"><fmt:message key="sysApiUser.apiUserCode"/>:</th>
    		<td><form:input path="apiUserCode" id="apiUserCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysApiUser.apiKey"/>:</th>
    		<td><form:input path="apiKey" id="apiKey"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysApiUser.isActive"/>:</th>
    		<td><form:input path="isActive" id="isActive"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysApiUser.id }">
    					<win:power powerCode="deleteSysApiUser">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysApiUser')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysApiUsers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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