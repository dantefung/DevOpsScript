<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>编辑微信底部菜单</title>
    <meta name="heading" content="编辑微信底部菜单"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="wxFootBtn" method="post" action="editWxFootBtn.jhtml" onsubmit="return validateForm(this)" id="wxFootBtnForm">
    
    <spring:bind path="wxFootBtn.*">
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
    		<th class="required">上级按钮:</th>
    		<td>${parentWxFootBtn.buttonTitle }<form:hidden path="parentId" id="parentId"/></td>
    	</tr>
    	<tr>
    		<th class="required">按钮类型:</th>
    		<td><win:list name="buttonType" listCode="foot_btn_type" defaultValue="" value="${wxFootBtn.buttonType }"/></td>
    	</tr>
    	<tr>
    		<th class="required" valign="top">按钮标题:</th>
    		<td>
    			<form:input path="buttonTitle" id="buttonTitle"/>
    			<br/>不超过4个汉字(8个英文数字)，子菜单不超过5个汉字(10个英文数字)
    		</td>
    	</tr>
    	<tr>
    		<th valign="top">跳转URL:</th>
    		<td>
    			<form:input path="navUrl" id="navUrl" size="60"/>
    			<br/>当按钮类型为“跳转URL”时此项必填，链接必须为以http或者https开头的完整链接
    		</td>
    	</tr>
    	<tr>
    		<th valign="top">推送事件(回复信息):</th>
    		<td>
    			<select name="msgId">
    				<option value=""></option>
    				<c:forEach items="${wxReMsgs }" var="varWxReMsg">
    					<option value="${varWxReMsg.msgId}"<c:if test="${wxFootBtn.wxReMsg.msgId==varWxReMsg.msgId }"> selected</c:if>>${varWxReMsg.interDesc}</option>
    				</c:forEach>
    			</select>
    			<br/>如有需要，请先在“自动回复信息管理”菜单里设定相关的信息
    		</td>
    	</tr>
    	<tr>
    		<th>排序号:</th>
    		<td><form:input path="sortNo" id="sortNo"/> 整数，越小排越前</td>
    	</tr>
    	<tr>
    		<th class="required">是否显示:</th>
    		<td><win:list name="isVisible" listCode="yesno" defaultValue="" value="${wxFootBtn.isVisible }"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="buttonId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty wxFootBtn.buttonId }">
    					<win:power powerCode="deleteWxFootBtn">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'WxFootBtn')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='wxFootBtns.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.buttonTitle.value==""){
		alert("请输入按钮标题");
		theForm.buttonTitle.focus();
		return false;
	}
	if(theForm.buttonType.value=="view" && (theForm.navUrl.value=="" || !isURL(theForm.navUrl.value))){
		alert("请输入需要跳转的URL，必须以http或者https开头");
		theForm.navUrl.focus();
		return false;
	}
	if(theForm.sortNo.value!="" && !isUnsignedInteger(theForm.sortNo.value)){
		alert("请输入正确的排序号");
		theForm.sortNo.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>