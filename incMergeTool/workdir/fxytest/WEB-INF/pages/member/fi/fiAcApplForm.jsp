<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.memberEditFiAcAppl"/></title>
    <meta name="heading" content="<fmt:message key="menu.memberEditFiAcAppl"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<ul class="nav nav-tabs">
	<win:power powerCode="memberEditFiAcAppl">
		<li class="active"><a href="${ctx }/member/editFiAcAppl.jhtml?strAction=memberEditFiAcAppl"><fmt:message key="menu.memberEditFiAcAppl"/></a></li>
	</win:power>
    <win:power powerCode="memberListFiAcAppls">
		<li><a href="${ctx }/member/fiAcAppls.jhtml"><fmt:message key="member.txsqdcx"/></a></li>
	</win:power>
</ul>

<br/>
<form:form commandName="fiAcAppl" method="post" action="editFiAcAppl.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">

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
    		<td colspan="2">
    			<span class="form-tips">
    				<fmt:message key="item.in.bold.required"/>
    			</span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fi.withdraw.account"/>：</th>
    		<td>
   				<c:forEach items="${fiAcBalances }" var="fiAcBalanceVar">
   					<c:if test="${fiAcBalanceVar.ac_type=='B1'}">
   						<div class="radio">
   							<label>
   								<form:radiobutton path="acType" value="${fiAcBalanceVar.ac_type }" id="acType_${fiAcBalanceVar.ac_type }"/>
   								<win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
   								<c:if test="${fiAcBalanceVar.ac_type=='A0' && miMember.isCredit==1 }"><span class="label label-danger"><fmt:message key="lang.credit"/></span></c:if>
   								<br><fmt:message key="fi.userBalance"/>：<span class="redFont"><fmt:formatNumber value="${fiAcBalanceVar.balance }" type="number" pattern="###,###,##0.00"/></span>
   								<c:if test="${fiAcBalanceVar.ac_type=='B1'}">
   									<br/>
   									<fmt:message key="member.take.money.CN.3">
   										<fmt:param>${minMoney}</fmt:param>
   										<fmt:param>${timesOfMoney}</fmt:param>
   										<fmt:param>${feesPercent}</fmt:param>
   									</fmt:message>
									<br>
									<fmt:message key="member.take.money.CN.fee.tip"/>
   								</c:if>
   							</label>
   						</div>
   					</c:if>
   				</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"> 
    			<fmt:message key="member.txje"/>：
    		<td>
    			<form:input path="amount" cssClass="form-control input-sm"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"> 
    			<fmt:message key="label.recieve.money.account"/>：
    		<td>
    			<select name="accId" id="accId" class="form-control input-sm">
    				<c:forEach items="${miMemberAccounts }" var="miMemberAccountVar">
    					<option value="${miMemberAccountVar.accId }"<c:if test="${miMemberAccountVar.accId==param.accId }"> selected</c:if>>
    						${miMemberAccountVar.openBank } - ${miMemberAccountVar.bname }( ×××× ×××× ×××× ${fn:substring(miMemberAccountVar.bnum, fn:length(miMemberAccountVar.bnum)-4, fn:length(miMemberAccountVar.bnum))} )
    					</option>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    	<win:power powerCode="memberListMiMemberAccounts">
    		<tr>
    			<th></th>
    			<td>
  					<fmt:message key="info.no.recieve.money.account"/>？<a href="miMemberAccounts.jhtml" target="_blank"><fmt:message key="label.click.to.setting"/></a>
  				</td>
  			</tr>
  		</win:power>
    	<tr> 	
    		<th class="required"> <fmt:message key="mi.second.pwd"/>：</th>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
    	</tr>
    	<tr>
    		<th>
    		<fmt:message key="busi.common.remark"/>：</th>
    		<td>
    			<form:textarea path="memo" rows="6" cols="50" cssClass="form-control input-sm"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="memberEditFiAcAppl"/>
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
	if(theForm.amount.value=="" || !isUnsignedInteger(theForm.amount.value)){
		alert("<fmt:message key='member.checktxje'/>");
		theForm.amount.focus();
		return false;
	}
	if(theForm.accId.value==""){
		alert("<fmt:message key='info.please.select.recieve.account'/>");
		return false;
	}
	if(theForm.advPassword.value==""){
		alert("<fmt:message key='member.inputsecondpwd'/>");
		theForm.advPassword.focus();
		return false;
	}
	
	if(confirm("<fmt:message key="member.istj"/>？")){
		showLoading();
		return true;
	}else {
		return false;
	}
}
</script>