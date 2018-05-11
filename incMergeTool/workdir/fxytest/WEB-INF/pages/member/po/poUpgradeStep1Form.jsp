<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.poMemberUOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.poMemberUOrders"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<form:form commandName="miMember" method="post" action="poUpgradeStep1.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm" cssClass="form-horizontal">
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
			<div class="form-group form-group-sm">
		    	<label class="col-sm-3 control-label required"><fmt:message key="po.new.cardType"/>:</label>
		    	<div class="col-sm-9">
		    		<select name="newCardType" class="form-control">
	    				<option value=""><fmt:message key="register.us.select.cardtype"/></option>
	    				<c:forEach items="${typeList }" var="ttype">
	    					<c:if test="${ttype.key!='0' && ttype.key!='10' }">
	   							<option value="${ttype.key }" <c:if test="${ttype.key==newOrderMap.newCardType  }">selected="selected"</c:if>>${ttype.value }</option>
	   						</c:if>
	    				</c:forEach>
	    			</select>
		    	</div>
			</div>
			<div class="form-group form-group-sm">
				<label class="col-sm-3 control-label required">服务中心:</label>
				<div class="col-sm-9">
					<div class="input-group input-group-sm">
						<input name="ttLinkNo" id="ttLinkNo" class="form-control"/>
						<div class="input-group-btn">
							<button type="button" name="showAgentNameBtn" class="btn btn-info"
									onclick="showName(this.form.ttLinkNo.value,'agentName');"
									title="<fmt:message key="miMember.recommendName"/>">
								<i class="fa fa-check" aria-hidden="true"></i>
							</button>
						</div>
						<span class="input-group-addon glyphicon" id="agentName" aria-hidden="true"></span>
					</div>
				</div>
			</div>
			<hr/>
			<div class="form-group form-group-sm">
				<div class="col-sm-12 text-center">
  					<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="poUpgrade" name="strAction" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				<button type="submit" class="btn btn-success" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
				</div>
			</div>
		</div>
	</div>
    
</form:form>

<script type="text/javascript">
$("#memberNo,#agentNo").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(function() {

});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (theForm.memberNo.value == null || theForm.memberNo.value == '') {
		alert("<fmt:message key='memberNo.required'/>");
		theForm.memberNo.focus();
		return false;
	}
	
	if (theForm.newCardType.value == null || theForm.newCardType.value == '') {
		alert("<fmt:message key='info.select.new.card.type'/>.");
		theForm.newCardType.focus();
		return false;
	}
    if (theForm.ttLinkNo.value == "") {
        alert("<fmt:message key="请填写服务中心"/>.");
        return false;
    }
	
	showLoading();
	return true;
}
function showName(val, showDiv) {
    MiMemberAjax.getMiMemberInfo(val, function (data) {
        if (data != null) {
            document.getElementById(showDiv).innerHTML = data.lastName;
        }
    });
}
</script>