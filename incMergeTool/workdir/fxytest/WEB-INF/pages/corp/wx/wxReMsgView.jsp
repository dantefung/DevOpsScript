<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>查看回复信息</title>
    <meta name="heading" content="查看回复信息"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="wxReMsg" method="post" id="wxReMsgForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th>信息类型:</th>
    		<td><win:code listCode="wx_reply_msg_type" value="${wxReMsg.msgType }"/></td>
    	</tr>
    	<tr>
    		<th valign="top">消息内部说明:</th>
    		<td>${wxReMsg.interDesc }</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">消息主体</td>
    	</tr>
    	<c:if test="${wxReMsg.msgType=='text'}">
    		<tr>
	    		<th valign="top">消息内容:</th>
	    		<td>${fn:replace(wxReMsg.msgContent, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	
    	<c:if test="${wxReMsg.msgType=='news'}">
	    	<tr>
	    		<th>消息标题:</th>
	    		<td>${wxReMsg.msgTitle }</td>
	    	</tr>
	    	<tr>
	    		<th valign="top">消息描述:</th>
	    		<td>${fn:replace(wxReMsg.msgDesc, vEnter, '<br>')}</td>
	    	</tr>
	    	<tr>
	    		<th valign="top">图片文件:</th>
	    		<td>
	    			<c:if test="${not empty wxReMsg.picUrl}">
	    				<img src="${ctx }${wxReMsg.picUrl}" border="0" height="200"/>
	    			</c:if>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th valign="top">跳转链接:</th>
	    		<td>${wxReMsg.linkUrl }</td>
	    	</tr>
	    </c:if>
    	<tr>
    		<td colspan="2" class="title">其它</td>
    	</tr>
    	<tr>
    		<th>创建人:</th>
    		<td>${wxReMsg.creatorCode }</td>
    	</tr>
    	<tr>
    		<th>创建时间:</th>
    		<td>${wxReMsg.createTime }</td>
    	</tr>
    	<tr>
    		<th>最后修改人:</th>
    		<td>${wxReMsg.editorCode }</td>
    	</tr>
    	<tr>
    		<th>最后修改时间:</th>
    		<td>${wxReMsg.editTime }</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="msgId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='wxReMsgs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>