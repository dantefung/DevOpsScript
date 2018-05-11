<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.systemParameterManage.listManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemParameterManage.listManage"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysListKey" method="post" action="editSysListKey.jhtml" onsubmit="return validateForm(this)" id="sysListKeyForm">
    
    <spring:bind path="sysListKey.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysListKey.listCode"/>:</th>
    		<td><form:input path="listCode" id="listCode" size="40"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysListKey.listName"/>:</th>
    		<td><form:input path="listName" id="listName" size="40"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea rows="5" cols="40" path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="keyId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysListKey.keyId }">
    					<win:power powerCode="deleteSysListKey">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysListKey')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysListKeys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(theForm.listCode.value==""){
		alert("<fmt:message key="sysListKey.listCode.required"/>");
		theForm.listCode.focus();
		return false;
	}else if(theForm.listName.value==""){
		alert("<fmt:message key="sysListKey.listName.required"/>");
		theForm.listName.focus();
		return false ;
	}
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>