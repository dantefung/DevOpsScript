<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alRateAdjustItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="alRateAdjustItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="alRateAdjustItem" method="post" action="editAlRateAdjustItem.jhtml" onsubmit="return validateForm(this)" id="alRateAdjustItemForm">
    
    <spring:bind path="alRateAdjustItem.*">
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
    		<th><fmt:message key="alRateAdjustItem.adjustCode"/>:</th>
    		<td><form:input path="adjustCode" id="adjustCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alRateAdjustItem.currencyCode"/>:</th>
    		<td><form:input path="currencyCode" id="currencyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alRateAdjustItem.rate"/>:</th>
    		<td><form:input path="rate" id="rate"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="itemId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty alRateAdjustItem.itemId }">
    					<win:power powerCode="deleteAlRateAdjustItem">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'AlRateAdjustItem')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='alRateAdjustItems.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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