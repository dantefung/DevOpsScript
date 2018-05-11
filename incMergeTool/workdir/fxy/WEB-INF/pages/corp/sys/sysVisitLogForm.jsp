<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysVisitLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysVisitLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysVisitLog" method="post" action="editSysVisitLog.jhtml" onsubmit="return validateForm(this)" id="sysVisitLogForm">
    
    <spring:bind path="sysVisitLog.*">
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
    		<th class="required"><fmt:message key="sysVisitLog.moduleCode"/>:</th>
    		<td><form:input path="moduleCode" id="moduleCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysVisitLog.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysVisitLog.visitUrl"/>:</th>
    		<td><form:input path="visitUrl" id="visitUrl"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysVisitLog.visitTime"/>:</th>
    		<td><form:input path="visitTime" id="visitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysVisitLog.queryString"/>:</th>
    		<td><form:input path="queryString" id="queryString"/></td>
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
    				<c:if test="${not empty sysVisitLog.logId }">
    					<win:power powerCode="deleteSysVisitLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysVisitLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysVisitLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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