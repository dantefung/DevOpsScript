<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poShipUpdateLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="poShipUpdateLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poShipUpdateLog" method="post" action="editPoShipUpdateLog.jhtml" onsubmit="return validateForm(this)" id="poShipUpdateLogForm">
    
    <spring:bind path="poShipUpdateLog.*">
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
    		<th><fmt:message key="poShipUpdateLog.shipId"/>:</th>
    		<td><form:input path="shipId" id="shipId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poShipUpdateLog.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.orderId"/>:</th>
    		<td><form:input path="orderId" id="orderId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poShipUpdateLog.recptCode"/>:</th>
    		<td><form:input path="recptCode" id="recptCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poShipUpdateLog.shipType"/>:</th>
    		<td><form:input path="shipType" id="shipType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipFirstName"/>:</th>
    		<td><form:input path="shipFirstName" id="shipFirstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipLastName"/>:</th>
    		<td><form:input path="shipLastName" id="shipLastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAreaCode"/>:</th>
    		<td><form:input path="shipAreaCode" id="shipAreaCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAddress1"/>:</th>
    		<td><form:input path="shipAddress1" id="shipAddress1"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipAddress2"/>:</th>
    		<td><form:input path="shipAddress2" id="shipAddress2"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipZipCode"/>:</th>
    		<td><form:input path="shipZipCode" id="shipZipCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipPhone"/>:</th>
    		<td><form:input path="shipPhone" id="shipPhone"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poShipUpdateLog.shipMobile"/>:</th>
    		<td><form:input path="shipMobile" id="shipMobile"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poShipUpdateLog.creatorCode"/>:</th>
    		<td><form:input path="creatorCode" id="creatorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poShipUpdateLog.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
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
    				<c:if test="${not empty poShipUpdateLog.logId }">
    					<win:power powerCode="deletePoShipUpdateLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PoShipUpdateLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='poShipUpdateLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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