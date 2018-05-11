<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icMessage" method="post" action="editIcMessage.jhtml" onsubmit="return validateForm(this)" id="icMessageForm">
    
    <spring:bind path="icMessage.*">
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
    		<th class="required"><fmt:message key="icMessage.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.senderCode"/>:</th>
    		<td><form:input path="senderCode" id="senderCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.rcptType"/>:</th>
    		<td><form:input path="rcptType" id="rcptType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.title"/>:</th>
    		<td><form:input path="title" id="title"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.content"/>:</th>
    		<td><form:input path="content" id="content"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.sendTime"/>:</th>
    		<td><form:input path="sendTime" id="sendTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessage.replyId"/>:</th>
    		<td><form:input path="replyId" id="replyId"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="messageId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty icMessage.messageId }">
    					<win:power powerCode="deleteIcMessage">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'IcMessage')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='icMessages.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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