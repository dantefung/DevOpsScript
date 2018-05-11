<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.reset.pwd"/></title>
    <meta name="heading" content="<fmt:message key="mi.reset.pwd"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<div class="contentBody">
    <form method="post" action="resetMiMemberInfoPwd.jhtml" onsubmit="return validateForm(this)" id="miMemberForm">
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
    	<c:if test="${'CN'== miMember.companyCode }">
	    	<tr>
	    		<td  align="right">
	    			<input type="radio" name="resetMethod" id="resetMethod1" value="1" checked="checked"/>
	    		</td>
	    		<td>
	    			<label for="resetMethod1"><fmt:message key="mi.reset.random.pwd"/></label>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>&nbsp;</td>
	    		<td>
	    			<fmt:message key="gsMember.mobile"/>：<input type="text" name="newMobile" value="${miMember.mobile }" onkeypress="checkNum()" onkeyup="this.value=this.value.replace(/\D/g,'')"/>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td valign="top" align="right">
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
	    		<th  valign="top"><font color="red">*&nbsp;</font><fmt:message key="miMemberApply.createRemark"/>:</th>
	    		<td><textarea name="applyRemark" rows="6" style="width:525px;"></textarea></td>
	    	</tr>
    	<tr>
	    		<th valign="top"><fmt:message key="miMember.remark"/>:<br/><fmt:message key="mi.lable.remark.show"/></th>
	    		<td><textarea name="memberRemark" rows="6" style="width:525px;"></textarea></td>
	    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="memberNo" value="${miMember.memberNo }"/>
    				<input type="hidden" name="modify_type" value="${modify_type }"/>
    				<input type="hidden" name="strAction" value="resetMiMemberInfoPwd"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<button type="button" name="previous" onclick="window.location='miMemberInfoStep2.jhtml?strAction=resetMiMemberInfoPwd&userCode=${miMember.memberNo}&modify_type=${param.modify_type}'"><fmt:message key="button.previous"/></button>
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<%-- <button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button> --%>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form>
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
	if(isEmpty(theForm.memberRemark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>");
		theForm.memberRemark.focus();
		return false;
	}
	if(!confirm("<fmt:message key='mi.reset.pwd.sure'/>")){
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
//控制手机号码只能输入数字
function checkNum(){
	if(event.keyCode < 48 || event.keyCode > 57) {
		event.returnValue=false; 
	}
}
</script>