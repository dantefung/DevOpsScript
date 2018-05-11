<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="member.yjdzzh"/></title>
    <meta name="heading" content="<fmt:message key="member.yjdzzh"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<ul class="nav nav-tabs">
	<c:forEach items="${bonusTypes }" var="bonusTypeVar">
		<c:if test="${bonusTypeVar.key=='1'}">
			<li role="presentation"<c:if test="${bonusTypeVar.key==bonusType }"> class="active"</c:if>>
				<a href="editBonusToBankbookTransfer.jhtml?bonusType=${bonusTypeVar.key }">${bonusTypeVar.value }</a>
			</li>
		</c:if>
	</c:forEach>
</ul>
	
<form:form commandName="sysUser" method="post" action="editBonusToBankbookTransfer.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">
<div class="contentBody">
	<spring:bind path="sysUser.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="alert alert-danger alert-dismissible fade in error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>

    <table class="detail">
    	<tr>
    		<td class="title" colspan="2" style="font-weight: normal;">
    		<fmt:message key="member.yjxz"/>:
   				<br/>1、<b><fmt:message key="member.changemoney"/></b><fmt:message key="member.xydy"/><b><fmt:message key="member.dqktyj"/></b>；
   				<br/>2、<fmt:message key="member.bonusToBankbook.warn.2"/>；
    		</td>
    	</tr>
    	<tr>
    		<th>&nbsp;</th>
    		<td>
    			<span class="form-tips">
    				<fmt:message key="item.in.bold.required"/>
    			</span>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="member.sqmembernumber"/>:</th>
    		<td><b>${sessionScope.sessionLoginUser.userCode }</b></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="member.dqyjye"/>:</th>
    		<td><span class="redFont"><fmt:formatNumber value="${fiBonusAcBalance.balance}" type="balance" pattern="###,###,##0.00"/></span></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="member.dqkzyj"/>:</th>
    		<td><span class="redFont"><fmt:formatNumber value="${fiBonusAcBalance.availBalance}" type="balance" pattern="###,###,##0.00"/></span></td>
    	</tr>
    	<tr>
    		<th>转入账户:</th>
    		<td>
    			<c:if test="${bonusType==1 }">现金积分</c:if>
    			<c:if test="${bonusType==2 }">复消钱包</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"> <fmt:message key="member.changemoney"/>:</th>
    		<td>
    		<input type="text" name="amount" id="amount" value="${param.amount }" class="form-control input-sm"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.second.pwd"/>:</th>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="userCode"/>
    				<input type="hidden" name="bonusType" value="${bonusType }"/>
    				<input type="hidden" name="strAction" value="memberBonusToBankbookTransfer"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="operation.button.confirm"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>
</form:form>
<script type="text/javascript">
var submited = false;
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.amount.value=="" || !isUnsignedInteger(theForm.amount.value)){
		alert("<fmt:message key='member.zhjew'/>");
		
		theForm.amount.focus();
		return false;
	}
	if(theForm.amount.value>${fiBonusAcBalance.availBalance}){
		alert("<fmt:message key='member.zzjebxx'/>");
		theForm.amount.focus();
		return false;
	}
	if(theForm.advPassword.value==""){
		alert("<fmt:message key='member.inputpwd'/>");
		theForm.advPassword.focus();
		return false;
	}
	
	var confirmMsg = "<fmt:message key='member.changemoney'/>："+theForm.amount.value+"\n<fmt:message key='member.checkzh'/>？";
	if(confirm(confirmMsg)){
		if(!submited){
			submited = true;
			showLoading();
			return true;
		}else{
			alert("<fmt:message key='member.checksubmit'/>");
			return false;
		}
	}else {
		return false;
	}
}
</script>