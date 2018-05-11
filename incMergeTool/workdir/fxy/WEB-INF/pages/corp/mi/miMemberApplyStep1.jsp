<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.modify.member.info"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.modify.member.info"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="miMemberApplyStep1.jhtml" id="miMemberApplyForm" onsubmit="return validateForm(this)">
    
    <spring:bind path="miMemberApply.*">
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
    		<td colspan="2"><fmt:message key="mi.memberApalyStep.explain"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			<input type="text" name="userCode" id="userCode" value="${userCode }" onchange="getStatus()"/>
    			<input type="button" name="showNameBtn" value="<fmt:message key="mi.get.memberName"/>" onclick="showName(this.form.userCode.value);"/>
    			<span id="memberName"></span>
    		</td>
    	</tr>
    </table>
    <table class="detail">
    	<tr><th class="required" ><fmt:message key="miMember.memberNo"/>:</th>
    		<td id="memberNo_id"></td>
    	</tr>
    	<tr><th class="required"><fmt:message key="poOrder.memberName"/>:</th>
    		<td id="memberName_id"></td>
    	</tr>
    	<tr><th class="required" ><fmt:message key="mi.activity.status"/>:</th>
    		<td id="activityStatus_id" style="color: green"></td>
    	</tr>
    	<%-- <tr>
    		<th class="required"><fmt:message key="mi.congelation.status"/>:</th>
    		<td>
    			<span id="freezeStatus_id" style="color: green"></span>
    		</td>
    	</tr> --%>
    	<tr><th class="required" ><fmt:message key="busi.common.acc"/>(<fmt:message key="mi.congelation.status"/>):</th>
    		<td id="freeze_account" style="color: green"></td>
    	</tr>
    	<tr><th class="required" ><fmt:message key="mi.userupdate"/>(<fmt:message key="mi.congelation.status"/>):</th>
    		<td id="freeze_info" style="color: green"></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.lable.limit.status"/>:</th>
    		<td id="limitStatus_id" style="color: green"></td>
    	</tr>
    	<tr><th class="required"><fmt:message key="mi.concle.status"/>:</th>
    		<td id="exitStatus_id" style="color: green"></td>
    	</tr>		
    </table>
    <table class="detail">
    	<tr>
    		<td colspan="2"><fmt:message key="mi.choosetype"/></td>
    	</tr>
    	<tr>
    		<td  colspan="2">
    			<input type="radio" name="modify_type" value="memberInfo" <c:if test="${modify_type=='memberInfo' }">checked="checked"</c:if> /><fmt:message key="mi.modify.info"/><br/>
    			<input type="radio" name="modify_type" value="memberPoint" <c:if test="${modify_type=='memberPoint' }">checked="checked"</c:if>/><fmt:message key="mi.modify.point"/><br/>
    			<input type="radio" name="modify_type" value="memberPwd" <c:if test="${modify_type=='memberPwd' }">checked="checked"</c:if>/><fmt:message key="mi.modify.pwd"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="addMiMemberApply"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				
    				<button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    				<win:power powerCode="addMiMemberApply">
    					<button type="submit" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
    				</win:power>
                </div>
    		</td>
    	</tr>
    </table>
    </form:form>
    <input type="hidden" name="status_true" id="status_true"/>
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
	getStatus();
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证s
	if(theForm.userCode.value==""){
		alert("<fmt:message key='memberNo.required'/>");
		theForm.userCode.focus();
		return false;
	}
	/* if($id("status_true").value != "true"){
		alert("<fmt:message key='mi.status.limited'/>");
		return false;
	} */
	var type = document.getElementsByName("modify_type");
	var typeFlag = false;
	if(type.length>0){
		for(var i = 0; i < type.length ; i++){
			if(type[i].checked){
				typeFlag = true;
				break;
			}
		}
	}
	if(!typeFlag){
		alert("<fmt:message key='mi.choosetype'/>");
		return false;
	}
	showLoading();
	return true;
}
function showName(val) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById("memberName").innerHTML = data.lastName;
	} else {
		document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";
	}
		
	});
}
function getStatus(){
	var memberNo = $id("userCode").value;
	if(memberNo != ""){
		MiMemberAjax.getMiMemberStatus(memberNo,function(data){
			if(data){
				$id("status_true").value = data.status_true;
				$id("memberNo_id").innerHTML = data.member_no;
				$id("memberName_id").innerHTML = data.fullName;
				$id("activityStatus_id").innerHTML = data.ACTIVE_STATUS_V;
				
				$id("limitStatus_id").innerHTML = data.SUSPEND_STATUS_V;
				$id("exitStatus_id").innerHTML = data.EXIT_STATUS_V;
				
				if(data.ACTIVE_STATUS == '0'){
					$id("activityStatus_id").style.color = "red";
				}else if(data.ACTIVE_STATUS == '1'){
					$id("activityStatus_id").style.color = "green";
				}
				$id("freeze_account").innerHTML = data.freezeMenuAccounts;
				$id("freeze_info").innerHTML = data.freezeMenuInfo;
				if(data.FREEZE_MENU_ACCOUNTS == '1'){
					$id("freeze_account").style.color = "red";
				}else{
					$id("freeze_account").style.color = "green";
				}
				if(data.FREEZE_MENU_INFO == '1'){
					$id("freeze_info").style.color = "red";
				}else{
					$id("freeze_info").style.color = "green";
				}
				if(data.SUSPEND_STATUS == '1'){
					$id("limitStatus_id").style.color = "red";
				}else if(data.SUSPEND_STATUS == '0'){
					$id("limitStatus_id").style.color = "green";
				}
				if(data.EXIT_STATUS == '1'){
					$id("exitStatus_id").style.color = "red";
				}else if(data.EXIT_STATUS == '0'){
					$id("exitStatus_id").style.color = "green";
				}
			}
		});
	}
}
function $id(tagId){
	return document.getElementById(tagId);
}
 </script>