<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrderDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="poOrderDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poOrder" method="post" action="editPoOrder.jhtml" onsubmit="return validateForm(this)" id="poOrderForm">
    
    <spring:bind path="poOrder.*">
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
    		<th class="required"><fmt:message key="poOrder.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.totalPrice"/>:</th>
    		<td><form:input path="totalPrice" id="totalPrice"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.totalAmount"/>:</th>
    		<td><form:input path="totalAmount" id="totalAmount"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.totalPv"/>:</th>
    		<td><form:input path="totalPv" id="totalPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.paymentMethod"/>:</th>
    		<td><form:input path="paymentMethod" id="paymentMethod"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.payerCode"/>:</th>
    		<td><form:input path="payerCode" id="payerCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.paymentStatus"/>:</th>
    		<td><form:input path="paymentStatus" id="paymentStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.checkerCode"/>:</th>
    		<td><form:input path="checkerCode" id="checkerCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.payTime"/>:</th>
    		<td><form:input path="payTime" id="payTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.creatorCode"/>:</th>
    		<td><form:input path="creatorCode" id="creatorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="poOrder.isSendEfubo"/>:</th>
    		<td><form:input path="isSendEfubo" id="isSendEfubo"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="orderId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty poOrder.orderId }">
    					<win:power powerCode="deletePoOrder">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PoOrder')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='poOrders.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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