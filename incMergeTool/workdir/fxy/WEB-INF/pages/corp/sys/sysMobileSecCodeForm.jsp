<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMobileSecCodeDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysMobileSecCodeDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysMobileSecCode" method="post" action="editSysMobileSecCode.jhtml" onsubmit="return validateForm(this)" id="sysMobileSecCodeForm">
    
    <spring:bind path="sysMobileSecCode.*">
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
    		<th class="required"><fmt:message key="sysMobileSecCode.busiType"/>:</th>
    		<td><form:input path="busiType" id="busiType"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMobileSecCode.mobile"/>:</th>
    		<td><form:input path="mobile" id="mobile"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMobileSecCode.secCode"/>:</th>
    		<td><form:input path="secCode" id="secCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysMobileSecCode.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="codeId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysMobileSecCode.codeId }">
    					<win:power powerCode="deleteSysMobileSecCode">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysMobileSecCode')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysMobileSecCodes.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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