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


<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/payment.css" type="text/css"/>

<div class="contentBody">
    <form:form commandName="poOrder" method="post" action="memberOrderPay.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" id="newMemberKey" name="newMemberKey" value="${newMemberKey}"/>
    <form:hidden path="orderId"/>
   
    <spring:bind path="poOrder.*">
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
	    	<td colspan="2"><fmt:message key="poOrder.orderNo"/>：<b><font color="#FF6600">${poOrder.orderNo }</font></b>&nbsp;&nbsp;<fmt:message key="mi.needmoney"/>：<b><font color="#FF6600"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></font></b></td>
	    </tr>
	    <tr>
	    	<td colspan="2"><fmt:message key="mi.choosepaytype"/></td>
	    </tr>

		<c:if test="${poOrder.orderType==1 || poOrder.orderType==2 || poOrder.orderType==3 || poOrder.orderType==5}">
		    <tr>
		    	<td valign="top">
					<input type="radio" id="accountTypeA0" name="accountType" value="A0" <c:if test="${empty param.accountType || param.accountType=='A0' }">checked="checked"</c:if>/>
				</td>
				<td>
					<label for="accountTypeA0"><fmt:message key="label.account.type.A0"/></label><br/>
					<fmt:message key="mi.usejszf"/>。<br/>
					<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceA0.balance+fiAcBalanceA0.freezeBalance }" /></span><br/>
					<fmt:message key="mem.fi.dongjie"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceA0.freezeBalance }" /></span><br/>
					<fmt:message key="member.kyye"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceA0.balance}" /></span>
				</td>
			</tr>
			<tr>
		    	<td colspan="2"><fmt:message key="lang.use.anotherAcc.deduct"/></td>
		    </tr>
		    <tr>
		    	<td valign="top">
					<input type="radio" id="accountTypeNull" name="otherAccountType" value=""<c:if test="${empty param.otherAccountType }"> checked="checked"</c:if>/>
				</td>
				<td>
					<label for="accountTypeNull"><fmt:message key="lang.no.discount"/></label><br/>
				</td>
			</tr>
			<c:if test="${currentUserCompanyCode eq 'CN'}">
			<%--<tr>--%>
		    	<%--<td valign="top">--%>
					<%--<input type="radio" id="accountTypeA1" name="otherAccountType" value="A1"<c:if test="${param.otherAccountType=='A1' }"> checked="checked"</c:if>/>--%>
				<%--</td>--%>
				<%--<td>--%>
					<%--<label for="accountTypeA1"><fmt:message key="label.account.type.A1"/></label><br/>--%>
					<%--<fmt:message key="lang.use"/><fmt:message key="label.account.type.A1"/><fmt:message key="lang.fordeduct.most"/>${maxDiscountAmount2 }。<br/>--%>
					<%--<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceA1.balance }" /></span><br/>--%>
					<%--<fmt:message key="lang.deduct.amt"/>：<br/>--%>
					<%--<input type="text" name="discountAmountByA1" id="discountAmountByA1" class="form-control" value="<c:if test="${empty param.discountAmountByA1 }">${maxDiscountAmount2 }</c:if><c:if test="${not empty param.discountAmountByA1 }">${param.discountAmountByA1}</c:if>">--%>
				<%--</td>--%>
			<%--</tr>--%>
			<%--<tr>--%>
		    	<%--<td valign="top">--%>
					<%--<input type="radio" id="accountTypeA2" name="otherAccountType" value="A2"<c:if test="${param.otherAccountType=='A2' }"> checked="checked"</c:if>/>--%>
				<%--</td>--%>
				<%--<td>--%>
					<%--<label for="accountTypeA2"><fmt:message key="label.account.type.A2"/></label><br/>--%>
					<%--<fmt:message key="lang.use"/><fmt:message key="label.account.type.A2"/><fmt:message key="lang.fordeduct.most"/>${maxDiscountAmount3 }。<br/>--%>
					<%--<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceA2.balance }" /></span><br/>--%>
					<%--<fmt:message key="lang.deduct.amt"/>：<br/>--%>
					<%--<input type="text" name="discountAmountByA2" id="discountAmountByA2" class="form-control" value="<c:if test="${empty param.discountAmountByA2 }">${maxDiscountAmount3 }</c:if><c:if test="${not empty param.discountAmountByA2 }">${param.discountAmountByA2}</c:if>">--%>
				<%--</td>--%>
			<%--</tr>--%>
			</c:if>
		</c:if>
		<c:if test="${poOrder.orderType==7}">
		    <tr>
		    	<td valign="top">
					<input type="radio" id="accountTypeB3" name="accountType" value="B3" <c:if test="${empty param.accountType || param.accountType=='B3' }">checked="checked"</c:if>/>
				</td>
				<td>
					<label for="accountTypeB3"><fmt:message key="label.account.type.B3"/></label><br/>
					<fmt:message key="mi.usejszf"/>。<br/>
					<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceB3.balance+fiAcBalanceB3.freezeBalance }" /></span><br/>
					<fmt:message key="mem.fi.dongjie"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceB3.freezeBalance }" /></span><br/>
					<fmt:message key="member.kyye"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceB3.balance}" /></span>
				</td>
			</tr>
		</c:if>
		<c:if test="${poOrder.orderType==10}">
			<tr>
				<td valign="top">
					<input type="radio" id="accountTypeC0" name="accountType" value="C0" <c:if test="${empty param.accountType || param.accountType=='C0' }">checked="checked"</c:if>/>
				</td>
				<td>
					<label for="accountTypeC0"><fmt:message key="label.account.type.A2"/></label><br/>
					<fmt:message key="mi.usejszf"/>。<br/>
					<fmt:message key="mi.memberdzczyk"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceC0.balance+fiAcBalanceC0.freezeBalance }" /></span><br/>
					<fmt:message key="mem.fi.dongjie"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceC0.freezeBalance }" /></span><br/>
					<fmt:message key="member.kyye"/>：<span class="amount"><fmt:formatNumber pattern="###,##0.00" value="${fiAcBalanceC0.balance}" /></span>
				</td>
			</tr>
		</c:if>
	    <tr>
	    	<td>&nbsp;</td>
	    	<td>&nbsp;</td>
	    </tr>
	    <tr>
	    	<td>&nbsp;</td>
	    	<td>
	    		<div class="form-group">
	    		<label for="advPassword"><fmt:message key="mi.inputsecondpwd"/></label>
	    		<input type="password" name="advPassword" id="advPassword" class="form-control" placeholder="<fmt:message key='mi.second.pwd'/>"/>
	    		</div>
	    	</td>
	    </tr>	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />    				
    				<button class="btn btn-default" type="button" name="cancel" id="cancel" onclick="document.location = 'memberOrders.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
    				<button class="btn btn-success" type="submit" name="submit" id="payBtn"><fmt:message key="mi.surepay"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>


