<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>收益帐户管理</title>
    <meta name="heading" content="收益帐户管理"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAcBalance" method="post" action="editFiBonusAcBalance.jhtml" onsubmit="return validateForm(this)" id="fiBonusAcBalanceForm">
    
    <spring:bind path="fiBonusAcBalance.*">
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
			<th width="150"><fmt:message key="bdReconsumMoneyReport.company" /></th>
			<td>${fiBonusAcBalance.companyCode }</td>
		</tr>

		<tr>
			<th><fmt:message key="fiPayAdvice.userCode" /></th>
			<td>${fiBonusAcBalance.memberNo }</td>
		</tr>

		<tr>
			<th><fmt:message key="fi.status" /></th>
			<td><win:list name="status" listCode="bonus_account_status" value="${fiBonusAcBalance.status }" defaultValue="1" /></td>
		</tr>

		<tr>
			<th><fmt:message key="bonus.send.percent" /></th>
			<td><form:input path="sendPercent" id="sendPercent" size="10" />%</td>
		</tr>

		<tr>
			<th><fmt:message key="bonus.send.lowest" /></th>
			<td><form:input path="sendLow" id="sendLow" size="10" /></td>
		</tr>
		
		<tr>
			<th><fmt:message key="busi.common.remark" /></th>
			<td><form:textarea path="remark" cols="70" rows="4"/></td>
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
    				<button type="button" name="cancel" onclick="window.location='manageFiBonusAc.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.sendPercent.value=="" || !isUnsignedInteger(theForm.sendPercent.value) || theForm.sendPercent.value>100){
		alert("<fmt:message key="info.please.input.correct.proportion"/>");
		theForm.sendPercent.focus();
		return false;
	}
	
	if(theForm.sendLow.value=="" || !isUnsignedNumeric(theForm.sendLow.value)){
		alert("<fmt:message key="info.input.min.amount"/>");
		theForm.sendLow.focus();
		return false;
	}

	if(theForm.openBank.value==""){
		alert("<fmt:message key="register.us.select.openBank"/>");
		theForm.openBank.focus();
		return false;
	}
	if(theForm.bcity.value==""){
		alert("<fmt:message key="info.bank.city.required"/>");
		theForm.bcity.focus();
		return false;
	}
	if(theForm.bname.value==""){
		alert("<fmt:message key="register.us.select.bname"/>");
		theForm.bname.focus();
		return false;
	}
	if(theForm.bnum.value==""){
		alert("<fmt:message key="register.us.select.bnum"/>");
		theForm.bnum.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>