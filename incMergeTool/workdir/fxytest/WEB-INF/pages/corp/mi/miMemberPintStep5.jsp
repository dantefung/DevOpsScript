<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApalyCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="miMemberApalyCheck.title"/>"/>
</head>
<div class="contentBody">
	<form name="miMemberApplyFunctionForm" id="miMemberApplyFunctionForm"  >
		<%@ include file="/common/messages.jsp" %>
	</form>
     <form:form commandName="miMember" method="post" action="miMemberInfoPoint.jhtml" id="miMemberApplyForm" onsubmit="return validateSearch(this)">
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
    	<%-- <tr>
    		<th><fmt:message key="mi.member.binding"/></th>
    		<td><win:code listCode="mi.binding.list" value="${bind}" /></td>
    	</tr>
    	 <tr>
    		<th><fmt:message key="mi.remove.ornot.binding"/></th>
    		<td><win:list listCode="yesno" name="isRemoveBinding" id="isRemoveBinding" showBlankLine="true" defaultValue="" value=""/></td>
    	</tr>
    	 <tr>
    		<th><fmt:message key="mi.member.orderGoods.status"/></th>
    		<td><win:code listCode="mi.ordergoods.list" value="${orderGoods }"/></td>
    	</tr> --%>
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
    	<tr>
    		<td colspan="2">
    			<input type="radio" name="resetMethod" id="resetMethod1" value="1" checked="checked"/>
    			<label for="resetMethod1"><fmt:message key="mi.reset.random.pwd"/></label>
    		</td>
    	</tr>
    	<tr>
    		<td>&nbsp;</td>
    		<td>
    			<fmt:message key="gsMember.mobile"/>：<input type="text" name="newMobile" value="${miMember.mobile }"/>
    			<span style="color: red"><fmt:message key="mi.pwd.telephone.right.remark"/></span>
    		</td>
    	</tr>
    	<tr>
    		<td valign="top" colspan="2">
    			<input type="radio" name="resetMethod" id="resetMethod4" value="4"/>
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
    				<input type="hidden" name="userCode" value="${miMember.memberNo }"/>
    				<input type="hidden" name="modify_type" value="${param.modify_type }"/>
    				<input type="hidden" name="memberApplyKey" value="${param.memberApplyKey }"/>
    				<input type="hidden" name="strAction" value="resetMiMemberInfoPwd"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<button type="button" name="previous" onclick="window.location='miMemberInfoStep4.jhtml?strAction=miMemberInfoPoint&userCode=${param.userCode}&modify_type=${param.modify_type}&memberApplyKey=${param.memberApplyKey }'"><fmt:message key="button.previous"/></button>
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
    				</win:power>
    				<%-- <button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?memberApplyKey=${param.memberApplyKey}&modify_type=${param.modify_type }'"><fmt:message key="operation.button.cancel"/></button> --%>
                </div>
    		</td>
    	</tr>
    </table>
	</form:form>
</div>
	
<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	$("button[name='previous']").button({
        icons: {
            primary: "ui-icon-previous"
        }
    });
});
function validateSearch(theForm) {
	if(theForm.resetMethod.value=="1"){
		if(theForm.newMobile.value==""){
			alert("<fmt:message key='mi.account.telephone.null.requie'/>");
			theForm.newMobile.focus();
			return false; 
		}else if(theForm.newMobile.value.length != 11){
			alert("<fmt:message key='mi.mobile.right.input'/>");
			theForm.newMobile.select();
			return false;
		}
	}else if(theForm.resetMethod.value=="4"){
		if(theForm.newPassword.value==""){
			alert("<fmt:message key='lang.plsInputNewPWD'/>");
			theForm.newPassword.focus();
			return false; 
		}
	}
	showLoading();
	return true;
}

</script>