<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.submitmemberorder"/></title>
    <meta name="heading" content="<fmt:message key="mi.submitmemberorder"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="memberRegisterStep2.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
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
    
    <h4><fmt:message key="mi.memberordersubmit"/></h4>
    <p>
    	<fmt:message key="miMember.memberNo"/>：<font color="#FF6600">${miMember.memberNo }</font>
    </p>
    <c:if test="${poOrder != null }">
		    <p><fmt:message key="poOrder.orderNo"/>：<font color="#FF6600">${poOrder.orderNo }</font></p>
		    <p><fmt:message key="busi.order.amount"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${poOrder.totalAmount }" /></font></p>
		    <p><fmt:message key="poSell.totalPv"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,###,##0.00" value="${poOrder.totalPv }" /></font></p>
		    <p>
		    	<font color="gray"><b><fmt:message key="busi.common.remark"/>:</b></font><br>	
	    		<font color="gray"><b><fmt:message key="mi.limitmemberorder"/><br><fmt:message key="mi.member.pay.remark"/></b></font>
		    </p>
	</c:if>
    <table class="detail">
    	<tr>
    		<td>
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" class="btn btn-default" onclick="window.location='memberOrders.jhtml?orderNo=${poOrder.orderNo }&search=search'"><fmt:message key="mi.mustpay"/></button>
    				<c:if test="${miMember.companyCode==sessionLoginUser.companyCode }">
    					<button type="button" name="submit" class="btn btn-success" onclick="window.location='memberOrderPay.jhtml?orderId=${poOrder.orderId}'"><fmt:message key="mi.latepay"/></button>
    				</c:if>
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