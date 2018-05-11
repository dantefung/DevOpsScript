<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdMonthStatusDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdMonthStatusDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdMonthStatus" method="post" action="editBdMonthStatus.jhtml" onsubmit="return validateForm(this)" id="bdMonthStatusForm">
    
    <spring:bind path="bdMonthStatus.*">
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
    		<th class="required"><fmt:message key="bdMonthStatus.wyear"/>:</th>
    		<td><form:input path="wyear" id="wyear"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthStatus.startDate"/>:</th>
    		<td><form:input path="startDate" id="startDate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthStatus.endDate"/>:</th>
    		<td><form:input path="endDate" id="endDate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthStatus.bonusStart"/>:</th>
    		<td><form:input path="bonusStart" id="bonusStart"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthStatus.bonusConfirm"/>:</th>
    		<td><form:input path="bonusConfirm" id="bonusConfirm"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthStatus.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthStatus.bonusSend"/>:</th>
    		<td><form:input path="bonusSend" id="bonusSend"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="wmonth"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty bdMonthStatus.wmonth }">
    					<win:power powerCode="deleteBdMonthStatus">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdMonthStatus')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdMonthStatuss.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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