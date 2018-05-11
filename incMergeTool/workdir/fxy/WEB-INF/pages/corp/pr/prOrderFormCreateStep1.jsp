<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.listPrOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.listPrOrders"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="editPrOrderCreateStep1.jhtml" onsubmit="return validateForm(this)" id="prOrderForm">
    
    <spring:bind path="prOrder.*">
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
    		<th class="required"><fmt:message key="prReFund.originateOrderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="addPrOrder">
    					<button type="submit" name="save" onclick="bCancel=false">下一步</button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='prOrders.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(theForm.orderNo.value==null || theForm.orderNo.value.length==0){
		alert("<fmt:message key="pr.msg.q13"/>");
		theForm.orderNo.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
</script>