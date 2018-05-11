<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusAcItemDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusAcItemDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAcItem" method="post" action="editFiBonusAcItem.jhtml" onsubmit="return validateForm(this)" id="fiBonusAcItemForm">
    
    <spring:bind path="fiBonusAcItem.*">
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
    		<th class="required"><fmt:message key="fiBonusAcItem.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiBonusAcItem.bonusType"/>:</th>
    		<td><form:input path="bonusType" id="bonusType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiBonusAcItem.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wyear"/>:</th>
    		<td><form:input path="wyear" id="wyear"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.orderType"/>:</th>
    		<td><form:input path="orderType" id="orderType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.dealDate"/>:</th>
    		<td><form:input path="dealDate" id="dealDate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.currencyCode"/>:</th>
    		<td><form:input path="currencyCode" id="currencyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.money"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.notes"/>:</th>
    		<td><form:input path="notes" id="notes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.balance"/>:</th>
    		<td><form:input path="balance" id="balance"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createrCode"/>:</th>
    		<td><form:input path="createrCode" id="createrCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createrName"/>:</th>
    		<td><form:input path="createrName" id="createrName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.freeze"/>:</th>
    		<td><form:input path="freeze" id="freeze"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.freezeAmt"/>:</th>
    		<td><form:input path="freezeAmt" id="freezeAmt"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.outCode"/>:</th>
    		<td><form:input path="outCode" id="outCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.bname"/>:</th>
    		<td><form:input path="bname" id="bname"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusAcItem.payTime"/>:</th>
    		<td><form:input path="payTime" id="payTime"/></td>
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
    				<c:if test="${not empty fiBonusAcItem.itemId }">
    					<win:power powerCode="deleteFiBonusAcItem">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusAcItem')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusAcItems.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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