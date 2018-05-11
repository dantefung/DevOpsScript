<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="title.payment.info"/></title>
    <meta name="heading" content="<fmt:message key="title.payment.info"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<style>
<!--
.amount{
	color:#009900 ;
	font-weight: bold;
}
-->
</style>

<div class="contentBody">
    <form:form commandName="pdExchange" method="post" action="miExchangeOrderPay.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <form:hidden path="exchangeCode"/>
   
    <spring:bind path="pdExchange.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="alert alert-danger alert-dismissible fade in error">
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
	    	<td colspan="2"><fmt:message key="order.shippment.sino"/>：<b><font color="#FF6600">${pdExchange.siNo }</font></b>
	    	&nbsp;&nbsp;<fmt:message key="mi.needmoney"/>：<b><font color="#FF6600"><fmt:formatNumber pattern="###,##0.00" value="${pdExchange.exchangeTotalAmount }" /></font></b></td>
	    </tr>
	    <tr>
	    	<td colspan="2"><fmt:message key="mi.choosepaytype"/></td>
	    </tr>
	    <tr>
		<td valign="top">
			<input type="radio" id="paymentType1" name="paymentType" value="02" checked="checked"/>
		</td>
		<td>
			<fmt:message key="mi.memberdzcz"/><br/>
			<fmt:message key="mi.usejszf"/>。<br/>
			<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${defaultBalance.balance }" /></span><br/>
			<fmt:message key="mem.fi.dongjie"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${defaultBalance.freezeAmt }" /></span><br/>
			<fmt:message key="member.kyye"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${defaultBalance.balance-miMember.lowestBalance-defaultBalance.freezeAmt}" /></span>
		</td>
	    </tr>
	    <tr>
	    	<td>&nbsp;</td>
	    	<td>&nbsp;</td>
	    </tr>
	    <tr>
	    	<td>&nbsp;</td>
	    	<td>
	    		<div class="form-group">
	    		<label for="advPassword"><fmt:message key="mi.inputsecondpwd"/></label>
	    		<input type="password" name="advPassword" id="advPassword" class="form-control" placeholder="二级密码"/>
	    		</div>
	    	</td>
	    </tr>	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />    				
    				<button class="btn btn-default" type="button" name="cancel" id="cancel" onclick="document.location = 'miExchangeList.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
    				<button class="btn btn-success" type="submit" name="submit" id="payBtn"><fmt:message key="mi.surepay"/></button>
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
	if (theForm.advPassword.value == '' || theForm.advPassword.value == null) {
		alert("<fmt:message key='member.inputpwd'/>.");
		
		theForm.advPassword.focus();
		return false;
	}
	
	var pay1Checked = document.getElementById("paymentType1").checked;
	var confirmMsg = "";
	if(pay1Checked){
		confirmMsg = "<fmt:message key="mem.mi.pay.person"/> ";		
	}
	if (confirm(confirmMsg)) {
		//其它验证
		showLoading();
		return true;
	}
	return false;
}
</script>