<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMailQueueRcptDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysMailQueueRcptDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysMailQueueRcpt" method="post" action="editSysMailQueueRcpt.jhtml" onsubmit="return validateForm(this)" id="sysMailQueueRcptForm">
    
    <spring:bind path="sysMailQueueRcpt.*">
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
    		<th><fmt:message key="sysMailQueueRcpt.queueId"/>:</th>
    		<td><form:input path="queueId" id="queueId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueueRcpt.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueueRcpt.toUserCode"/>:</th>
    		<td><form:input path="toUserCode" id="toUserCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueueRcpt.toEmail"/>:</th>
    		<td><form:input path="toEmail" id="toEmail"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueueRcpt.toName"/>:</th>
    		<td><form:input path="toName" id="toName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueueRcpt.isSent"/>:</th>
    		<td><form:input path="isSent" id="isSent"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueueRcpt.sentDate"/>:</th>
    		<td><form:input path="sentDate" id="sentDate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueueRcpt.retryTimes"/>:</th>
    		<td><form:input path="retryTimes" id="retryTimes"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="rcptId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysMailQueueRcpt.rcptId }">
    					<win:power powerCode="deleteSysMailQueueRcpt">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysMailQueueRcpt')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysMailQueueRcpts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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