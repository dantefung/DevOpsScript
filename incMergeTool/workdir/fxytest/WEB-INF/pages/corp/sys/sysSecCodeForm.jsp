<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSecCodeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSecCodeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysSecCode" method="post" action="editSysSecCode.jhtml" onsubmit="return validateForm(this)" id="sysSecCodeForm">
    
    <spring:bind path="sysSecCode.*">
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
    		<th class="required"><fmt:message key="sysSecCode.secType"/>:</th>
    		<td><form:input path="secType" id="secType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSecCode.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSecCode.mobile"/>:</th>
    		<td><form:input path="mobile" id="mobile"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSecCode.secCode"/>:</th>
    		<td><form:input path="secCode" id="secCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSecCode.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSecCode.expireTime"/>:</th>
    		<td><form:input path="expireTime" id="expireTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSecCode.clientIp"/>:</th>
    		<td><form:input path="clientIp" id="clientIp"/></td>
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
    				<c:if test="${not empty sysSecCode.id }">
    					<win:power powerCode="deleteSysSecCode">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysSecCode')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysSecCodes.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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