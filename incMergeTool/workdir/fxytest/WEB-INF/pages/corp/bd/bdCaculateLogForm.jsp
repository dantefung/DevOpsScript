<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdCaculateLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdCaculateLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdCaculateLog" method="post" action="editBdCaculateLog.jhtml" onsubmit="return validateForm(this)" id="bdCaculateLogForm">
    
    <spring:bind path="bdCaculateLog.*">
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
    		<th><fmt:message key="bdCaculateLog.wyear"/>:</th>
    		<td><form:input path="wyear" id="wyear"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.currentStep"/>:</th>
    		<td><form:input path="currentStep" id="currentStep"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.errno"/>:</th>
    		<td><form:input path="errno" id="errno"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.errmsg"/>:</th>
    		<td><form:input path="errmsg" id="errmsg"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.cretaeTime"/>:</th>
    		<td><form:input path="cretaeTime" id="cretaeTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdCaculateLog.productNo"/>:</th>
    		<td><form:input path="productNo" id="productNo"/></td>
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
    				<c:if test="${not empty bdCaculateLog.id }">
    					<win:power powerCode="deleteBdCaculateLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdCaculateLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdCaculateLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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