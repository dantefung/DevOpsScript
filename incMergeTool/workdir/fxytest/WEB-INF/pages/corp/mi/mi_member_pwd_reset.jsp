<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.reset.pwd"/></title>
    <meta name="heading" content="<fmt:message key="mi.reset.pwd"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<div class="contentBody">
    <form method="post" action="resetMiMemberPwd.jhtml" onsubmit="return validateForm(this)" id="miMemberForm">
    <spring:bind path="miMember.*">
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
    <table class="detail">
    	<tr>
    		<td colspan="2">
    			<fmt:message key="mi.need.reset.pwd.account"/>：<b>${miMember.memberNo }</b>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.choose.reset.pwd"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<input type="checkbox" name="passwordType" id="passwordType1" value="1" checked/>
    			<label for="passwordType1"><fmt:message key="mi.first.pwd"/></label>
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			<input type="checkbox" name="passwordType" id="passwordType2" value="2"/>
    			<label for="passwordType2"><fmt:message key="mi.second.pwd"/></label>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.choose.reset.pwd.way"/></td>
    	</tr>
    	<c:if test="${miMember.companyCode=='CN' }">
	    	<tr>
	    		<td>
	    			<input type="radio" name="resetMethod" id="resetMethod1" value="1" checked="checked"/>
	    		</td>
	    		<td>
	    			<label for="resetMethod1"><fmt:message key="mi.reset.random.pwd"/></label>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>&nbsp;</td>
	    		<td>
	    			<fmt:message key="gsMember.mobile"/>：<input type="text" name="newMobile" value="${miMember.mobile }"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<input type="radio" name="resetMethod" id="resetMethod2" value="2"/>
	    		</td>
	    		<td>
	    			<label for="resetMethod2"><fmt:message key="mi.email.random.pwd"/></label>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>&nbsp;</td>
	    		<td>
	    			<fmt:message key="ssCustomer.email"/>：<input type="text" name="newEmail" value="${miMember.email }"/>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<input type="radio" name="resetMethod" id="resetMethod3" value="3"/>
	    		</td>
	    		<td>
	    			<label for="resetMethod3"><fmt:message key="mi.reset.pwd.remark"/></label>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td valign="top">
    			<input type="radio" name="resetMethod" id="resetMethod4" value="4"/>
    		</td>
    		<td>
    			<label for="resetMethod4"><fmt:message key="mi.handle.pwd"/></label>
    		</td>
    	</tr>
    	<tr>
    		<td>&nbsp;</td>
    		<td>
    			<fmt:message key="mi.member.pwd"/>：<input type="text" name="newPassword" value="11111111111"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="memberNo" value="${miMember.memberNo }"/>
    				<input type="hidden" name="modify_type" value="${modify_type }"/>
    				<input type="hidden" name="strAction" value="resetMiMemberPwd"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='miMembers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("passwordType"));
	if(!selectedValues){
		alert("<fmt:message key='mi.pwd.least.choose'/>");
		return false;
	}
	
	if($("[name='resetMethod']:checked").val()=="1" && (theForm.newMobile.value=="" || !isMobile(theForm.newMobile.value))){
		alert("<fmt:message key='mi.telephone.recievePwd'/>");
		theForm.newMobile.focus();
		return false;
	}
	if($("[name='resetMethod']:checked").val()=="2" && (theForm.email.value=="" || !isEmail(theForm.email.value))){
		alert("<fmt:message key='mi.email.recievePwd.null.requie'/>");
		theForm.email.focus();
		return false;
	}
	if($("[name='resetMethod']:checked").val()=="4" && theForm.newPassword.value==""){
		alert("<fmt:message key='mi.newPwd.null.requie'/>");
		theForm.newPassword.focus();
		return false;
	}
	
	if(!confirm("<fmt:message key='mi.reset.pwd.sure'/>")){
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
</script>