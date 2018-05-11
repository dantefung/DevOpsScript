<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pdUserStockLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pdUserStockLogDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pdUserStockLog" method="post" action="editPdUserStockLog.jhtml" onsubmit="return validateForm(this)" id="pdUserStockLogForm">
    
    <spring:bind path="pdUserStockLog.*">
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
    		<th class="required"><fmt:message key="pdUserStockLog.companyCode"/>:</th>
    		<td><form:input path="companyCode" id="companyCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.userCode"/>:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.productId"/>:</th>
    		<td><form:input path="productId" id="productId"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.qty"/>:</th>
    		<td><form:input path="qty" id="qty"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.leftQty"/>:</th>
    		<td><form:input path="leftQty" id="leftQty"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.creatorCode"/>:</th>
    		<td><form:input path="creatorCode" id="creatorCode"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.createTime"/>:</th>
    		<td><form:input path="createTime" id="createTime"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pdUserStockLog.changeSource"/>:</th>
    		<td><form:input path="changeSource" id="changeSource"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty pdUserStockLog.logId }">
    					<win:power powerCode="deletePdUserStockLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PdUserStockLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pdUserStockLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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