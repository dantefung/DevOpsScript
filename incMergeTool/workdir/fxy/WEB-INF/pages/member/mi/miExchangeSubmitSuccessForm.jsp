<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="poship.exchange.apply.success"/></title>
	<meta name="heading" content="<fmt:message key="poship.exchange.apply.success"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdExchange" method="post" action="miExchangeSubmitSuccess.jhtml" onsubmit="return validateForm(this)" name="poOrderForm" id="poOrderForm">
    <spring:bind path="pdExchange.*">
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
	    	<td><h4><fmt:message key="poship.exchange.apply.success"/></h4></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="order.shippment.sino"/>：<font color="#FF6600">${pdExchange.siNo }</font></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="old.order.tatalprice"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${oldOrderAmount }" /></font></td>
	    </tr>
	    <tr>
	    	<td><fmt:message key="busi.order.amount"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${pdExchange.exchangeTotalPrice }" /></font></td>
	    </tr>
	     <tr>
	    	<td><fmt:message key="poSell.totalPv"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${pdExchange.exchangeTotalPv }" /></font></td>
	    </tr>
    	 <tr>
	    	<td><fmt:message key="mi.need.pay.money.lable"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${pdExchange.exchangeTotalAmount }" /></font></td>
	    </tr>
	    <tr>
	    	<td><font color="gray"><b><fmt:message key="busi.common.remark"/>:</b></font><br>	
	    	</td>
	    </tr>

    	<tr>
    		<td>
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" class="btn btn-default" name="cancel" onclick="window.location='miExchangeList.jhtml?exchangeCode=${pdExchange.exchangeCode}'"><fmt:message key="mi.latepay"/></button>
    				<c:if test="${pdExchange.exchangeTotalAmount>0 }">
    					<button type="button" class="btn btn-success" name="next" onclick="window.location='miExchangeOrderPay.jhtml?exchangeCode=${pdExchange.exchangeCode}'"><fmt:message key="mi.latepay"/></button>
    				</c:if>				
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