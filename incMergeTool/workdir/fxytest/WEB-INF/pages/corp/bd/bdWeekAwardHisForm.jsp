<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekAwardHisDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekAwardHisDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdWeekAwardHis" method="post" action="editBdWeekAwardHis.jhtml" onsubmit="return validateForm(this)" id="bdWeekAwardHisForm">
    
    <spring:bind path="bdWeekAwardHis.*">
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
    		<th class="required"><fmt:message key="bdWeekAwardHis.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekAwardHis.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdWeekAwardHis.recommendNo"/>:</th>
    		<td><form:input path="recommendNo" id="recommendNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.exitTime"/>:</th>
    		<td><form:input path="exitTime" id="exitTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.perSell"/>:</th>
    		<td><form:input path="perSell" id="perSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.groupSell"/>:</th>
    		<td><form:input path="groupSell" id="groupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.isRoot"/>:</th>
    		<td><form:input path="isRoot" id="isRoot"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.pass"/>:</th>
    		<td><form:input path="pass" id="pass"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.firstName"/>:</th>
    		<td><form:input path="firstName" id="firstName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.lastName"/>:</th>
    		<td><form:input path="lastName" id="lastName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.marketName"/>:</th>
    		<td><form:input path="marketName" id="marketName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.cardType"/>:</th>
    		<td><form:input path="cardType" id="cardType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.recommandLayer"/>:</th>
    		<td><form:input path="recommandLayer" id="recommandLayer"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.petName"/>:</th>
    		<td><form:input path="petName" id="petName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.acGroupSell"/>:</th>
    		<td><form:input path="acGroupSell" id="acGroupSell"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.linkNo"/>:</th>
    		<td><form:input path="linkNo" id="linkNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.wweek"/>:</th>
    		<td><form:input path="wweek" id="wweek"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.star"/>:</th>
    		<td><form:input path="star" id="star"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.nextStar"/>:</th>
    		<td><form:input path="nextStar" id="nextStar"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.activeStatus"/>:</th>
    		<td><form:input path="activeStatus" id="activeStatus"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdWeekAwardHis.acPerSell"/>:</th>
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
    				<c:if test="${not empty bdWeekAwardHis.id }">
    					<win:power powerCode="deleteBdWeekAwardHis">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdWeekAwardHis')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdWeekAwardHiss.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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