<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekAwardDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekAwardDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWeekAward" method="post" action="editBdWeekAward.jhtml" onsubmit="return validateForm(this)" id="bdWeekAwardForm">
    
    <spring:bind path="bdWeekAward.*">
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
    		<th class="required"><fmt:message key="bdWeekAward.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekAward.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekAward.recommendNo"/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.exitTime"/>:</th>
    		<td><form:input path="exitTime" id="exitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.perSell"/>:</th>
    		<td><form:input path="perSell" id="perSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.groupSell"/>:</th>
    		<td><form:input path="groupSell" id="groupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.isRoot"/>:</th>
    		<td><form:input path="isRoot" id="isRoot"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.pass"/>:</th>
    		<td><form:input path="pass" id="pass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.firstName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.lastName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.marketName"/>:</th>
    		<td><form:input path="marketName" id="marketName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.cardType"/>:</th>
    		<td><form:input path="cardType" id="cardType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.recommandLayer"/>:</th>
    		<td><form:input path="recommandLayer" id="recommandLayer"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.acGroupSell"/>:</th>
    		<td><form:input path="acGroupSell" id="acGroupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.star"/>:</th>
    		<td><form:input path="star" id="star"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.nextStar"/>:</th>
    		<td><form:input path="nextStar" id="nextStar"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.activeStatus"/>:</th>
    		<td><form:input path="activeStatus" id="activeStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAward.acPerSell"/>:</th>
    		<td><form:input path="acPerSell" id="acPerSell"/></td>
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
    				<c:if test="${not empty bdWeekAward.id }">
    					<win:power powerCode="deleteBdWeekAward">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdWeekAward')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdWeekAwards.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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