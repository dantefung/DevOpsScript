<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.export.coin"/></title>
    <meta name="heading" content="<fmt:message key="menu.export.coin"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<ul class="nav nav-tabs">
	<win:power powerCode="memberEditFiAcApplToETB">
		<li class="active"><a href="${ctx }/member/editFiAcApplToETB.jhtml?strAction=memberEditFiAcApplToETB"><fmt:message key="menu.export.coin"/></a></li>
	</win:power>
    <win:power powerCode="memberListFiAcApplToETBs">
		<li><a href="${ctx }/member/fiAcApplToETBs.jhtml"><fmt:message key="label.history.records"/></a></li>
	</win:power>
</ul>

<br/>
<form:form commandName="fiAcAppl" method="post" action="editFiAcApplToETB.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">

    <spring:bind path="fiAcAppl.*">
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
    		<td class="title" style="font-weight: normal;">
   				<fmt:message key="member.txxz"/>：
   				<br/><fmt:message key="info.export.coin.tips.1"/>
    		</td>
    	</tr>
    	<tr>
    		<td>
    			<span class="form-tips">
    				<fmt:message key="item.in.bold.required"/>
    			</span>
    		</td>
    	</tr>
    </table>
	<fmt:message key="label.export.coin.member.no"/>：<b>${sessionScope.sessionLoginUser.userCode }</b>
	<br/><fmt:message key="fi.userBalance"/>：<span class="redFont"><fmt:formatNumber value="${balance+freezeBalance}" type="number" pattern="###,###,##0.00"/></span>
	<br/><fmt:message key="fi.dqkyye"/>：<span class="redFont"><fmt:formatNumber value="${balance}" type="number" pattern="###,###,##0.00"/></span>

    <table class="detail">
    	<tr>
    		<th class="required"> 
    			<fmt:message key="label.export.coin.amount"/>：
    		<td>
    			<form:input path="amount" cssClass="form-control input-sm"/>
    		</td>
    		<td>&nbsp;</td>
    	</tr>
    	<tr>
    		<th class="required"> 
    			<fmt:message key="label.coin.address"/>：
    		<td>
    			<form:input path="caddress" cssClass="form-control input-sm"/>
    		</td>
    		<td>
    		</td>
    	</tr>
    	<tr> 	
    		<th class="required"> <fmt:message key="mi.second.pwd"/>：</th>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
    		<td>&nbsp;</td>
    	</tr>
    	<tr>
    		<th>
    		<fmt:message key="busi.common.remark"/>：</th>
    		<td>
    			<form:textarea path="memo" rows="6" cols="50" cssClass="form-control input-sm"/>
    		</td>
    		<td>&nbsp;</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="memberEditFiAcApplToETB"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" class="btn btn-success" name="submit" onclick="bCancel=false"><fmt:message key="member.tjsq"/></button>
                </div>
    		</td>
    	</tr>
    </table>

</form:form>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.amount.value=="" || !isUnsignedNumeric(theForm.amount.value)){
		alert("<fmt:message key="info.please.input.correct.number"/>");
		theForm.amount.focus();
		return false;
	}
	if(theForm.caddress.value==""){
		alert("<fmt:message key="info.please.input.coin.address"/>");
		theForm.caddress.focus();
		return false;
	}
	if(theForm.advPassword.value==""){
		alert("<fmt:message key='member.inputsecondpwd'/>");
		theForm.advPassword.focus();
		return false;
	}
	
	if(confirm("<fmt:message key="info.sure.export.coin"/>?")){
		showLoading();
		return true;
	}else {
		return false;
	}
}
</script>