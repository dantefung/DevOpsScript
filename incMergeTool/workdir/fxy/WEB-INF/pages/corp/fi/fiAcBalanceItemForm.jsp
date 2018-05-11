<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcBalanceItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcBalanceItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcBalanceItem" method="post" action="editFiAcBalanceItem.jhtml" onsubmit="return validateForm(this)" id="fiAcBalanceItemForm">
    
    <spring:bind path="fiAcBalanceItem.*">
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
    		<th class="required"><fmt:message key="fiAcBalanceItem.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcBalanceItem.acType"/>:</th>
    		<td><form:input path="acType" id="acType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcBalanceItem.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.orderType"/>:</th>
    		<td><form:input path="orderType" id="orderType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.reason"/>:</th>
    		<td><form:input path="reason" id="reason"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.dealDate"/>:</th>
    		<td><form:input path="dealDate" id="dealDate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.money"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.memo"/>:</th>
    		<td><form:input path="memo" id="memo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.balance"/>:</th>
    		<td><form:input path="balance" id="balance"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.createrCode"/>:</th>
    		<td><form:input path="createrCode" id="createrCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.outCode"/>:</th>
    		<td><form:input path="outCode" id="outCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.bname"/>:</th>
    		<td><form:input path="bname" id="bname"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcBalanceItem.wday"/>:</th>
    		<td><form:input path="wday" id="wday"/></td>
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
    				<c:if test="${not empty fiAcBalanceItem.id }">
    					<win:power powerCode="deleteFiAcBalanceItem">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiAcBalanceItem')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiAcBalanceItems.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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