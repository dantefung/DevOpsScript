<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxNoticeMessageDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxNoticeMessageDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxNoticeMessage" method="post" action="editWxNoticeMessage.jhtml" onsubmit="return validateForm(this)" id="wxNoticeMessageForm">
    
    <spring:bind path="wxNoticeMessage.*">
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
    		<th class="required"><fmt:message key="wxNoticeMessage.wxOpenId"/>:</th>
    		<td><form:input path="wxOpenId" id="wxOpenId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxNoticeMessage.msgType"/>:</th>
    		<td><form:input path="msgType" id="msgType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxNoticeMessage.msgContent"/>:</th>
    		<td><form:input path="msgContent" id="msgContent"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.sendTime"/>:</th>
    		<td><form:input path="sendTime" id="sendTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxNoticeMessage.isSend"/>:</th>
    		<td><form:input path="isSend" id="isSend"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxNoticeMessage.retryTimes"/>:</th>
    		<td><form:input path="retryTimes" id="retryTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.returnMsgId"/>:</th>
    		<td><form:input path="returnMsgId" id="returnMsgId"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.receiveResult"/>:</th>
    		<td><form:input path="receiveResult" id="receiveResult"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="msgId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty wxNoticeMessage.msgId }">
    					<win:power powerCode="deleteWxNoticeMessage">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxNoticeMessage')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxNoticeMessages.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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