<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmStatusLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmStatusLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmStatusLog" method="post" action="editPmStatusLog.jhtml" onsubmit="return validateForm(this)" id="pmStatusLogForm">
    
    <spring:bind path="pmStatusLog.*">
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
    		<th><fmt:message key="pmStatusLog.productId"/>:</th>
    		<td><form:input path="productId" id="productId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmStatusLog.newStatus"/>:</th>
    		<td><form:input path="newStatus" id="newStatus"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmStatusLog.editorCode"/>:</th>
    		<td><form:input path="editorCode" id="editorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmStatusLog.editTime"/>:</th>
    		<td><form:input path="editTime" id="editTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmStatusLog.editReason"/>:</th>
    		<td><form:input path="editReason" id="editReason"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmStatusLog.receiptCode"/>:</th>
    		<td><form:input path="receiptCode" id="receiptCode"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty pmStatusLog.logId }">
    					<win:power powerCode="deletePmStatusLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PmStatusLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pmStatusLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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