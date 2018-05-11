<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsQueueRcptDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysSmsQueueRcptDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysSmsQueueRcpt" method="post" action="editSysSmsQueueRcpt.jhtml" onsubmit="return validateForm(this)" id="sysSmsQueueRcptForm">
    
    <spring:bind path="sysSmsQueueRcpt.*">
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
    		<th><fmt:message key="sysSmsQueueRcpt.queueId"/>:</th>
    		<td><form:input path="queueId" id="queueId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSmsQueueRcpt.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSmsQueueRcpt.toUserCode"/>:</th>
    		<td><form:input path="toUserCode" id="toUserCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSmsQueueRcpt.toName"/>:</th>
    		<td><form:input path="toName" id="toName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSmsQueueRcpt.toMobile"/>:</th>
    		<td><form:input path="toMobile" id="toMobile"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSmsQueueRcpt.isSent"/>:</th>
    		<td><form:input path="isSent" id="isSent"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysSmsQueueRcpt.sentDate"/>:</th>
    		<td><form:input path="sentDate" id="sentDate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysSmsQueueRcpt.retryTimes"/>:</th>
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
    				<c:if test="${not empty sysSmsQueueRcpt.rcptId }">
    					<win:power powerCode="deleteSysSmsQueueRcpt">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysSmsQueueRcpt')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysSmsQueueRcpts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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