<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miStateLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miStateLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miStateLog" method="post" action="editMiStateLog.jhtml" onsubmit="return validateForm(this)" id="miStateLogForm">
    
    <spring:bind path="miStateLog.*">
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
    		<th class="required"><fmt:message key="miStateLog.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.statusType"/>:</th>
    		<td><form:input path="statusType" id="statusType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.newStatus"/>:</th>
    		<td><form:input path="newStatus" id="newStatus"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.editorCode"/>:</th>
    		<td><form:input path="editorCode" id="editorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.editTime"/>:</th>
    		<td><form:input path="editTime" id="editTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.editReason"/>:</th>
    		<td><form:input path="editReason" id="editReason"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miStateLog.receiptCode"/>:</th>
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
    				<c:if test="${not empty miStateLog.logId }">
    					<win:power powerCode="deleteMiStateLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiStateLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miStateLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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