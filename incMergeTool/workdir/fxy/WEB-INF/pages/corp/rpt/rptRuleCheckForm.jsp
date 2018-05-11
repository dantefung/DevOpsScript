<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="rptRuleCheckDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="rptRuleCheckDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="rptRuleCheck" method="post" action="editRptRuleCheck.jhtml" onsubmit="return validateForm(this)" id="rptRuleCheckForm">
    
    <spring:bind path="rptRuleCheck.*">
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
    		<th class="required"><fmt:message key="rptRuleCheck.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c1"/>:</th>
    		<td><form:input path="c1" id="c1"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c2"/>:</th>
    		<td><form:input path="c2" id="c2"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c3"/>:</th>
    		<td><form:input path="c3" id="c3"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c4"/>:</th>
    		<td><form:input path="c4" id="c4"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c5"/>:</th>
    		<td><form:input path="c5" id="c5"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c6"/>:</th>
    		<td><form:input path="c6" id="c6"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c7"/>:</th>
    		<td><form:input path="c7" id="c7"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c8"/>:</th>
    		<td><form:input path="c8" id="c8"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c9"/>:</th>
    		<td><form:input path="c9" id="c9"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c10"/>:</th>
    		<td><form:input path="c10" id="c10"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c11"/>:</th>
    		<td><form:input path="c11" id="c11"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c12"/>:</th>
    		<td><form:input path="c12" id="c12"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c13"/>:</th>
    		<td><form:input path="c13" id="c13"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c14"/>:</th>
    		<td><form:input path="c14" id="c14"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c15"/>:</th>
    		<td><form:input path="c15" id="c15"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c16"/>:</th>
    		<td><form:input path="c16" id="c16"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c17"/>:</th>
    		<td><form:input path="c17" id="c17"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c18"/>:</th>
    		<td><form:input path="c18" id="c18"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c19"/>:</th>
    		<td><form:input path="c19" id="c19"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c20"/>:</th>
    		<td><form:input path="c20" id="c20"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c21"/>:</th>
    		<td><form:input path="c21" id="c21"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c22"/>:</th>
    		<td><form:input path="c22" id="c22"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c23"/>:</th>
    		<td><form:input path="c23" id="c23"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c24"/>:</th>
    		<td><form:input path="c24" id="c24"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c25"/>:</th>
    		<td><form:input path="c25" id="c25"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c26"/>:</th>
    		<td><form:input path="c26" id="c26"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c27"/>:</th>
    		<td><form:input path="c27" id="c27"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c28"/>:</th>
    		<td><form:input path="c28" id="c28"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c29"/>:</th>
    		<td><form:input path="c29" id="c29"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="rptRuleCheck.c30"/>:</th>
    		<td><form:input path="c30" id="c30"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="checkId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty rptRuleCheck.checkId }">
    					<win:power powerCode="deleteRptRuleCheck">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'RptRuleCheck')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='rptRuleChecks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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