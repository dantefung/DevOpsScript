<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <c:if test="${strAction == 'poUpgrade' }">
		<title><fmt:message key="function.menu.poMemberUOrders"/></title>
  		<meta name="heading" content="<fmt:message key="function.menu.poMemberUOrders"/>"/>
	</c:if>
	<c:if test="${strAction == 'poOrderProducts' }">
		<title><fmt:message key="po.returnOrder"/></title>
  		<meta name="heading" content="<fmt:message key="po.returnOrder"/>"/>
	</c:if>
</head>

<div class="contentBody">
    <form:form commandName="poOrder" method="post" action="poSubmitSuccess.jhtml" onsubmit="return validateForm(this)" name="poOrderForm" id="poOrderForm">
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
	    	<td><h4><fmt:message key="mi.ordersubmit"/></h4></td>
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
	    	<td><fmt:message key="poSell.totalPv"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${poOrder.totalPv }" /></font></td>
	    </tr>
	    <tr>
	    	<td><font color="gray"><b><fmt:message key="busi.common.remark"/>:</b></font><br>	
	    		<font color="gray"><b><c:if test="${poOrder.orderType == '2' }"><fmt:message key="po.goods.order.remark"/><br></c:if><fmt:message key="member.pay.remark"/></b></font>
	    	</td>
	    </tr>

    	<tr>
    		<td>
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" class="btn btn-default" name="cancel" onclick="window.location='memberOrders.jhtml'"><fmt:message key="mi.mustpay"/></button>
    				<%-- <c:if test="${poOrder.orderType != '18' }"> --%>
    				<button type="button" class="btn btn-success" name="next" onclick="window.location='memberOrderPay.jhtml?orderId=${poOrder.orderId}'"><fmt:message key="mi.latepay"/></button>
    				<%-- </c:if>  --%>   				
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