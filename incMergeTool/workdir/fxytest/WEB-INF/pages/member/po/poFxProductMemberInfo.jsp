<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="po.fxProduct.order"/></title>
  	<meta name="heading" content="<fmt:message key="po.fxProduct.order"/>-<fmt:message key="po.input.memberInfo"/>"/>
</head>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li><b>1.<fmt:message key="po.input.memberInfo"/></b></li>
		<li>2.<fmt:message key="po.input.address"/></li>
		<li>3.<fmt:message key="menu.common.selectProduct"/></li>
		<li>4.<fmt:message key="po.order.info.sure"/></li>
		<li>5.<fmt:message key="po.fxProduct.order.success"/></li>
	</ul>
</c:set>
<div class="contentBody">
    <form:form commandName="miMember" method="post" action="poFxProduct.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm">
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
    		<td colspan="1" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	<tr style="text-align: center;">
    		<td>
    			<fmt:message key="miMember.memberNo"/>:&nbsp;&nbsp;<input name="memberNo" id="memberNo" value="${memberNo}" readonly="readonly"/>
    		</td>
    	</tr>
    	<tr style="text-align: center;">
    		<td colspan="1">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="${strAction }" name="strAction" />
    				<button type="submit" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
    			<!-- <button type="button" name="cancel" onclick="window.location='history.back();'"><fmt:message key="operation.button.cancel"/></button>-->
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
});
function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (theForm.memberNo.value == null || theForm.memberNo.value == '') {
		alert("<fmt:message key='memberNo.required'/>.");
		theForm.memberNo.focus();
		return false;
	}
}
</script>