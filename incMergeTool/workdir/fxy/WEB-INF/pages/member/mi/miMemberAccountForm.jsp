<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="银行帐户管理"/></title>
    <meta name="heading" content="<fmt:message key="银行帐户管理"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miMemberAccount" method="post" action="editMiMemberAccount.jhtml" onsubmit="return validateForm(this)" id="miMemberAccountForm">
    
    <spring:bind path="miMemberAccount.*">
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
    <table class="detail" width="300">
    	<tr>
    		<td><fmt:message key="bdSendRemittanceReport.openBankCH"/>:</td>
    	</tr>
		<c:set var="bnameUnChangable" value="true"/>
		<c:if test="${ sessionScope.sessionLoginUser.companyCode ne 'CN'}" >
			<c:set var="commpanyCodeExcludeSino" value="${'.'}${ sessionScope.sessionLoginUser.companyCode}"/>

			<script>
				$(document).ready(function () {
					console.log('bname: ${miMemberAccount.bname}');
                });
			</script>

			<c:set var="isNotSino" value="true"/>
			<c:if test="${ empty miMemberAccount.accId }">
				<c:set var="bnameUnChangable" value="false"/>
			</c:if>
		</c:if>
    	<tr>
    		<td>
    			<win:list name="openBank" listCode="bankcodes${fn:toLowerCase(commpanyCodeExcludeSino)}" defaultValue="" value="${miMemberAccount.openBank }" styleClass="form-control"/>
    		</td>
    	</tr>
    	<tr>
    		<td><fmt:message key="mi.lable.branchName"/>:</td>
    	</tr>
    	<tr>
    		<td><form:input path="bbranch" id="bbranch" cssClass="form-control"/></td>
    	</tr>
    	<tr>
    		<td><fmt:message key="bdOutwardBank.accountName"/>:</td>
    	</tr>
    	<tr>
    		<td><form:input path="bname" id="bname" cssClass="form-control" readonly="${bnameUnChangable}"/></td>
    	</tr>
    	<tr>
    		<td><fmt:message key="bdSendRecordToBankReport.bankNumCH"/>:</td>
    	</tr>
    	<tr>
    		<td><form:input path="bnum" id="bnum" cssClass="form-control"/></td>
    	</tr>
		<c:if test="${isNotSino eq 'true'}">
			<tr>
				<td><fmt:message key="iban"/>:</td>
			</tr>
			<tr>
				<td><form:input path="ibanNo" id="ibanNo" cssClass="form-control"/></td>
			</tr>
			<tr>
				<td><fmt:message key="bic"/>:</td>
			</tr>
			<tr>
				<td><form:input path="bicNo" id="bicNo" cssClass="form-control"/></td>
			</tr>
		</c:if>
    	<tr>
    		<td><fmt:message key="mi.second.pwd"/>:</td>
    	</tr>
    	<tr>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control" placeholder="二级密码"/></td>
    	</tr>
    	<tr>
    		<td>
    			<div class="buttonBar">
    				<form:hidden path="accId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miMemberAccount.accId }">
    					<win:power powerCode="memberDeleteMiMemberAccount">
    						<button type="submit" class="btn btn-danger" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiMemberAccount')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" class="btn btn-default" name="cancel" onclick="window.location='miMemberAccounts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.bbranch.value==""){
		alert("<fmt:message key="prompt.branchName.null.require"/>");
		theForm.bbranch.focus();
		return false;
	}
	if(theForm.bname.value==""){
		alert("<fmt:message key="register.us.select.bname"/>");
		theForm.bname.focus();
		return false;
	}
	if(theForm.bnum.value=="" || theForm.bnum.value.length<10 || !isUnsignedInteger(theForm.bnum.value)){
		alert("<fmt:message key="register.us.select.bnum"/>");
		theForm.bnum.focus();
		return false;
	}
	if (theForm.advPassword.value == '' || theForm.advPassword.value == null) {
		alert("<fmt:message key='member.inputpwd'/>.");
		
		theForm.advPassword.focus();
		return false;
	}
    <c:if test="${isNotSino eq 'true'}">
    if (theForm.ibanNo.value == '' || theForm.ibanNo.value == null) {
        alert("<fmt:message key='iban.required'/>.");

        theForm.ibanNo.focus();
        return false;
    }

    if (theForm.bicNo.value == '' || theForm.bicNo.value == null) {
        alert("<fmt:message key='bic.required'/>.");

        theForm.bicNo.focus();
        return false;
    }
	</c:if>
	
	showLoading();
	return true;
}

function confirmDelete(theForm) {
	if (confirm("<fmt:message key="confirm.delete"/>?")) {
		theForm.strAction.value = "memberDeleteMiMemberAccount";
		return true;
	} else {
		return false;
	}
}
</script>