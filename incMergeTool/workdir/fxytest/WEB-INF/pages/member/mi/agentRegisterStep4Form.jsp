<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="mi.agent.register.title"/></title>
	<meta name="heading" content="<fmt:message key="mi.agent.register.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poOrder" method="post" action="agentRegisterStep4.jhtml" onsubmit="return validateForm(this)" name="poOrderForm" id="poOrderForm">
    <input type="hidden" id="newAgentRegisterKey" name="newAgentRegisterKey" value="${newAgentRegisterKey}"/>
    <spring:bind path="miMember.*">
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
    
    <table class="detail">
	    <tr>
	    	<td><fmt:message key="mi.ordersubmit"/></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="miMember.memberNo"/>：<font color="#FF6600">${poOrder.userCode }</font></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="poOrder.orderNo"/>：<font color="#FF6600">${poOrder.orderNo }</font></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="busi.order.amount"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${poOrder.totalAmount }" /></font></td>
	    </tr>
	    <tr>
	    	<td><font color="gray"><b><fmt:message key="busi.common.remark"/>:</b></font><br>	
	    		<font color="gray"><b><fmt:message key="member.pay.remark"/></b></font>
	    	</td>
	    </tr>

    	<tr>
    		<td>
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" class="btn btn-default" onclick="window.location='memberOrders.jhtml'"><fmt:message key="mi.mustpay"/></button>
    				<button type="button" name="next" class="btn btn-success" onclick="window.location='memberOrderPay.jhtml?orderId='+${poOrder.orderId}"><fmt:message key="mi.latepay"/></button>    				
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(function() {

})
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