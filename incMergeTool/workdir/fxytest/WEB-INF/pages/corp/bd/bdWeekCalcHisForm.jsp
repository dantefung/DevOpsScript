<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekCalcHisDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekCalcHisDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWeekCalcHis" method="post" action="editBdWeekCalcHis.jhtml" onsubmit="return validateForm(this)" id="bdWeekCalcHisForm">
    
    <spring:bind path="bdWeekCalcHis.*">
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
    		<th><fmt:message key="bdWeekCalcHis.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekCalcHis.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekCalcHis.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekCalcHis.recommendNo"/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.exitTime"/>:</th>
    		<td><form:input path="exitTime" id="exitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.perSell"/>:</th>
    		<td><form:input path="perSell" id="perSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.groupSell"/>:</th>
    		<td><form:input path="groupSell" id="groupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.bonusSell"/>:</th>
    		<td><form:input path="bonusSell" id="bonusSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.isRoot"/>:</th>
    		<td><form:input path="isRoot" id="isRoot"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.pass"/>:</th>
    		<td><form:input path="pass" id="pass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.firstName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.lastName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.marketName"/>:</th>
    		<td><form:input path="marketName" id="marketName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.cardType"/>:</th>
    		<td><form:input path="cardType" id="cardType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.bonusAll"/>:</th>
    		<td><form:input path="bonusAll" id="bonusAll"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.sendMoney"/>:</th>
    		<td><form:input path="sendMoney" id="sendMoney"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.currencyCode"/>:</th>
    		<td><form:input path="currencyCode" id="currencyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.exchangeRate"/>:</th>
    		<td><form:input path="exchangeRate" id="exchangeRate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.recommandLayer"/>:</th>
    		<td><form:input path="recommandLayer" id="recommandLayer"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.bonusMoney"/>:</th>
    		<td><form:input path="bonusMoney" id="bonusMoney"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.acGroupSell"/>:</th>
    		<td><form:input path="acGroupSell" id="acGroupSell"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekCalcHis.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.maxBonusSell"/>:</th>
    		<td><form:input path="maxBonusSell" id="maxBonusSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.sendStatus"/>:</th>
    		<td><form:input path="sendStatus" id="sendStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.perResellPv"/>:</th>
    		<td><form:input path="perResellPv" id="perResellPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.blGroupPv"/>:</th>
    		<td><form:input path="blGroupPv" id="blGroupPv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekCalcHis.lastBlGroupPv"/>:</th>
    		<td><form:input path="lastBlGroupPv" id="lastBlGroupPv"/></td>
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
    				<c:if test="${not empty bdWeekCalcHis.id }">
    					<win:power powerCode="deleteBdWeekCalcHis">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdWeekCalcHis')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdWeekCalcHiss.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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