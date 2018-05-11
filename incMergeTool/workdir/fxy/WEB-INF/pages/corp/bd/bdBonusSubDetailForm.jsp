<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdBonusSubDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="bdBonusSubDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSubDetail" method="post" action="editBdBonusSubDetail.jhtml" onsubmit="return validateForm(this)" id="bdBonusSubDetailForm">
    
    <spring:bind path="bdBonusSubDetail.*">
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
    		<th><fmt:message key="bdBonusSubDetail.wmonth"/>:</th>
    		<td><form:input path="wmonth" id="wmonth"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="bdBonusSubDetail.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.bonusType"/>:</th>
    		<td><form:input path="bonusType" id="bonusType"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.money"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.pv"/>:</th>
    		<td><form:input path="pv" id="pv"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.bonusPoint"/>:</th>
    		<td><form:input path="bonusPoint" id="bonusPoint"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.recommendCode"/>:</th>
    		<td><form:input path="recommendCode" id="recommendCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bdBonusSubDetail.algebras"/>:</th>
    		<td><form:input path="algebras" id="algebras"/></td>
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
    				<c:if test="${not empty bdBonusSubDetail.id }">
    					<win:power powerCode="deleteBdBonusSubDetail">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdBonusSubDetail')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdBonusSubDetails.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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