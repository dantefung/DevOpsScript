<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApplyCheckLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApplyCheckLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miMemberApplyCheckLog" method="post" action="editMiMemberApplyCheckLog.jhtml" onsubmit="return validateForm(this)" id="miMemberApplyCheckLogForm">
    
    <spring:bind path="miMemberApplyCheckLog.*">
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
    		<th><fmt:message key="miMemberApplyCheckLog.applyCode"/>:</th>
    		<td><form:input path="applyCode" id="applyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApplyCheckLog.checkerCode"/>:</th>
    		<td><form:input path="checkerCode" id="checkerCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApplyCheckLog.checkerName"/>:</th>
    		<td><form:input path="checkerName" id="checkerName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApplyCheckLog.checkTime"/>:</th>
    		<td><form:input path="checkTime" id="checkTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApplyCheckLog.checkStep"/>:</th>
    		<td><form:input path="checkStep" id="checkStep"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMemberApplyCheckLog.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
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
    				<c:if test="${not empty miMemberApplyCheckLog.logId }">
    					<win:power powerCode="deleteMiMemberApplyCheckLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiMemberApplyCheckLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miMemberApplyCheckLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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