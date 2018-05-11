<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdBonusSubDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdBonusSubDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSub" method="post" action="editBdBonusSub.jhtml" onsubmit="return validateForm(this)" id="bdBonusSubForm">
    
    <spring:bind path="bdBonusSub.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdBonusSub.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdBonusSub.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdBonusSub.bonusType"/>:</th>
    		<td><form:input path="bonusType" id="bonusType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.money"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.pv"/>:</th>
    		<td><form:input path="pv" id="pv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.bonusPoint"/>:</th>
    		<td><form:input path="bonusPoint" id="bonusPoint"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.recommendCode"/>:</th>
    		<td><form:input path="recommendCode" id="recommendCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.algebras"/>:</th>
    		<td><form:input path="algebras" id="algebras"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.plateId"/>:</th>
    		<td><form:input path="plateId" id="plateId"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.plateType"/>:</th>
    		<td><form:input path="plateType" id="plateType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.pid"/>:</th>
    		<td><form:input path="pid" id="pid"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.directNum"/>:</th>
    		<td><form:input path="directNum" id="directNum"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.roleType"/>:</th>
    		<td><form:input path="roleType" id="roleType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.leaderTimes"/>:</th>
    		<td><form:input path="leaderTimes" id="leaderTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.deputyTimes"/>:</th>
    		<td><form:input path="deputyTimes" id="deputyTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.backTimes"/>:</th>
    		<td><form:input path="backTimes" id="backTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.circleTimes"/>:</th>
    		<td><form:input path="circleTimes" id="circleTimes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.notes"/>:</th>
    		<td><form:input path="notes" id="notes"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSub.sendTime"/>:</th>
    		<td><form:input path="sendTime" id="sendTime"/></td>
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
    				<c:if test="${not empty bdBonusSub.id }">
    					<win:power powerCode="deleteBdBonusSub">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdBonusSub')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdBonusSubs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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