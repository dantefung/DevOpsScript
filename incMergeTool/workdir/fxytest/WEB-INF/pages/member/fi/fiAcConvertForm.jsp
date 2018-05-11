<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.memberEditFiAcConvert"/></title>
    <meta name="heading" content="<fmt:message key="menu.memberEditFiAcConvert"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<ul class="nav nav-tabs">
	<li role="presentation" class="active">
		<a href="editFiAcConvert.jhtml?strAction=memberEditFiAcConvert"><fmt:message key="menu.memberEditFiAcConvert"/></a>
	</li>
	<li role="presentation">
		<a href="fiAcConverts.jhtml"><fmt:message key="label.history.records"/></a>
	</li>
</ul>

<form:form commandName="fiAcTrans" method="post" action="editFiAcConvert.jhtml" onsubmit="return validateForm(this)" id="sysUserForm" name="sysUserForm">
<div class="contentBody">
    <spring:bind path="fiAcTrans.*">
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
    		<th>&nbsp;</th>
    		<td>
    			<span class="form-tips">
    				<fmt:message key="item.in.bold.required"/>
    			</span>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.fi.out.account"/>：</th>
    		<td><b>${sessionScope.sessionLoginUser.userCode }</b></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fi.lable.account.type"/>：</th>
    		<td>
   				<c:forEach items="${fiAcBalances }" var="fiAcBalanceVar">
   					<c:if test="${fiAcBalanceVar.ac_type=='B1'}">
   						<div class="radio">
   							<label>
   								<input type="radio" name="outAcType" id="outAcType_${fiAcBalanceVar.ac_type }" value="${fiAcBalanceVar.ac_type }"<c:if test="${fiAcBalanceVar.ac_type==fiAcTrans.outAcType}"> checked</c:if>/>
   								<win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
   								<br><fmt:message key="fi.userBalance"/>：<span class="redFont"><fmt:formatNumber value="${fiAcBalanceVar.balance }" type="number" pattern="###,###,##0.00"/></span>
   								<br/><fmt:message key="less.than100"/>
   							</label>
   						</div>
   					</c:if>
   				</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="label.fi.out.coin"/>：</th>
    		<td>
    			<form:input path="outMoney" cssClass="form-control input-sm" onchange="calcInMoney();"/>
    		</td>
    	</tr>
    	<tr>
			<th><fmt:message key="label.fi.in.account.type"/>：</th>
			<td><span id="inAcTypeName"><fmt:message key="label.account.type.A2"/></span></td>
		</tr>
		<tr>
			<th><fmt:message key="label.fi.in.coin.amount"/>：</th>
			<td><span id="inMoney"></span></td>
		</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.second.pwd"/>：</th>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>：</th>
    		<td>
    			<form:textarea path="memo" rows="6" cols="50" class="form-control input-sm"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="memberEditFiAcConvert"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="operation.button.confirm"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>
</form:form>
<script type="text/javascript">
$("#inMemberNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$("input[name='outAcType']").click(function(e) {     
	calcInMoney();
}); 

$(function() {
	calcInMoney();
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.outAcType.value==""){
		alert("<fmt:message key="info.choose.out.account.type"/>");
		return false;
	}
	
	if(theForm.outMoney.value=="" || !isUnsignedInteger(theForm.outMoney.value) || parseInt(theForm.outMoney.value)<=0){
		alert("<fmt:message key="info.please.input.correct.number"/>");
		theForm.outMoney.focus();
		return false;
	}
	if(theForm.advPassword.value==""){
		alert("<fmt:message key='member.inputpwd'/>");
		theForm.advPassword.focus();
		return false;
	}
	
	if(confirm("<fmt:message key="info.sure.convert"/>?")){
		showLoading();
		return true;
	}else {
		return false;
	}
}

function calcInMoney(){
	var outMoney=$("#outMoney").val();
	var outAcType=document.sysUserForm.outAcType.value;
	var rate=1;
	var inAcTypeName="<fmt:message key="label.account.type.A2"/>";
	if(outAcType=='A0'){
		rate="${scValueDaily.scValue}";
		inAcTypeName="<fmt:message key="label.account.type.B3"/>";
	}else if(outAcType=='B1'){
		inAcTypeName="<fmt:message key="label.account.type.A0"/>";
	}
	$("#inAcTypeName").html(inAcTypeName);
	if(!isUnsignedNumeric(outMoney) || !isUnsignedNumeric(rate)){
		$("#inMoney").html("N/A");
		return;
	}
	$("#inMoney").html((outMoney/rate).toFixed(5));
}

</script>