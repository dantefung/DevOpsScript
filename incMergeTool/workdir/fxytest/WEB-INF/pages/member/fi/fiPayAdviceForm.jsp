<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.member.fi.pay.advice"/></title>
    <meta name="heading" content="<fmt:message key="menu.member.fi.pay.advice"/>"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlCurrencyAjax.js"></script>
</head>

<script type="text/javascript" src="${ctx}/scripts/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap-datepicker.min.css" />
<script type="text/javascript" src="${ctx}/scripts/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<script type="text/javascript" src="${ctx}/scripts/bootstrap.file-input.js"></script>

<ul class="nav nav-tabs">
	<li role="presentation" class="active">
		<a href="editFiPayAdvice.jhtml?strAction=memberAddFiPayAdvice"><fmt:message key="menu.member.fi.pay.advice"/></a>
	</li>
	<li role="presentation">
		<a href="fiPayAdvices.jhtml"><fmt:message key="label.history.records"/></a>
	</li>
</ul>

<div class="contentBody">
	<br/>
	<p class="text-muted">
		<fmt:message key="info.pay.advice.tips.1"/>
	</p>
    <form:form commandName="fiPayAdvice" method="post" action="editFiPayAdvice.jhtml" onsubmit="return validateForm(this)" id="fiPayAdviceForm" name="fiPayAdviceForm" enctype="multipart/form-data">
	    <spring:bind path="fiPayAdvice.*">
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
	    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
	    <table class="detail">
	    	<tr>
	    		<th class="required"><fmt:message key="label.recieve.money.account"/>:</th>
	    		<td>
	    			<form:select path="fiBankId" cssClass="form-control input-sm">
	    				<c:forEach items="${fiBanks }" var="fiBankVar">
	    					<form:option value="${fiBankVar.id }">
	    						${fiBankVar.bankCode }（************${fn:substring(fiBankVar.accountNo, fn:length(fiBankVar.accountNo)-4, fn:length(fiBankVar.accountNo))} **${fn:substring(fiBankVar.accountName, fn:length(fiBankVar.accountName)-1, fn:length(fiBankVar.accountName))}）
	    					</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="bdSendRecord.openBank"/>:</th>
	    		<td>
	    			<win:list name="bankCode" listCode="bankcodes" defaultValue="" value="${fiPayAdvice.bankCode }" styleClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="mi.lable.branchName"/>:</th>
	    		<td>
	    			<form:input path="bankBranch" cssClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="label.fi.pay.advice.account.no"/>:</th>
	    		<td>
	    			<form:input path="accountNo" cssClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="bdSendRecordToBankReport.bankNameCH"/>:</th>
	    		<td>
	    			<form:input path="accountName" cssClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="bdSendRecord.money"/>:</th>
	    		<td>
	    			<form:select path="currency" cssClass="form-control" onchange="calcScQty();">
	    				<c:forEach items="${alCurrencys }" var="alCurrencyVar">
	    					<form:option value="${alCurrencyVar.currency_code }">${alCurrencyVar.currency_name }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="bdSendRecord.remittanceMoney"/>:</th>
	    		<td>
	    			<form:input path="payAmount" cssClass="form-control input-sm" onchange="calcScQty();"/>
	    		</td>
	    	</tr>
	    	<tr style="display: none;">
	    		<th><fmt:message key="bdNetWorkCostReport.rateCH"/>:</th>
	    		<td>
	    			<span id="scValue"></span>
	    		</td>
	    	</tr>
	    	<tr style="display: none;">
	    		<th><fmt:message key="label.pay.in.money"/>:</th>
	    		<td>
	    			<span id="scQty"></span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="fiPayAdvice.send.date"/>:</th>
	    		<td>
	    			<div class="input-group date">
	    				<form:input path="payDate" cssClass="form-control input-sm"/><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
	    			</div>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="fi.remit.orderNo"/>:</th>
	    		<td>
	    			<form:input path="remitNo" cssClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="alCompany.phone"/>:</th>
	    		<td>
	    			<form:input path="mobile" cssClass="form-control input-sm"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.common.remark"/>:</th>
	    		<td><form:textarea path="remark" id="remark" rows="6" cssClass="form-control input-sm" /></td>
	    	</tr>
	    	<tr>
	    		<th>附件:</th>
	    		<td><input type="file" name="newFile" id="newFile"/></td>
	    	</tr>
	    	<tr>
	    		<th>&nbsp;</th>
	    		<td>
	    			<fmt:message key="mi.uploadFile.layout"/>:
	    			<c:forEach items="${allowedUploadFileTypes }" var="fileTypeVar">${fileTypeVar}&nbsp;</c:forEach>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<form:hidden path="adviceCode"/>
	    				<input type="hidden" name="strAction" value="memberAddFiPayAdvice"/>
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<button type="submit" name="save" onclick="bCancel=false" class="btn btn-success col-md-6 col-md-offset-3 col-xs-12"><fmt:message key="label.submit.fi.pay.advice"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$('#newFile').bootstrapFileInput();
	$( "#payDate" ).datepicker({
		language: "zh-CN",
		todayBtn: "linked",
		format: "yyyy-mm-dd"
	});
	calcScQty();
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.fiBankId.value==""){
		alert("<fmt:message key="info.please.select.recieve.account"/>");
		return false;
	}
	if(theForm.bankCode.value==""){
		alert("<fmt:message key="info.select.pay.bank"/>");
		return false;
	}
	if(theForm.bankBranch.value==""){
		alert("<fmt:message key="prompt.branchName.null.require"/>");
		theForm.bankBranch.focus();
		return false;
	}
	if(theForm.accountNo.value==""){
		alert("<fmt:message key="info.input.pay.account"/>");
		theForm.accountNo.focus();
		return false;
	}
	if(theForm.accountName.value==""){
		alert("<fmt:message key="register.us.select.bname"/>");
		theForm.accountName.focus();
		return false;
	}
	if(theForm.payAmount.value=="" || !isUnsignedNumeric(theForm.payAmount.value)){
		alert("<fmt:message key="info.input.pay.advice.amount"/>");
		theForm.payAmount.focus();
		return false;
	}
	if(theForm.payDate.value==""){
		alert("<fmt:message key="info.pay.advice.date.required"/>");
		theForm.payDate.focus();
		return false;
	}
	if(theForm.mobile.value==""){
		alert("<fmt:message key="register.us.select.phone"/>");
		theForm.mobile.focus();
		return false;
	}

	showLoading();
	return true;
}

function calcScQty(){
	var theFrom=document.fiPayAdviceForm;
	var payAmount=theFrom.payAmount.value;
	var currency=theFrom.currency.value;
	if(payAmount=="" || !isUnsignedNumeric(payAmount)){
		$("#scQty").html("N/A");
		return;
	}
	AlCurrencyAjax.getInRate(currency,function(data) {
		if(data!=null){
			$("#scValue").html(parseFloat(data).toFixed(5));
			$("#scQty").html((payAmount*data).toFixed(5));
		}else{
			$("#scValue").html("N/A");
			$("#scQty").html("N/A");
		}
	});
}
</script>