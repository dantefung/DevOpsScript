<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>


<head>
    <title><fmt:message key="ic.message.view.title"/></title>
    <meta name="heading" content="<fmt:message key="ic.message.view.title"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<%@ include file="/WEB-INF/pages/member/ic/ic_message_nav.jsp"%>

<div class="contentBody">
	<form method="post" action="view_ic_message.jhtml" onsubmit="return validateDeleteMessage(this)" id="icMessageDeleteForm">
		<table class="detail" width="100%">
			<tr>
	    		<td><b>${oldIcMessage.title }</b></td>
	    	</tr>
	    	<tr>
	    		<td><fmt:message key="amEmail.user_name"/>：${oldIcMessage.senderCode }</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<fmt:message key="sysMailQueue.toName"/>：
	    			<c:if test="${oldIcMessage.rcptType=='C' }"><fmt:message key="user_type.C"/></c:if>
	    			<c:if test="${oldIcMessage.rcptType=='M' }">
	    				<c:set var="loopCount" value="0"/>
	    				<c:forEach items="${oldIcMessage.icMessageRcpts}" var="icMessageRcptVar">
	    					<c:if test="${loopCount>0 }">,</c:if>
							${icMessageRcptVar.rcptCode }
							<c:set var="loopCount" value="${loopCount+1 }"/>
						</c:forEach>
	    			</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td style="line-height: 200%;">${fn:replace(oldIcMessage.content, vEnter, '<br>')}</td>
	    	</tr>
	    	<c:if test="${oldIcMessage.senderCode!=sessionScope.sessionLoginUser.userCode && empty icMessageTrash}">
		    	<tr>
		    		<td>
		    			<div class="buttonBar">
		    				<input type="hidden" name="messageId" value="${oldIcMessage.messageId }"/>
		    				<input type="hidden" name="strAction" value="memberDeleteIcMessage"/>
		    				<win:power powerCode="memberDeleteIcMessage">
		    					<button type="submit" name="delete"><fmt:message key="ic.lable.message.delete"/></button>
		    				</win:power>
		                </div>
		    		</td>
		    	</tr>
	    	</c:if>
	    </table>
    </form>
    
    <c:if test="${oldIcMessage.senderCode!=sessionScope.sessionLoginUser.userCode && empty icMessageTrash }">
	    <hr/>
	    
	    <form method="post" action="view_ic_message.jhtml" onsubmit="return validateForm(this)" id="icMessageForm">
	    
	    <c:if test="${not empty status.errorMessages}">
		<div class="error">
	        <ul>
	            <c:forEach var="error" items="${status.errorMessages}">
	                <li>${error}</li>
	            </c:forEach>
	        </ul>
	    </div>
	    </c:if>
	    <table class="detail" width="100%">
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="menu.am.replyAmMessage"/></td>
	    	</tr>
	    	<c:if test="${empty replyMessage}">
		    	<tr>
		    		<td colspan="2"><span class="form-tips"><fmt:message key="item.in.bold.required"/></span></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="sysMailQueue.toName"/>:</th>
		    		<td>${oldIcMessage.senderCode }</td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="ic.lable.message.title"/>:</th>
		    		<td><input name="title" id="title" style="width:500px;" value="${icMessage.title}"/></td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="ic.lable.message.content"/>:</th>
		    		<td><textarea name="content" rows="12" style="width:500px;">${icMessage.content}</textarea></td>
		    	</tr>
		    	<tr>
		    		<td colspan="2">
		    			<div class="buttonBar">
		    				<input type="hidden" name="messageId" value="${oldIcMessage.messageId }"/>
		    				<input type="hidden" name="strAction" value="memberIcMessageReply"/>
		    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
		    				<win:power powerCode="memberIcMessageReply">
		    					<button type="submit" name="mail" onclick="bCancel=false"><fmt:message key="ic.lable.reply.sure"/></button>
		    				</win:power>
		                </div>
		    		</td>
		    	</tr>
	    	</c:if>
	    	<c:if test="${not empty replyMessage}">
	    		<tr>
		    		<td colspan="2" align="center"><font color="red"><fmt:message key="ic.lable.already.reply"/><fmt:message key="ic.lable.already.reply"/></font></td>
		    	</tr>
	    	</c:if>
	    </table>
	    </form>
    </c:if>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.title.value==""){
	confirm("<fmt:message key='ic.reply.title.null.requie'/>");
		
		theForm.title.focus();
		return false;
	}
	if(theForm.content.value==""){
	confirm("<fmt:message key='ic.reply.content.null.requie'/>");
	
		theForm.content.focus();
		return false;
	}
	//
	showLoading();
	return true;
}

function validateDeleteMessage(theForm){

	if(confirm("<fmt:message key='ic.delete.massage.yesorno'/>")){
		showLoading();
		return true;
	}
	return false;
}
</script>