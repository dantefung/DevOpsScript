<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icMessageViewDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="icMessageViewDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icMessageView" method="post" action="editIcMessageView.jhtml" onsubmit="return validateForm(this)" id="icMessageViewForm">
    
    <spring:bind path="icMessageView.*">
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
    		<th><fmt:message key="icMessageView.messageId"/>:</th>
    		<td><form:input path="messageId" id="messageId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessageView.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icMessageView.viewTime"/>:</th>
    		<td><form:input path="viewTime" id="viewTime"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="viewId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty icMessageView.viewId }">
    					<win:power powerCode="deleteIcMessageView">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'IcMessageView')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='icMessageViews.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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