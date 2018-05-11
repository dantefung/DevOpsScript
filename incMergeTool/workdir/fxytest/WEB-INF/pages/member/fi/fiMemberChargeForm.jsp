<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fi.zhcz"/></title>
    <meta name="heading" content="<fmt:message key="fi.zhcz"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<%
request.setAttribute("vEnter", "\n");
%>

<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/payment.css" type="text/css"/>

<form:form commandName="fiOnlinePayLog" method="post" action="handleFiCharge.jhtml" onsubmit="return validateForm(this)" name="fiOnlinePayLogForm" id="fiOnlinePayLogForm" cssClass="form-horizontal"> 
    <form:hidden path="id"/>
    <spring:bind path="fiOnlinePayLog.*">
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
    
    <p class="text-muted"><fmt:message key="item.in.bold.required"/></p>
	<hr/>
	
	<div class="row">
		<div class="col-md-12">
			<div class="form-group form-group-sm">
		    	<label class="col-sm-2 control-label required"><fmt:message key="miMember.memberNo"/>:</label>
		    	<div class="col-sm-10 form-control-static">
		    		${fiOnlinePayLog.buyerCode }
		    	</div>
			</div>
			
			<div class="form-group form-group-sm">
		    	<label class="col-sm-2 control-label required"><fmt:message key="fi.czje"/>:</label>
		    	<div class="col-sm-4">
		    		<input class="form-control input-sm"  maxlength="10" name="chargeMoney" id="chargeMoney" onfocus="if(Number(this.value)==0){this.value='';}" value="${param.chargeMoney }"/>
		    	</div>
			</div>
			
			<div class="form-group form-group-sm">
		    	<label class="col-sm-2 control-label required"><fmt:message key="busi.order.payMode"/>:</label>
		    	<div class="col-sm-10">
    				<c:set var="loopCount" value="0"/>
    				<c:forEach items="${onlinePayments}" var="onlinePaymentVar">
    					<div class="radio payment">
    						<label class="paymentLogo ${onlinePaymentVar.paymentCode }">
    							<input type="radio" class="paymentCode" name="paymentCode" id="paymentCode${onlinePaymentVar.paymentId}" value="${onlinePaymentVar.paymentCode }"<c:if test="${loopCount==0}"> checked</c:if>/>
    						</label>
    						<p class="help-block">
    						${fn:replace(onlinePaymentVar.paymentDesc, vEnter, '<br>')}
    						</p>
    						
    						<c:if test="${onlinePaymentVar.paymentCode=='ump' }">
    							<div class="row bank-list">
	    							<c:forEach items="${umpB2cbanks }" var="umpB2cbankVar">
	    								<div class="col-md-3">
	    									<label>
	    										<div class="checkFlag active"><i class="fa fa-check fa-2" aria-hidden="true"></i></div>
	    										<input type="radio" name="gateId" value="${umpB2cbankVar.key }"><fmt:message key="${umpB2cbankVar.value }"/>
	    									</label>
	    								</div>
	    							</c:forEach>
    							</div>
    						</c:if>
    						
    						<c:if test="${onlinePaymentVar.paymentCode=='ump-scancode' }">
    							<div class="row scancode-type-list">
	    							<c:forEach items="${umpScancodeTypes }" var="umpScancodeTypeVar">
	    								<div class="col-md-3">
	    									<label>
	    										<div class="checkFlag active"><i class="fa fa-check fa-2" aria-hidden="true"></i></div>
	    										<input type="radio" name="scancodeType" value="${umpScancodeTypeVar.key }"><fmt:message key="${umpScancodeTypeVar.value }"/>
	    									</label>
	    								</div>
	    							</c:forEach>
    							</div>
    						</c:if>
    					</div>
    					<c:set var="loopCount" value="${loopCount+1 }"/>
    				</c:forEach>
		    	</div>
			</div>
			
			<hr/>
			<div class="form-group form-group-sm">
				<div class="col-sm-12 text-center">
  					<button type="submit" class="btn btn-info" name="submit" onclick="bCancel=false"><fmt:message key="fi.qrcz"/></button>
				</div>
			</div>
		</div>
	</div>

</form:form>

<script type="text/javascript">
$(document).ready(function(){
	switchPaymentShow();
});

$("input[name=paymentCode]").click(function(e) {
	switchPaymentShow();
});

$("input[name=gateId]").click(function(e) {
	$(".checkFlag").css("display","none");
	$(this).prev().css("display","inline");
});

$("input[name=scancodeType]").click(function(e) {
	$(".checkFlag").css("display","none");
	$(this).prev().css("display","inline");
});

function switchPaymentShow(){
	var theForm=document.fiOnlinePayLogForm;
	if(theForm.paymentCode.value=='ump'){
		$(".bank-list").css("display","");
		$(".scancode-type-list").css("display","none");
	}else if(theForm.paymentCode.value=='ump-scancode'){
		$(".bank-list").css("display","none");
		$(".scancode-type-list").css("display","");
	}else{
		$(".bank-list").css("display","none");
		$(".scancode-type-list").css("display","none");
	}
}

function validateForm(theForm) {	
	var reg	= new RegExp(/^\d*\.?\d{0,2}$/);

	if (!reg.test(theForm.chargeMoney.value)){
		alert("<fmt:message key='fi.checkczje'/>");
		theForm.chargeMoney.focus();
		return false;
	}

	if (Number(theForm.chargeMoney.value) < 0.01) {
		alert("<fmt:message key='fi.czjezx'/>");
		
		theForm.chargeMoney.focus();
		return false;
	}

	//其它验证
	showLoading();
	return true;
}

</script>