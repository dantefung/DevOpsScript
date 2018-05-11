<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxNoticeMessageDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="wxNoticeMessageDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="wxNoticeMessage" method="post" id="wxNoticeMessageForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.wxOpenId"/>:</th>
    		<td>${wxNoticeMessage.wxOpenId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.msgType"/>:</th>
    		<td>${wxNoticeMessage.msgType }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.msgContent"/>:</th>
    		<td>${wxNoticeMessage.msgContent }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.sendTime"/>:</th>
    		<td>${wxNoticeMessage.sendTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.isSend"/>:</th>
    		<td>${wxNoticeMessage.isSend }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.retryTimes"/>:</th>
    		<td>${wxNoticeMessage.retryTimes }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.returnMsgId"/>:</th>
    		<td>${wxNoticeMessage.returnMsgId }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="wxNoticeMessage.receiveResult"/>:</th>
    		<td>${wxNoticeMessage.receiveResult }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="msgId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxNoticeMessages.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>