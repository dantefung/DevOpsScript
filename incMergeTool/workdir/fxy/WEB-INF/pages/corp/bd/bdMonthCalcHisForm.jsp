<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdMonthCalcHisDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdMonthCalcHisDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdMonthCalcHis" method="post" action="editBdMonthCalcHis.jhtml" onsubmit="return validateForm(this)" id="bdMonthCalcHisForm">
    
    <spring:bind path="bdMonthCalcHis.*">
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
    		<th><fmt:message key="bdMonthCalcHis.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthCalcHis.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthCalcHis.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthCalcHis.recommendNo"/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.exitTime"/>:</th>
    		<td><form:input path="exitTime" id="exitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.perSell"/>:</th>
    		<td><form:input path="perSell" id="perSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.star"/>:</th>
    		<td><form:input path="star" id="star"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.bonusTrain"/>:</th>
    		<td><form:input path="bonusTrain" id="bonusTrain"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.isRoot"/>:</th>
    		<td><form:input path="isRoot" id="isRoot"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.pass"/>:</th>
    		<td><form:input path="pass" id="pass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.firstName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.lastName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.marketName"/>:</th>
    		<td><form:input path="marketName" id="marketName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.freezeStatus"/>:</th>
    		<td><form:input path="freezeStatus" id="freezeStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.suspendStatus"/>:</th>
    		<td><form:input path="suspendStatus" id="suspendStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.cardType"/>:</th>
    		<td><form:input path="cardType" id="cardType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.trainPercent"/>:</th>
    		<td><form:input path="trainPercent" id="trainPercent"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.bonusFaa"/>:</th>
    		<td><form:input path="bonusFaa" id="bonusFaa"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.groupStar"/>:</th>
    		<td><form:input path="groupStar" id="groupStar"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.bonusAll"/>:</th>
    		<td><form:input path="bonusAll" id="bonusAll"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.sendMoney"/>:</th>
    		<td><form:input path="sendMoney" id="sendMoney"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.currencyCode"/>:</th>
    		<td><form:input path="currencyCode" id="currencyCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.exchangeRate"/>:</th>
    		<td><form:input path="exchangeRate" id="exchangeRate"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.recommandLayer"/>:</th>
    		<td><form:input path="recommandLayer" id="recommandLayer"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.bonusMoney"/>:</th>
    		<td><form:input path="bonusMoney" id="bonusMoney"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdMonthCalcHis.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.acMonthBonusSell"/>:</th>
    		<td><form:input path="acMonthBonusSell" id="acMonthBonusSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.monthBonusSell"/>:</th>
    		<td><form:input path="monthBonusSell" id="monthBonusSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdMonthCalcHis.sendStatus"/>:</th>
    		<td><form:input path="sendStatus" id="sendStatus"/></td>
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
    				<c:if test="${not empty bdMonthCalcHis.id }">
    					<win:power powerCode="deleteBdMonthCalcHis">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdMonthCalcHis')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdMonthCalcHiss.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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