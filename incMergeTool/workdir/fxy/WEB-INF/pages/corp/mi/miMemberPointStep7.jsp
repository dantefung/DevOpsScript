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
     <form:form commandName="miMember" method="post" action="miMemberInfoPointStep7.jhtml" id="miMemberApplyForm" onsubmit="return validateSearch(this)">
    <table class="detail">
    	<tr>
    		<th><fmt:message key="mi.recommander"/></th>
    		<td><input name="recommandName" id="recommandName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.memberName"/>:</th>
    		<td>
    			${fullName }&nbsp;&nbsp;<fmt:message key="mi.bound.account"/>：<b><fmt:formatNumber pattern="###,##0.00" value="${fiBankbookBalance.balance }" /></b>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td colspan="2">
    			<textarea rows="5" cols="80" name="transferRemark"></textarea>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="transferFee" id="transferFee" value="0"/>
    				<input type="hidden" name="userCode" value="${param.userCode }"/>
    				<input type="hidden" name="modify_type" value="${param.modify_type }"/>
    				<input type="hidden" name="memberApplyKey" value="${param.memberApplyKey }"/>
    				<input type="hidden" name="strAction" value="miMemberInfoPointStep7"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<button type="button" name="previous" onclick="window.location='miMemberInfoStep4.jhtml?strAction=resetMiMemberInfoPwd&userCode=${param.userCode}&modify_type=${param.modify_type}&memberApplyKey=${param.memberApplyKey }'"><fmt:message key="button.previous"/></button>
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
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
	if(theForm.recommandName.value == ""){
		alert("<fmt:message key='mi.recommand.null.require'/>");
		theForm.recommandName.focus();
		return false;
	}
	showLoading();
	return true;
}

</script>