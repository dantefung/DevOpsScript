<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="receipt.bankAcc.mgr"/></title>
    <meta name="heading" content="<fmt:message key="receipt.bankAcc.mgr"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBank" method="post" action="editFiBank.jhtml" onsubmit="return validateForm(this)" id="fiBankForm">
    
    <spring:bind path="fiBank.*">
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
    	<c:if test="${not empty alCompanys}">
	    	<tr>
	    		<th class="required"><fmt:message key="lang.belong.company"/>:</th>
	    		<td>
	    			<select name="companyCode" id="companyCode">
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode} - ${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="bdSendRemittanceReport.openBankCH"/>:</th>
    		<td>
    			<win:list name="bankCode" listCode="bankcodes" defaultValue="" value="${fiBank.bankCode }"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="lang.regist.bank.branch"/>:</th>
    		<td><form:input path="bankBranch" id="bankBranch" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.common.account"/>:</th>
    		<td><form:input path="accountNo" id="accountNo" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="lang.bankAcc.name"/>:</th>
    		<td><form:input path="accountName" id="accountName" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:input path="remark" id="remark" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.isActive"/>:</th>
    		<td>
    			<win:list name="isActive" listCode="yesno" defaultValue="" value="${fiBank.isActive }"/>
    		</td>
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
    				<c:if test="${not empty fiBank.id }">
    					<win:power powerCode="deleteFiBank">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBank')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBanks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.bankBranch.value==""){
		alert("<fmt:message key='lang.plzInputOpenBankBranch'/>");//请输入开户银行分支行
		theForm.bankBranch.focus();
		return false;
	}
	if(theForm.accountNo.value==""){
		alert("<fmt:message key='lang.plzInputBankAccNo'/>");//请输入账号
		theForm.accountNo.focus();
		return false;
	}
	if(theForm.accountName.value==""){
		alert("<fmt:message key='lang.plzInputBankAccName'/>");//请输入户名
		theForm.accountName.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>