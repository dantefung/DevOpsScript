<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>编辑微信通知模板</title>
    <meta name="heading" content="编辑微信通知模板"/>
</head>

<div class="contentBody">
    <form:form commandName="wxNoticeTemplate" method="post" action="editWxNoticeTemplate.jhtml" onsubmit="return validateForm(this)" id="wxNoticeTemplateForm">
    
    <spring:bind path="wxNoticeTemplate.*">
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
    		<th class="required" valign="top">通知类别:</th>
    		<td class="required">
    			<c:if test="${not empty wxNoticeTemplate.id }">
    				<form:hidden path="noticeType" id="noticeType"/>
    				${wxNoticeTemplate.noticeType }
    			</c:if>
    			<c:if test="${empty wxNoticeTemplate.id }">
    				<form:input path="noticeType" id="noticeType"/>
    				<br/>输入后不能更改，不能与其它模板类别重复
    			</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required" valign="top">通知信息标题:</th>
    		<td>
    			<form:input path="noticeTitle" id="noticeTitle" size="60"/><br/>
    			用于标识此通知的用途，用户所收到的信息的标题取决于公众号中模板的标题，和此标题无关
    		</td>
    	</tr>
    	<tr>
    		<th class="required" valign="top">微信模板ID:</th>
    		<td>
    			<form:input path="templateId" id="templateId" size="60" htmlEscape="true" />
    			<br/>对应于公众号中模板的ID
    		</td>
    	</tr>
    	<tr>
    		<th valign="top">格式:</th>
    		<td>
    			<form:textarea path="templatePattern" id="templatePattern" rows="8" cols="80" htmlEscape="true" />
    			<br/>具体格式内容取决于微信模板的内容，此处仅方便于开发参考
    		</td>
    	</tr>
    	<tr>
    		<th valign="top">范例:</th>
    		<td>
    			<form:textarea path="templateSample" id="templateSample" rows="8" cols="80" htmlEscape="true" />
    		</td>
    	</tr>
    	<tr>
    		<th valign="top">备注:</th>
    		<td><form:textarea path="remark" id="remark" rows="5" cols="80"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty wxNoticeTemplate.id }">
    					<win:power powerCode="deleteWxNoticeTemplate">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxNoticeTemplate')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxNoticeTemplates.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    				<c:if test="${not empty wxNoticeTemplate.id }">
    					<br/>
    					注意：如果删除此微信通知模板，则对应的通知消息将无法正常发送。
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
	if(theForm.noticeType.value==""){
		alert("请输入通知类型");
		theForm.noticeType.focus();
		return false;
	}
	if(theForm.noticeTitle.value==""){
		alert("请输入通知标题");
		theForm.noticeTitle.focus();
		return false;
	}
	if(theForm.templateId.value==""){
		alert("请输入模板ID");
		theForm.templateId.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>