<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmStatusAdjustDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="pmStatusAdjustDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmStatusAdjust" method="post" action="editPmStatusAdjust.jhtml" onsubmit="return validateForm(this)" id="pmStatusAdjustForm">
    
    <spring:bind path="pmStatusAdjust.*">
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
    	<c:if test="${not empty alCompanys}">
    	<tr>
    		<th class="required"><fmt:message key="label.company"/>:</th>
    		<td><form:select path="companyCode" id="companyCode" items="${alCompanys }" itemLabel="companyName" itemValue="companyCode" /></td>
    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="busi.product.productno"/>:</th>
    		<td><input name="productCode" id="productCode" value="${productCode }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.new.status"/>:</th>
    		<td>
    			<form:select path="newStatus">
    				<c:forEach items="${productStatus }" var="statusVar">
    					<c:if test="${statusVar.key!=0}">
    						<form:option value="${statusVar.key}">${statusVar.value }</form:option>
    					</c:if>
    				</c:forEach>
    			</form:select>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="adjustRemark" id="adjustRemark" cols="80" rows="6"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='pmStatusAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.productCode.value==""){
		alert("<fmt:message key="error.product.code.required"/>");
		theForm.productCode.focus();
		return false;
	}
	
	showLoading();
	return true;
}
</script>