<script type="text/javascript">
$(function() {
	switchOtherAccountType();
});

$("input[name='otherAccountType']").click(function(){
	switchOtherAccountType();
});

function switchOtherAccountType(){
	var theForm=document.memberRegisterForm;
	if(theForm.otherAccountType.value==""){
		$("#discountAmountByA1").prop("disabled",true);
		$("#discountAmountByA2").prop("disabled",true);
	}else if(theForm.otherAccountType.value=="A1"){
		$("#discountAmountByA1").prop("disabled",false);
		$("#discountAmountByA2").prop("disabled",true);
	}else if(theForm.otherAccountType.value=="A2"){
		$("#discountAmountByA1").prop("disabled",true);
		$("#discountAmountByA2").prop("disabled",false);
	}
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	<c:if test="${poOrder.orderType==1 || poOrder.orderType==2 || poOrder.orderType==3 || poOrder.orderType==5}">
	if(theForm.otherAccountType.value=="A1" && (theForm.discountAmountByA1.value=="" || !isUnsignedNumeric(theForm.discountAmountByA1.value))){
		alert("<fmt:message key='plz.input.correct.deductAmt'/>");//请输入正确的抵扣金额
		theForm.discountAmountByA1.focus();
		return false;
	}
	if(theForm.otherAccountType.value=="A2" && (theForm.discountAmountByA2.value=="" || !isUnsignedNumeric(theForm.discountAmountByA2.value))){
		alert("<fmt:message key='plz.input.correct.deductAmt'/>");//请输入正确的抵扣金额
		theForm.discountAmountByA2.focus();
		return false;
	}
	</c:if>

	if (theForm.advPassword.value == '' || theForm.advPassword.value == null) {
		alert("<fmt:message key='member.inputpwd'/>.");
		
		theForm.advPassword.focus();
		return false;
	}

	if (confirm("<fmt:message key="mem.mi.pay.person"/>")) {
		//其它验证
		showLoading();
		return true;
	}
	return false;
}

</script>