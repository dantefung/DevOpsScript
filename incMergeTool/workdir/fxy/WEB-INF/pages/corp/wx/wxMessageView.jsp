<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxMessageDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxMessageDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxMessage" method="post" id="wxMessageForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.userCode"/>:</th>
    		<td>${wxMessage.userCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.messageType"/>:</th>
    		<td>${wxMessage.messageType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.content"/>:</th>
    		<td>${wxMessage.content }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.picurl"/>:</th>
    		<td>${wxMessage.picurl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.locationX"/>:</th>
    		<td>${wxMessage.locationX }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.locationY"/>:</th>
    		<td>${wxMessage.locationY }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.scale"/>:</th>
    		<td>${wxMessage.scale }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.label"/>:</th>
    		<td>${wxMessage.label }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.localePrecision"/>:</th>
    		<td>${wxMessage.localePrecision }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.title"/>:</th>
    		<td>${wxMessage.title }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.description"/>:</th>
    		<td>${wxMessage.description }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.url"/>:</th>
    		<td>${wxMessage.url }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.event"/>:</th>
    		<td>${wxMessage.event }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.eventkey"/>:</th>
    		<td>${wxMessage.eventkey }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.ticket"/>:</th>
    		<td>${wxMessage.ticket }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.mediaId"/>:</th>
    		<td>${wxMessage.mediaId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.thumbMediaid"/>:</th>
    		<td>${wxMessage.thumbMediaid }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.msgFormat"/>:</th>
    		<td>${wxMessage.msgFormat }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.recognition"/>:</th>
    		<td>${wxMessage.recognition }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.textMsgId"/>:</th>
    		<td>${wxMessage.textMsgId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.fromUserName"/>:</th>
    		<td>${wxMessage.fromUserName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.localUrl"/>:</th>
    		<td>${wxMessage.localUrl }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.responseMsg"/>:</th>
    		<td>${wxMessage.responseMsg }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.addTime"/>:</th>
    		<td>${wxMessage.addTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxMessage.isCollection"/>:</th>
    		<td>${wxMessage.isCollection }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="messageId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxMessages.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>