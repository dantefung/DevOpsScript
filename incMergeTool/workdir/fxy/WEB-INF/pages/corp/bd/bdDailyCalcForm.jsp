<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdDailyCalcDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdDailyCalcDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdDailyCalc" method="post" action="editBdDailyCalc.jhtml" onsubmit="return validateForm(this)" id="bdDailyCalcForm">
    
    <spring:bind path="bdDailyCalc.*">
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
    		<th class="required"><fmt:message key="bdDailyCalc.wday"/>:</th>
    		<td><form:input path="wday" id="wday"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdDailyCalc.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdDailyCalc.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdDailyCalc.recommendNo"/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.exitTime"/>:</th>
    		<td><form:input path="exitTime" id="exitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.perSell"/>:</th>
    		<td><form:input path="perSell" id="perSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.groupSell"/>:</th>
    		<td><form:input path="groupSell" id="groupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.isRoot"/>:</th>
    		<td><form:input path="isRoot" id="isRoot"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.pass"/>:</th>
    		<td><form:input path="pass" id="pass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.firstName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.lastName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.marketName"/>:</th>
    		<td><form:input path="marketName" id="marketName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.cardType"/>:</th>
    		<td><form:input path="cardType" id="cardType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.currencyCode"/>:</th>
    		<td><form:input path="currencyCode" id="currencyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.exchangeRate"/>:</th>
    		<td><form:input path="exchangeRate" id="exchangeRate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.recommandLayer"/>:</th>
    		<td><form:input path="recommandLayer" id="recommandLayer"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.acGroupSell"/>:</th>
    		<td><form:input path="acGroupSell" id="acGroupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.acPerSell"/>:</th>
    		<td><form:input path="acPerSell" id="acPerSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusSell"/>:</th>
    		<td><form:input path="bonusSell" id="bonusSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusAll"/>:</th>
    		<td><form:input path="bonusAll" id="bonusAll"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusMoney"/>:</th>
    		<td><form:input path="bonusMoney" id="bonusMoney"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusSend"/>:</th>
    		<td><form:input path="bonusSend" id="bonusSend"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.activeStatus"/>:</th>
    		<td><form:input path="activeStatus" id="activeStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.feeService"/>:</th>
    		<td><form:input path="feeService" id="feeService"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.deductAmount"/>:</th>
    		<td><form:input path="deductAmount" id="deductAmount"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusService"/>:</th>
    		<td><form:input path="bonusService" id="bonusService"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.bonusAd"/>:</th>
    		<td><form:input path="bonusAd" id="bonusAd"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.deductFreeze"/>:</th>
    		<td><form:input path="deductFreeze" id="deductFreeze"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.star"/>:</th>
    		<td><form:input path="star" id="star"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.nextStar"/>:</th>
    		<td><form:input path="nextStar" id="nextStar"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.acDeductFreeze"/>:</th>
    		<td><form:input path="acDeductFreeze" id="acDeductFreeze"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdDailyCalc.acJfSale"/>:</th>
    		<td><form:input path="acJfSale" id="acJfSale"/></td>
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
    				<c:if test="${not empty bdDailyCalc.id }">
    					<win:power powerCode="deleteBdDailyCalc">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdDailyCalc')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdDailyCalcs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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