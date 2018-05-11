<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.fxProduct.order.success"/></title>
    <meta name="heading" content="<fmt:message key="po.fxProduct.order.success"/>"/>
</head>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="po.input.memberInfo"/></li>
		<li>2.<fmt:message key="po.input.address"/></li>
		<li>3.<fmt:message key="menu.common.selectProduct"/></li>
		<li>4.<fmt:message key="po.order.info.sure"/></li>
		<li><b>5.<fmt:message key="po.fxProduct.order.success"/></b></li>
	</ul>
</c:set>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="memberRegisterStep2.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" id="mtMemberKey" name="mtMemberKey" value="${mtMemberKey}"/>
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
	    	<td><fmt:message key="miMember.memberNo"/>：<font color="#FF6600">${miMember.memberNo }</font></td>
	    </tr>
	    <c:if test="${poOrder != null }">
		    <tr>
		    	<td><fmt:message key="poOrder.orderNo"/>：<font color="#FF6600">${poOrder.orderNo }</font></td>
		    </tr>
		    <tr>
		    	<td><fmt:message key="busi.order.amount"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${poOrder.totalAmount }" /></font></td>
		    </tr>
	    </c:if>

    	<tr>
    		<td>
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    			<button type="button" name="cancel" onclick="window.location='memberOrders.jhtml?orderNo=${poOrder.orderNo }&search=search'"><fmt:message key="mi.mustpay"/></button>
	    			<button type="button" name="submit" onclick="window.location='memberOrderPay.jhtml?orderId=${poOrder.orderId}'"><fmt:message key="mi.latepay"/></button>
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