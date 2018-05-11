<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>自动回复信息管理</title>
    <meta name="heading" content="自动回复信息管理"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="wxReMsg" method="post" action="editWxReMsg.jhtml" onsubmit="return validateForm(this)" id="wxReMsgForm" enctype="multipart/form-data">
    
    <spring:bind path="wxReMsg.*">
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
    		<th class="required">信息类型:</th>
    		<td><win:list name="msgType" listCode="wx_reply_msg_type" defaultValue="" value="${wxReMsg.msgType }" id="msgType"/></td>
    	</tr>
    	<tr>
    		<th class="required" valign="top">消息内部说明:</th>
    		<td>
    			<form:input path="interDesc" id="interDesc" size="60"/>
    			<br/>此内容不发送给用户，仅用于标识此消息的用途，尽量简洁</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">消息主体</td>
    	</tr>
    	<tr class="cssTrText">
    		<th class="required">消息内容:</th>
    		<td><form:textarea path="msgContent" rows="10" cols="58"/></td>
    	</tr>
    	<tr class="cssTrNews">
    		<th>消息标题:</th>
    		<td><form:input path="msgTitle" id="msgTitle" size="60"/></td>
    	</tr>
    	<tr class="cssTrNews">
    		<th>消息描述:</th>
    		<td><form:textarea path="msgDesc" rows="6" cols="58"/></td>
    	</tr>
    	<tr class="cssTrNews">
    		<th valign="top">图片文件:</th>
    		<td>
    			<c:if test="${not empty wxReMsg.picUrl}">
    				<input type="checkbox" name="isDeletePic" id="isDeletePic" value="1"><label for="isDeletePic">删除原图？</label><br/>
    				<img src="${ctx }${wxReMsg.picUrl}" border="0" height="200"/><br/><br/>选择新的图片：<br/>
    			</c:if>
    			<input type="file" name="uploadPic" size="60"/>
    			<br/>支持JPG、PNG格式，较好的效果为大图360*200，小图200*200
    		</td>
    	</tr>
    	<tr class="cssTrNews">
    		<th valign="top">跳转链接:</th>
    		<td>
    			<form:input path="linkUrl" id="linkUrl" size="60"/>
    			<br/>链接必须为以http或者https开头的完整链接
    		</td>
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
    				<c:if test="${not empty wxReMsg.msgId }">
    					<win:power powerCode="deleteWxReMsg">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxReMsg')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxReMsgs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    				<c:if test="${not empty wxReMsg.msgId }">
    					<br/><br/>如果需要删除此信息，请在删除前确认未有其它地方使用此信息
    				</c:if>
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
	if(theForm.interDesc.value==""){
		alert("请输入消息内部说明");
		theForm.interDesc.focus();
		return false;
	}

	if (theForm.msgType.value =="text") {
		if(theForm.msgContent.value==""){
			alert("请输入消息内容");
			theForm.msgContent.focus();
			return false;
		}
	}else if (theForm.msgType.value =="news") {
		if(theForm.linkUrl.value!="" && !isURL(theForm.linkUrl.value)){
			alert("请输入正确的跳转链接");
			theForm.linkUrl.focus();
			return false;
		}
	}
	
	showLoading();
	return true;
}

$(document).ready(function(){
	changeMsgType("${wxReMsg.msgType}");

    $("#msgType").change(function(){
    	changeMsgType($(this).children('option:selected').val());
    });
});

function changeMsgType(newMsgType){
	if(newMsgType=="text"){
		$(".cssTrText").css("display","");
		$(".cssTrNews").css("display","none");
	}else if(newMsgType=="news"){
		$(".cssTrText").css("display","none");
		$(".cssTrNews").css("display","");
	}
}
</script>