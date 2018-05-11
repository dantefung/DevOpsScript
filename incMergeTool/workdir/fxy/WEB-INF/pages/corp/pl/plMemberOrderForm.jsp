<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="plMemberOrderDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="plMemberOrderDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="plMemberOrder" method="post" action="editPlMemberOrder.jhtml" onsubmit="return validateForm(this)" id="plMemberOrderForm">
    
    <spring:bind path="plMemberOrder.*">
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
    		<th><fmt:message key="plMemberOrder.poPv"/>:</th>
    		<td><form:input path="poPv" id="poPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.poAmt"/>:</th>
    		<td><form:input path="poAmt" id="poAmt"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.prPv"/>:</th>
    		<td><form:input path="prPv" id="prPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.prAmt"/>:</th>
    		<td><form:input path="prAmt" id="prAmt"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.totalPv"/>:</th>
    		<td><form:input path="totalPv" id="totalPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.avaluePv"/>:</th>
    		<td><form:input path="avaluePv" id="avaluePv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.hasPass"/>:</th>
    		<td><form:input path="hasPass" id="hasPass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.passTime"/>:</th>
    		<td><form:input path="passTime" id="passTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="plMemberOrder.groupPv"/>:</th>
    		<td><form:input path="groupPv" id="groupPv"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="memberNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty plMemberOrder.memberNo }">
    					<win:power powerCode="deletePlMemberOrder">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PlMemberOrder')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='plMemberOrders.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	showLoading();
	return true;
}
</script>