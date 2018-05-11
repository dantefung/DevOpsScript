<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="邮件队列"/></title>
    <meta name="heading" content="<fmt:message key="邮件队列"/>"/>
</head>

<%
	request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="sysMailQueue" method="post" action="editSysMailQueue.jhtml" onsubmit="return validateForm(this)" id="sysMailQueueForm">

    <table class="detail">
    	<tr>
    		<th class="required">公司:</th>
    		<td>${sysMailQueue.companyCode}</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysDataLog.changeType"/>:</th>
    		<td><win:code listCode="email_type" value="${sysMailQueue.mailTypeId}"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMailQueue.fromEmail"/>:</th>
    		<td>${sysMailQueue.fromEmail}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysMailQueue.fromName"/>:</th>
    		<td>${sysMailQueue.fromName}</td>
    	</tr>
    	<tr>
    		<th class="required">接收人:</th>
    		<td>${sysMailQueueRcpt.toUserCode} - ${sysMailQueueRcpt.toName}</td>
    	</tr>
    	<tr>
    		<th class="required">接收邮箱:</th>
    		<td>${sysMailQueueRcpt.toEmail}</td>
    	</tr>
    	<tr>
    		<th class="required">是否发送:</th>
    		<td><win:code listCode="yesno" value="${sysMailQueueRcpt.isSent}"/></td>
    	</tr>
    	<tr>
    		<th class="required">创建时间:</th>
    		<td>${sysMailQueue.creatorCode} - ${sysMailQueue.createTime}</td>
    	</tr>
    	<tr>
    		<th class="required">发送时间:</th>
    		<td>${sysMailQueueRcpt.sentDate}</td>
    	</tr>
    	<tr>
    		<th class="required">邮件标题:</th>
    		<td>${sysMailQueue.mailTitle}</td>
    	</tr>
    	<tr>
    		<th class="required">文本内容:</th>
    		<td>${fn:replace(sysMailQueue.textContent, vEnter, '<br>')}</td>
    	</tr>
    	<tr>
    		<th>HTML内容:</th>
    		<td>${sysMailQueue.htmlContent}</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="queueId"/>
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