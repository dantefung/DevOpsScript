<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="online.payment.method.mgr"/></title>
    <meta name="heading" content="<fmt:message key="online.payment.method.mgr"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiOnlinePayment" method="post" action="editFiOnlinePayment.jhtml" onsubmit="return validateForm(this)" id="fiOnlinePaymentForm">
    
    <spring:bind path="fiOnlinePayment.*">
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
    		<th class="required"><fmt:message key="payment.method.code"/>:</th>
    		<td>
    			<c:if test="${not empty fiOnlinePayment.paymentId }">
    				${fiOnlinePayment.paymentCode }<form:hidden path="paymentCode" id="paymentCode"/>
    			</c:if>
    			<c:if test="${empty fiOnlinePayment.paymentId }">
    				<win:list name="paymentCode" listCode="online_payment_codes" defaultValue="" value=""/>
	    		</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="inuse.branch.company"/>:</th>
    		<td>
    			<select name="companyCode" id="companyCode">
		        	<c:forEach items="${alCompanys}" var="alCompanyVar">
	        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==fiOnlinePayment.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
		    		</c:forEach>
		        </select>
    		</td>
    	</tr>
    	<tr>
				<th class="required"><fmt:message key="payment.method.name"/>:</th>
    		<td><form:input path="paymentName" id="paymentName" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.description"/>:</th>
    		<td><form:textarea path="paymentDesc" id="paymentDesc" rows="8" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>1:</th>
    		<td><form:input path="param1" id="param1" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>2:</th>
    		<td><form:input path="param2" id="param2" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>3:</th>
    		<td><form:input path="param3" id="param3" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>4:</th>
    		<td><form:input path="param4" id="param4" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>5:</th>
    		<td><form:input path="param5" id="param5" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>6:</th>
    		<td><form:input path="param6" id="param6" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>7:</th>
    		<td><form:input path="param7" id="param7" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>8:</th>
    		<td><form:input path="param8" id="param8" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.parameter"/>9:</th>
    		<td><form:input path="param9" id="param9" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" id="remark" rows="8" cssStyle="width:300px;"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fi.status"/>:</th>
    		<td><win:list name="status" listCode="online_payment_status" defaultValue="1" value="${fiOnlinePayment.status }"/></td>
    	</tr>

    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="paymentId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiOnlinePayment.paymentId }">
    					<win:power powerCode="deleteFiOnlinePayment">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiOnlinePayment')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiOnlinePayments.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.paymentCode.value==""){
		alert("<fmt:message key='lang.plsInputPaymentMethodCode'/>");//请输入支付方式编码
		theForm.paymentCode.focus();
		return false;
	}
	if(theForm.paymentName.value==""){
		alert("<fmt:message key='lang.plsInputPaymentMethodName'/>");//请输入支付方式名称
		theForm.paymentName.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>