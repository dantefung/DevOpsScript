<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.add.memberStatus.update.applyFor"/></title>
    <meta name="heading" content="<fmt:message key="mi.add.memberStatus.update.applyFor"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="miStateAdjust" method="post" action="editMiStateAdjust.jhtml" onsubmit="return validateForm(this)" id="miStateAdjustForm">
    
    <spring:bind path="miStateAdjust.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/>
    			<input type="button" name="showNameBtn" value="<fmt:message key="mi.get.memberName"/>" onclick="showName(this.form.memberNo.value);"/>
    			<span id="memberName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.department.apply"/>:</th>
    		<td><win:list listCode="mi.department.list" name="applyDepartmemt" id="applyDepartmemt" value="" defaultValue="" showBlankLine="true"/></td>
    	</tr>
    	<tr>
    		<th>&nbsp;</th>
    		<td><form:checkbox path="changeTeam" value="1" label=""/><fmt:message key="mi.adjust.team"/></td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">
    			<label><form:checkbox path="changeSuspendStatus" id="changeSuspendStatus" value="1"/><fmt:message key="mi.abjust.limitStatus.yesorno"/></label>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.new.limitStatus"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newSuspendStatus">
		        	<win:list name="${status.expression}" id="newSuspendStatus" listCode="sysuser.suspendstatus" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">
    			<label><form:checkbox path="changeFreezeStatus" id="changeFreezeStatus" value="1" label=""/><fmt:message key="mi.abjust.frostStatus.yesorno"/></label>
    		</td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="mi.new.frost.status"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newFreezeStatus">
		        	<win:list name="${status.expression}" listCode="sysuser.freezestatus" id="newFreezeStatus" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr> --%>
    	<tr>
    		<th><fmt:message key="mi.freeze.accounts"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newFreezeStatus">
		        	<win:list name="freezeMenuAccounts" listCode="sysuser.freezestatus" id="freezeMenuAccounts" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.freeze.bonus"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newFreezeStatus">
		        	<win:list name="freezeMenuBonus" listCode="sysuser.freezestatus" id="freezeMenuBonus" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.userupdate"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newFreezeStatus">
		        	<win:list name="freezeMenuInfo" listCode="sysuser.freezestatus" id="freezeMenuInfo" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">
    			<label><form:checkbox path="changeExitStatus" id="changeExitStatus" value="1" label=""/><fmt:message key="mi.abjuest.exitStauts.yesorno"/></label>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.new.exitStatus"/>:</th>
    		<td>
    			<spring:bind path="miStateAdjust.newExitStatus">
		        	<win:list name="${status.expression}" listCode="member.exitstatus" id="newExitStatus" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="adjustRemark" id="adjustRemark" rows="6" cssStyle="width:400px;"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miStateAdjust.adjustCode }">
    					<win:power powerCode="deleteMiStateAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiStateAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miStateAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function showName(val) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById("memberName").innerHTML = data.lastName;
	} else {
		document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";
	}
		
	});
}
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(isEmpty(theForm.memberNo.value)){
		alert("<fmt:message key='mi.need.abjust.status.memberNo.null.requie'/>！");
		theForm.memberNo.focus();
		return false;
	}
	if(isEmpty(theForm.applyDepartmemt.value)){
		alert("<fmt:message key='mi.applyDepartmemt.apply.null.requie'/>！");
		theForm.applyDepartmemt.focus();
		return false;
	}
	
	if(!theForm.changeSuspendStatus.checked && !theForm.changeFreezeStatus.checked && !theForm.changeExitStatus.checked){
		alert("<fmt:message key='mi.abjust.least.oneStatus'/>！");
		return false;
	}
	if(isEmpty(theForm.adjustRemark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>！");
		theForm.adjustRemark.focus();
		return false;
	}
	
	showLoading();
	return true;
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}

$("document").ready(function() {
	$("#newSuspendStatus").attr("disabled", $("#changeSuspendStatus").attr("checked")!="checked");
	//$("#newFreezeStatus").attr("disabled", !$("#changeFreezeStatus").attr("checked")!="checked");
	$("#newExitStatus").attr("disabled", !$("#changeExitStatus").attr("checked")!="checked");
	//20130227
	$("#freezeMenuAccounts").attr("disabled", !$("#changeFreezeStatus").attr("checked")!="checked");
	$("#freezeMenuBonus").attr("disabled", !$("#changeFreezeStatus").attr("checked")!="checked");
	$("#freezeMenuInfo").attr("disabled", !$("#changeFreezeStatus").attr("checked")!="checked");
	
	$("#changeSuspendStatus").click(function() {
		if ($(this).is(":checked")) {
			$("#newSuspendStatus").attr("disabled", false);
		} else {
			$("#newSuspendStatus").attr("disabled", true);
		}
	});
	$("#changeFreezeStatus").click(function() {
		if ($(this).is(":checked")) {
			//$("#newFreezeStatus").attr("disabled", false);
			$("#freezeMenuAccounts").attr("disabled", false);
			$("#freezeMenuBonus").attr("disabled", false);
			$("#freezeMenuInfo").attr("disabled", false);
		} else {
			//$("#newFreezeStatus").attr("disabled", true);
			$("#freezeMenuAccounts").attr("disabled", true);
			$("#freezeMenuBonus").attr("disabled", true);
			$("#freezeMenuInfo").attr("disabled", true);
		}
	});
	$("#changeExitStatus").click(function() {
		if ($(this).is(":checked")) {
			$("#newExitStatus").attr("disabled", false);
		} else {
			$("#newExitStatus").attr("disabled", true);
		}
	});
});
</script>