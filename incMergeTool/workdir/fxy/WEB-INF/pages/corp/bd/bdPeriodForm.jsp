<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdPeriodDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdPeriodDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdPeriod" method="post" action="editBdPeriod.jhtml" onsubmit="return validateForm(this)" id="bdPeriodForm">
    
    <spring:bind path="bdPeriod.*">
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
    		<th class="required"><fmt:message key="bdPeriod.wyear"/>:</th>
    		<td><form:input path="wyear" id="wyear"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdPeriod.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdPeriod.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdPeriod.startTime"/>:</th>
    		<td><form:input path="startTime" id="startTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdPeriod.endTime"/>:</th>
    		<td><form:input path="endTime" id="endTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.calcStatus"/>:</th>
    		<td><form:input path="calcStatus" id="calcStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.confirmStatus"/>:</th>
    		<td><form:input path="confirmStatus" id="confirmStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.sendStatus"/>:</th>
    		<td><form:input path="sendStatus" id="sendStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.calcDate"/>:</th>
    		<td><form:input path="calcDate" id="calcDate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.confirmDate"/>:</th>
    		<td><form:input path="confirmDate" id="confirmDate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdPeriod.sendDate"/>:</th>
    		<td><form:input path="sendDate" id="sendDate"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wid"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty bdPeriod.wid }">
    					<win:power powerCode="deleteBdPeriod">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdPeriod')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdPeriods.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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