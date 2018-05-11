<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysOperationLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysOperationLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysOperationLog" method="post" action="editSysOperationLog.jhtml" onsubmit="return validateForm(this)" id="sysOperationLogForm">
    
    <spring:bind path="sysOperationLog.*">
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
    		<th><fmt:message key="sysOperationLog.operaterCode"/>:</th>
    		<td><form:input path="operaterCode" id="operaterCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.operaterName"/>:</th>
    		<td><form:input path="operaterName" id="operaterName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.ipAddr"/>:</th>
    		<td><form:input path="ipAddr" id="ipAddr"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.operateTime"/>:</th>
    		<td><form:input path="operateTime" id="operateTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.visitUrl"/>:</th>
    		<td><form:input path="visitUrl" id="visitUrl"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.operateData"/>:</th>
    		<td><form:input path="operateData" id="operateData"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.moduleName"/>:</th>
    		<td><form:input path="moduleName" id="moduleName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.doType"/>:</th>
    		<td><form:input path="doType" id="doType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.userType"/>:</th>
    		<td><form:input path="userType" id="userType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.doResult"/>:</th>
    		<td><form:input path="doResult" id="doResult"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysOperationLog.userName"/>:</th>
    		<td><form:input path="userName" id="userName"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="operationLogId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysOperationLog.operationLogId }">
    					<win:power powerCode="deleteSysOperationLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysOperationLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysOperationLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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