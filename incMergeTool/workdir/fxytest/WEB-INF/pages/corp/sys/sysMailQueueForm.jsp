<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMailQueueDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysMailQueueDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysMailQueue" method="post" action="editSysMailQueue.jhtml" onsubmit="return validateForm(this)" id="sysMailQueueForm">
    
    <spring:bind path="sysMailQueue.*">
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
    		<th class="required"><fmt:message key="sysMailQueue.mailTypeId"/>:</th>
    		<td><form:input path="mailTypeId" id="mailTypeId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.fromEmail"/>:</th>
    		<td><form:input path="fromEmail" id="fromEmail"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.fromName"/>:</th>
    		<td><form:input path="fromName" id="fromName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.ccEmail"/>:</th>
    		<td><form:input path="ccEmail" id="ccEmail"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.bccEmail"/>:</th>
    		<td><form:input path="bccEmail" id="bccEmail"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.mailTitle"/>:</th>
    		<td><form:input path="mailTitle" id="mailTitle"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.creatorCode"/>:</th>
    		<td><form:input path="creatorCode" id="creatorCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.creatorName"/>:</th>
    		<td><form:input path="creatorName" id="creatorName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.textContent"/>:</th>
    		<td><form:input path="textContent" id="textContent"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.htmlContent"/>:</th>
    		<td><form:input path="htmlContent" id="htmlContent"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="queueId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysMailQueue.queueId }">
    					<win:power powerCode="deleteSysMailQueue">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysMailQueue')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysMailQueues.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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