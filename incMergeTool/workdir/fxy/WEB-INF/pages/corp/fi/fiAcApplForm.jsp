<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiAcApplDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiAcApplDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiAcAppl" method="post" action="editFiAcAppl.jhtml" onsubmit="return validateForm(this)" id="fiAcApplForm">
    
    <spring:bind path="fiAcAppl.*">
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
    		<th class="required"><fmt:message key="fiAcAppl.applNo"/>:</th>
    		<td><form:input path="applNo" id="applNo"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.acType"/>:</th>
    		<td><form:input path="acType" id="acType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.amount"/>:</th>
    		<td><form:input path="amount" id="amount"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.createrCode"/>:</th>
    		<td><form:input path="createrCode" id="createrCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiAcAppl.status"/>:</th>
    		<td><form:input path="status" id="status"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.checkerCode"/>:</th>
    		<td><form:input path="checkerCode" id="checkerCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.checkTime"/>:</th>
    		<td><form:input path="checkTime" id="checkTime"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.operNo"/>:</th>
    		<td><form:input path="operNo" id="operNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.falseReason"/>:</th>
    		<td><form:input path="falseReason" id="falseReason"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.extApplyNo"/>:</th>
    		<td><form:input path="extApplyNo" id="extApplyNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.openBank"/>:</th>
    		<td><form:input path="openBank" id="openBank"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.bcity"/>:</th>
    		<td><form:input path="bcity" id="bcity"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.bname"/>:</th>
    		<td><form:input path="bname" id="bname"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.bnum"/>:</th>
    		<td><form:input path="bnum" id="bnum"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.sendAmt"/>:</th>
    		<td><form:input path="sendAmt" id="sendAmt"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.fees"/>:</th>
    		<td><form:input path="fees" id="fees"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.memo"/>:</th>
    		<td><form:input path="memo" id="memo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.remark"/>:</th>
    		<td><form:input path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.sendCode"/>:</th>
    		<td><form:input path="sendCode" id="sendCode"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiAcAppl.sendTime"/>:</th>
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
    				<c:if test="${not empty fiAcAppl.id }">
    					<win:power powerCode="deleteFiAcAppl">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiAcAppl')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiAcAppls.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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