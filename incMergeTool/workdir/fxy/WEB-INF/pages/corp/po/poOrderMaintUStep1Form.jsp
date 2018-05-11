<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.poMemberUOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.poMemberUOrders"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>

<form:form commandName="miMember" method="post" action="poOrderMaintUStep1.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm">
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
        
    <table class="detail">
    	
    	<tr>
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	<tr>
    		<th class="required">&nbsp;<fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			<input type="text" name="memberNo" value="${newOrderMap.memberNo }">
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="po.new.cardType"/>:</th>
    		<td>
    			<select name="newCardType">
    				<option value=""><fmt:message key="register.us.select.cardtype"/></option>
    				<c:forEach items="${typeList }" var="ttype">
    					<c:if test="${ttype.key!='0' }">
   							<option value="${ttype.key }" <c:if test="${ttype.key==newOrderMap.newCardType  }">selected="selected"</c:if>>${ttype.value }</option>
   						</c:if>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" value="poOrderMaintU" name="strAction" />
    				<button type="submit" class="btn btn-success" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
</form:form>

<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	$("button[name='previous']").button({
        icons: {
            primary: "ui-icon-previous"
        }
    });
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
}
</script>