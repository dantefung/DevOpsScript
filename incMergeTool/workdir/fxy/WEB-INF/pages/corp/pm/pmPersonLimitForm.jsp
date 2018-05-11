<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmPersonLimitDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmPersonLimitDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmPersonLimit" method="post" action="editPmPersonLimit.jhtml" onsubmit="return validateForm(this)" id="pmPersonLimitForm">
    
    <spring:bind path="pmPersonLimit.*">
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
    		<th class="required"><fmt:message key="pmPersonLimit.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmPersonLimit.productCode"/>:</th>
    		<td><form:input path="productCode" id="productCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmPersonLimit.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmPersonLimit.allowedQty"/>:</th>
    		<td><form:input path="allowedQty" id="allowedQty"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmPersonLimit.remainQty"/>:</th>
    		<td><form:input path="remainQty" id="remainQty"/></td>
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
    				<c:if test="${not empty pmPersonLimit.id }">
    					<win:power powerCode="deletePmPersonLimit">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PmPersonLimit')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pmPersonLimits.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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