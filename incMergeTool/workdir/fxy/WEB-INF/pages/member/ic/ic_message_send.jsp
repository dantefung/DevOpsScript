<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="ic.send.message.title"/></title>
    <meta name="heading" content="<fmt:message key="iic.send.message.title"/>"/>
</head>

<%@ include file="/WEB-INF/pages/member/ic/ic_message_nav.jsp"%>

<div class="contentBody">
    <form:form commandName="icMessage" method="post" action="ic_message_send.jhtml" onsubmit="return validateForm(this)" id="icMessageForm">
    
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
    		<td colspan="2" class="title"><fmt:message key="ic.lable.message.receive"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="ic.reciveduser"/><fmt:message key="ic.reciveduser"/>:</th>
    		<td>
    			<form:radiobuttons path="rcptType" items="${userTypes }" delimiter="<br/>" onchange="selectUserType(this)"/>
    			<br/>
    			<fmt:message key="ic.prompt.receiverName"/>：
    			<br/><input type="text" name="rcpts" style="width:400px;" value="${param.rcpts }"<c:if test="${icMessage.rcptType!='M' }"> disabled="true"</c:if>/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="ic.lable.message.content"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="ic.lable.message.title"/>:</th>
    		<td><form:input path="title" id="title" cssStyle="width:400px;" htmlEscape="true"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="ic.lable.message.content"/><fmt:message key="ic.lable.message.content"/>:</th>
    		<td><form:textarea path="content" rows="12" cssStyle="width:400px;"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="messageId"/>
    				<input type="hidden" name="strAction" value="memberIcMessageSend"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="memberIcMessageSend">
    					<button type="submit" name="mail" onclick="bCancel=false"><fmt:message key="ic.lable.send.sure"/></button>
    				</win:power>
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
	if($("[name='rcptType']:checked").val()=="M" && theForm.rcpts.value==""){
	confirm("<fmt:message key='ic.rcpts.null.requie'/>");
	
		theForm.rcpts.focus();
		return false;
	}
	if(theForm.title.value==""){
	confirm("<fmt:message key='ic.message.title.null.requie'/>");
		
		theForm.title.focus();
		return false;
	}
	if(theForm.content.value==""){
	confirm("<fmt:message key='ic.message.content.null.requie'/>");
		theForm.content.focus();
		return false;
	}
	//
	showLoading();
	return true;
}
function selectUserType(obj){
	if(obj.value=="M"){
		obj.form.rcpts.disabled=false;
	}else{
		obj.form.rcpts.disabled=true;
	}
}
</script>