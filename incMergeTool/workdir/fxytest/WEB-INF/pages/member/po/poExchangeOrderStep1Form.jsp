<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="po.returnOrder"/></title>
	<meta name="heading" content="<fmt:message key="po.returnOrder"/>"/>
</head>

<form:form commandName="miMember" method="post" action="poExchangeOrderStep1.jhtml"  name="miMemberForm" id="miMemberForm" cssClass="form-horizontal" onsubmit="return validateForm(this);">
    <spring:bind path="miMember.*">
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
    
    <p class="text-muted"><fmt:message key="item.in.bold.required"/></p>
	<fmt:message key="mi.mustred"/>
	<hr/>
	
	<div class="row">
		<div class="col-md-7">
			<div class="form-group ">
		    	<label class="col-sm-3 control-label required "><fmt:message key="miMember.memberNo"/>:</label>
		    	<div class="col-sm-9 form-control-static">
		    		${newOrderMap.memberNo }
    				<input type="hidden" name="memberNo" id="memberNo" value="${newOrderMap.memberNo }">
		    	</div>
			</div>
			
			<hr/>
			<div class="form-group form-group-sm">
				<div class="col-sm-12 text-center">
  					<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="${param.strAction }" name="strAction" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				<button type="submit" name="next" class="btn btn-success" onclick="bCancel=false;"><fmt:message key="button.next"/></button>
				</div>
			</div>
		</div>
	</div>

    
</form:form>

<script type="text/javascript">
$("#memberNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(function() {

});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return false;
	}
	if (theForm.memberNo.value=="") {
		alert("<fmt:message key='memberNo.required'/>.");
		theForm.memberNo.focus();
		return false;
	}

	showLoading();
	return true;
}

</script>