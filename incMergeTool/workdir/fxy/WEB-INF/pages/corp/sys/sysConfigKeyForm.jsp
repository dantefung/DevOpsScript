<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysConfigKeyDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.paraManage"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysConfigKey" method="post" action="editSysConfigKey.jhtml" onsubmit="return validateForm(this)" id="sysConfigKeyForm">
    
    <spring:bind path="sysConfigKey.*">
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
    		<th class="required"><fmt:message key="sysConfigKey.configCode"/>:</th>
    		<td><form:input path="configCode" id="configCode" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysConfigKey.keyDesc"/>:</th>
    		<td><form:input path="keyDesc" id="keyDesc" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysConfigKey.defaultValue"/>:</th>
    		<td><form:input path="defaultValue" id="defaultValue" size="60"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="keyId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysConfigKey.keyId }">
    					<win:power powerCode="deleteSysConfigKey">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysConfigKey')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysConfigKeys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(theForm.configCode.value==""){
		alert("<fmt:message key="sysConfigKey.configCode.required"/>");
		theForm.configCode.focus();
		return false;
	}else if(theForm.defaultValue.value==""){
		alert("<fmt:message key="sysConfigKey.defaultValue.required"/>");
		theForm.defaultValue.focus();
		return false;
	}
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>