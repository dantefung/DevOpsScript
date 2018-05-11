<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fi.dzzhhz"/></title>
    <meta name="heading" content="<fmt:message key="fi.dzzhhz"/>"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<form:form commandName="sysUser" method="post" action="editFiBankbookTransfer.jhtml" onsubmit="return validateForm(this)" id="sysUserForm">
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
   				<fmt:message key="fi.zzxz"/>：
   				<br/>1、<b><fmt:message key="fi.dzzhhz"/><fmt:message key="fi.jshyba"/></b><fmt:message key="fi.bxy"/><b><fmt:message key="fi.jshyxm"/></b><fmt:message key="fi.xpp"/>；
   				<br/>2、<b><fmt:message key="member.changemoney"/></b><fmt:message key="member.xydy"/><b><fmt:message key="fi.dqkyye"/></b>；
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
    		<th><fmt:message key="fi.sqzhdhybh"/>:</th>
    		<td><b>${sessionScope.sessionLoginUser.userCode }</b></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.userBalance"/>:</th>
    		<td><span class="redFont"><fmt:formatNumber value="${userBalance }" type="number" pattern="###,###,##0.00"/></span></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.freezeAmt"/>:</th>
    		<td><span class="redFont"><fmt:formatNumber value="${userFreezeAmt }" type="number" pattern="###,###,##0.00"/></span></td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="fi.dqkyye"/>:</th>
    		<td><span class="redFont"><fmt:formatNumber value="${userBalance-userFreezeAmt-miMember.lowestBalance }" type="number" pattern="###,###,##0.00"/></span></td>
    	</tr> --%>
    	<tr>
    		<th class="required"><span class="redFont">*</span> <fmt:message key="fi.jshyba"/>:</th>
    		<td><input type="text" name="accUserCode" id="accUserCode" value="${param.accUserCode }" class="form-control input-sm" onkeyup="showName(this.value)"/></td>
    	</tr>
    	<tr>
    		<th class="required"><span class="redFont">*</span> <fmt:message key="fi.jshyxm"/>:<input type="hidden" name="accUserName" id="accUserName" value="${param.accUserName }" class="form-control input-sm"/></th>
    		<td id="show_name"></td>
    	</tr>
    	<tr>
    		<th class="required"><span class="redFont">*</span><fmt:message key="member.changemoney"/> :</th>
    		<td>
    		<input type="text" name="amount" id="amount" value="${param.amount }" class="form-control input-sm"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><span class="redFont">*</span> <fmt:message key="mi.second.pwd"/>:</th>
    		<td><input type="password" name="advPassword" id="advPassword" class="form-control input-sm"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>
    			<textarea name="notes" rows="6" cols="50" class="form-control input-sm"></textarea>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="userCode"/>
    				<input type="hidden" name="strAction" value="memberEditFiBankbookTransfer"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" class="btn btn-success" name="save" onclick="bCancel=false"><fmt:message key="operation.button.confirm"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>
</form:form>
<script type="text/javascript">
$("#accUserCode").blur(function(e) {     
	$(this).val($(this).val().toUpperCase());
}); 

$(function() {
	showName("${param.accUserCode}");
});
document.onload=showMsg('${successMessages}');

function showMsg(msg){
	if(msg!=null && msg.length!=0){
		alert(msg);
	}
}

var submited = false;
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.accUserCode.value==""){
		alert("<fmt:message key='fi.qsrjshy'/>");
		theForm.accUserCode.focus();
		return false;
	}
	/* if(theForm.accUserName.value==""){
		alert("<fmt:message key='fi.qsrjshyxm'/>");
		theForm.accUserName.focus();
		return false;
	} */
	
	if(theForm.amount.value=="" || !isUnsignedInteger(theForm.amount.value) || parseInt(theForm.amount.value)<=0){
		alert("<fmt:message key='fi.zhjebxwzs'/>");
		theForm.amount.focus();
		return false;
	}
	if(theForm.advPassword.value==""){
		alert("<fmt:message key='member.inputpwd'/>");
		theForm.advPassword.focus();
		return false;
	}
	
	var confirmMsg = "<fmt:message key="fi.jshyba"/>："+theForm.accUserCode.value+"\n<fmt:message key="fi.jshyxm"/>："+theForm.accUserName.value+"\n<fmt:message key="member.changemoney"/>："+theForm.amount.value+"\n<fmt:message key="fi.sfqrzh"/>？";
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
function showName(val){
	if(val==null||val=="") return;
	MiMemberAjax.getMiMemberInfo(val.toUpperCase(),function(data) {
		if(data!=null){
			document.getElementById("show_name").innerHTML = data.lastName;
			document.getElementById("accUserName").value = data.lastName;
		}else{
			document.getElementById("show_name").innerHTML = "";
			document.getElementById("accUserName").value = "";
		}
	});
}

</script>