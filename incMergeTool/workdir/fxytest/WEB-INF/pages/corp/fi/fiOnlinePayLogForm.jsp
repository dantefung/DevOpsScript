<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiOnlinePayLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiOnlinePayLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiOnlinePayLog" method="post" action="editFiOnlinePayLog.jhtml" onsubmit="return validateForm(this)" id="fiOnlinePayLogForm">
    
    <spring:bind path="fiOnlinePayLog.*">
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
    		<th class="required"><fmt:message key="fiOnlinePayLog.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiOnlinePayLog.buyerCode"/>:</th>
    		<td><form:input path="buyerCode" id="buyerCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiOnlinePayLog.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiOnlinePayLog.outTradeNo"/>:</th>
    		<td><form:input path="outTradeNo" id="outTradeNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.returnTime"/>:</th>
    		<td><form:input path="returnTime" id="returnTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.payResult"/>:</th>
    		<td><form:input path="payResult" id="payResult"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.tradeNo"/>:</th>
    		<td><form:input path="tradeNo" id="tradeNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.totalFee"/>:</th>
    		<td><form:input path="totalFee" id="totalFee"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.returnUrl"/>:</th>
    		<td><form:input path="returnUrl" id="returnUrl"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiOnlinePayLog.createUser"/>:</th>
    		<td><form:input path="createUser" id="createUser"/></td>
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
    				<c:if test="${not empty fiOnlinePayLog.id }">
    					<win:power powerCode="deleteFiOnlinePayLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiOnlinePayLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiOnlinePayLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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