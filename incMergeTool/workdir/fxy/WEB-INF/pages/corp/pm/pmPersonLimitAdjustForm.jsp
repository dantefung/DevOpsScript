<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmPersonLimitAdjustList.title"/></title>
    <meta name="heading" content="<fmt:message key="pmPersonLimitAdjustList.title"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="pmPersonLimitAdjust" method="post" action="editPmPersonLimitAdjust.jhtml" onsubmit="return validateForm(this)" id="pmPersonLimitAdjustForm">
    
    <spring:bind path="pmPersonLimitAdjust.*">
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
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    		<form:input path="userCode" id="userCode"/>
    		<input type="button" name="showNameBtn" value="<fmt:message key="mi.get.memberName"/>" onclick="showName(this.form.userCode.value);"/>
    		<span id="memberName"></span>
    		<input type ="hidden" name ="logout"  value="${logout}"/>
    		</td>
    	</tr>
    	<c:if test="${not empty alCompanys}">
    	<tr>
    		<th class="required"><fmt:message key="label.company"/>:</th>
    		<td><form:select path="companyCode" id="companyCode" items="${alCompanys }" itemLabel="companyName" itemValue="companyCode"/></td>
    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="busi.product.productno"/>:</th>
    		<td><input name="productCode" id="productCode" value="${productCode }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="pmLimitAdjust.adjustQty"/>:</th>
    		<td><form:input path="adjustQty" id="adjustQty"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" id="remark" cols="80" rows="6"/></td>
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
    				<c:if test="${not empty pmPersonLimitAdjust.adjustCode }">
    					<win:power powerCode="deletePmPersonLimitAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PmPersonLimitAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pmPersonLimitAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.productCode.value==""){
		alert("<fmt:message key="error.product.code.required"/>");
		theForm.productCode.focus();
		return false;
	}
	if(theForm.adjustQty.value=="" || !isInteger(theForm.adjustQty.value)){
		alert("<fmt:message key="error.adjust.qty.required"/>");
		theForm.adjustQty.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}

function showName(val) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById("memberName").innerHTML = data.fullName;
	} else {
		document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";
	}
   });
}
</script>