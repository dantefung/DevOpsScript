<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcTransDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcTransDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcTrans" method="post" action="editFiAcTrans.jhtml" onsubmit="return validateForm(this)" id="fiAcTransForm">
    
    <spring:bind path="fiAcTrans.*">
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
    		<th class="required"><fmt:message key="fiAcTrans.tranNo"/>:</th>
    		<td><form:input path="tranNo" id="tranNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.outAcType"/>:</th>
    		<td><form:input path="outAcType" id="outAcType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.outCompanyCode"/>:</th>
    		<td><form:input path="outCompanyCode" id="outCompanyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.outMemberNo"/>:</th>
    		<td><form:input path="outMemberNo" id="outMemberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.outCurrency"/>:</th>
    		<td><form:input path="outCurrency" id="outCurrency"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.outRate"/>:</th>
    		<td><form:input path="outRate" id="outRate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.outMoney"/>:</th>
    		<td><form:input path="outMoney" id="outMoney"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.handlingFee"/>:</th>
    		<td><form:input path="handlingFee" id="handlingFee"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.inAcType"/>:</th>
    		<td><form:input path="inAcType" id="inAcType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.inCompanyCode"/>:</th>
    		<td><form:input path="inCompanyCode" id="inCompanyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.inMemberNo"/>:</th>
    		<td><form:input path="inMemberNo" id="inMemberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.inCurrency"/>:</th>
    		<td><form:input path="inCurrency" id="inCurrency"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.inRate"/>:</th>
    		<td><form:input path="inRate" id="inRate"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.inMoney"/>:</th>
    		<td><form:input path="inMoney" id="inMoney"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.creatorCode"/>:</th>
    		<td><form:input path="creatorCode" id="creatorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcTrans.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.checkerCode"/>:</th>
    		<td><form:input path="checkerCode" id="checkerCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.checkTime"/>:</th>
    		<td><form:input path="checkTime" id="checkTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.memo"/>:</th>
    		<td><form:input path="memo" id="memo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcTrans.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
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
    				<c:if test="${not empty fiAcTrans.id }">
    					<win:power powerCode="deleteFiAcTrans">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiAcTrans')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiAcTranss.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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