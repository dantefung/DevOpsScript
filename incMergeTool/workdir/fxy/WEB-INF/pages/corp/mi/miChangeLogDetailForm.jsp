<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miChangeLogDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miChangeLogDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miChangeLogDetail" method="post" action="editMiChangeLogDetail.jhtml" onsubmit="return validateForm(this)" id="miChangeLogDetailForm">
    
    <spring:bind path="miChangeLogDetail.*">
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
    		<th><fmt:message key="miChangeLogDetail.changeCode"/>:</th>
    		<td><form:input path="changeCode" id="changeCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miChangeLogDetail.tableName"/>:</th>
    		<td><form:input path="tableName" id="tableName"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miChangeLogDetail.columnName"/>:</th>
    		<td><form:input path="columnName" id="columnName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.oldValue"/>:</th>
    		<td><form:input path="oldValue" id="oldValue"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miChangeLogDetail.newValue"/>:</th>
    		<td><form:input path="newValue" id="newValue"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="detailId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miChangeLogDetail.detailId }">
    					<win:power powerCode="deleteMiChangeLogDetail">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiChangeLogDetail')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miChangeLogDetails.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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