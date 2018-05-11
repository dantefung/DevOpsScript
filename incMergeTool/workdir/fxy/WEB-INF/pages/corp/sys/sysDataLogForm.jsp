<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysDataLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysDataLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysDataLog" method="post" action="editSysDataLog.jhtml" onsubmit="return validateForm(this)" id="sysDataLogForm">
    
    <spring:bind path="sysDataLog.*">
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
    		<th><fmt:message key="sysDataLog.operationLogId"/>:</th>
    		<td><form:input path="operationLogId" id="operationLogId"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.changeType"/>:</th>
    		<td><form:input path="changeType" id="changeType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.tableName"/>:</th>
    		<td><form:input path="tableName" id="tableName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.columnName"/>:</th>
    		<td><form:input path="columnName" id="columnName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.pidName"/>:</th>
    		<td><form:input path="pidName" id="pidName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.pidValue"/>:</th>
    		<td><form:input path="pidValue" id="pidValue"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.beforeChange"/>:</th>
    		<td><form:input path="beforeChange" id="beforeChange"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.afterChange"/>:</th>
    		<td><form:input path="afterChange" id="afterChange"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.operatorPerson"/>:</th>
    		<td><form:input path="operatorPerson" id="operatorPerson"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.operatorTime"/>:</th>
    		<td><form:input path="operatorTime" id="operatorTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.moduleName"/>:</th>
    		<td><form:input path="moduleName" id="moduleName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.hostName"/>:</th>
    		<td><form:input path="hostName" id="hostName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.ipAddress"/>:</th>
    		<td><form:input path="ipAddress" id="ipAddress"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDataLog.personType"/>:</th>
    		<td><form:input path="personType" id="personType"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysDataLog.logId }">
    					<win:power powerCode="deleteSysDataLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysDataLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysDataLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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