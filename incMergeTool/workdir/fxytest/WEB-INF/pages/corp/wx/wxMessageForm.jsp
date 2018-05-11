<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxMessageDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxMessageDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxMessage" method="post" action="editWxMessage.jhtml" onsubmit="return validateForm(this)" id="wxMessageForm">
    
    <spring:bind path="wxMessage.*">
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
    		<th><fmt:message key="wxMessage.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxMessage.messageType"/>:</th>
    		<td><form:input path="messageType" id="messageType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.content"/>:</th>
    		<td><form:input path="content" id="content"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.picurl"/>:</th>
    		<td><form:input path="picurl" id="picurl"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.locationX"/>:</th>
    		<td><form:input path="locationX" id="locationX"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.locationY"/>:</th>
    		<td><form:input path="locationY" id="locationY"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.scale"/>:</th>
    		<td><form:input path="scale" id="scale"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.label"/>:</th>
    		<td><form:input path="label" id="label"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.localePrecision"/>:</th>
    		<td><form:input path="localePrecision" id="localePrecision"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.title"/>:</th>
    		<td><form:input path="title" id="title"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.description"/>:</th>
    		<td><form:input path="description" id="description"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.url"/>:</th>
    		<td><form:input path="url" id="url"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.event"/>:</th>
    		<td><form:input path="event" id="event"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.eventkey"/>:</th>
    		<td><form:input path="eventkey" id="eventkey"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.ticket"/>:</th>
    		<td><form:input path="ticket" id="ticket"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.mediaId"/>:</th>
    		<td><form:input path="mediaId" id="mediaId"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.thumbMediaid"/>:</th>
    		<td><form:input path="thumbMediaid" id="thumbMediaid"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.msgFormat"/>:</th>
    		<td><form:input path="msgFormat" id="msgFormat"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.recognition"/>:</th>
    		<td><form:input path="recognition" id="recognition"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.textMsgId"/>:</th>
    		<td><form:input path="textMsgId" id="textMsgId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxMessage.fromUserName"/>:</th>
    		<td><form:input path="fromUserName" id="fromUserName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.localUrl"/>:</th>
    		<td><form:input path="localUrl" id="localUrl"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.responseMsg"/>:</th>
    		<td><form:input path="responseMsg" id="responseMsg"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxMessage.addTime"/>:</th>
    		<td><form:input path="addTime" id="addTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="wxMessage.isCollection"/>:</th>
    		<td><form:input path="isCollection" id="isCollection"/></td>
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
    				<c:if test="${not empty wxMessage.messageId }">
    					<win:power powerCode="deleteWxMessage">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxMessage')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxMessages.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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