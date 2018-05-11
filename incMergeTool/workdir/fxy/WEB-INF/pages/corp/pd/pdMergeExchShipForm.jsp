<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdMergeExchShipDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdMergeExchShipDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdMergeExchShip" method="post" action="editPdMergeExchShip.jhtml" onsubmit="return validateForm(this)" id="pdMergeExchShipForm">
    
    <spring:bind path="pdMergeExchShip.*">
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
    		<th class="required"><fmt:message key="pdMergeExchShip.exchangeCode"/>:</th>
    		<td><form:input path="exchangeCode" id="exchangeCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdMergeExchShip.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdMergeExchShip.siNo"/>:</th>
    		<td><form:input path="siNo" id="siNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdMergeExchShip.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdMergeExchShip.totalPrice"/>:</th>
    		<td><form:input path="totalPrice" id="totalPrice"/></td>
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
    				<c:if test="${not empty pdMergeExchShip.id }">
    					<win:power powerCode="deletePdMergeExchShip">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PdMergeExchShip')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pdMergeExchShips.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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