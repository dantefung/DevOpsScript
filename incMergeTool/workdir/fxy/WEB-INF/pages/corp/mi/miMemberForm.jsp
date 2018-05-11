<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.editMiMember"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.editMiMember"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlCompanyAjax.js"></script>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="editMiMember.jhtml" onsubmit="return validateForm(this)" id="miMemberForm" name="miMemberForm">
    
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
	    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
	    <table class="detail">
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.memberNo"/>:</th>
	    		<td>${miMember.memberNo }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.recommendNo"/>:</th>
	    		<td>${miMember.recommendNo }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.lable.linkNo"/>:</th>
	    		<td>${miMember.linkNo }</td>
	    	</tr>
	    	<win:power powerCode="editMiMemberPower">
		    	<tr>
		    		<td colspan="2" class="title"><fmt:message key="miMemberApalyCheck.logionStatus.power"/></td>
		    	</tr>
		    	<tr style="display: none;">
		    		<th class="required"><fmt:message key="is.community.store"/>:</th>
		    		<td>
		    			<win:list name="isAgent" listCode="yesno" defaultValue="0" value="${miMember.isAgent }"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th>所属公司:</th>
		    		<td>
		    			<select name="companyCode" id="companyCode">
				        	<c:forEach items="${alCompanys}" var="alCompanyVar">
			        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==miMember.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
				    		</c:forEach>
				        </select>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="mi.lable.group"/>:</th>
		    		<td>
		    			<select name="roleId" id="roleId"></select>
		    		</td>
		    	</tr>
		    </win:power>
	    	
	    	<win:power powerCode="editMiMemberBasic">
		    	<tr>
		    		<th class="required"><fmt:message key="mi.register.petName"/>:</th>
		    		<td><input type="text" name="petName" id="petName" value="${miMember.petName}" title="<fmt:message key="mi.new.petName.null.requie"/>"/></td>
		    	</tr>
		    	<tr>
		    		<td colspan="2" class="title"><fmt:message key="mi.lable.contact.info"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
		    		<td>
		    			<input type="text" name="telAreaCode" id="telAreaCode" size="6" value="${miMember.telAreaCode}"/> - <input type="text" name="telphone" id="telphone" value="${miMember.telphone}"/>
		    			<fmt:message key="mi.areaCode.phone"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
		    		<td><input type="text" name="mobile" id="mobile" value="${miMember.mobile}"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="miMember.email"/>:</th>
		    		<td><input type="text" name="email" id="email" value="${miMember.email}"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="miMember.delivery.area"/>:</th>
		    		<td>
		    			<div id="regionDiv"></div>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th valign="top"><fmt:message key="miMember.delivery.addr"/>:</th>
		    		<td>
		    			<input type="text" name="address1" id="address1" size="60" value="${miMember.address1}"/>
		    			<br/><input type="text" name="address2" id="address2" size="60" value="${miMember.address2}"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
		    		<td><input type="text" name="zipcode" id="zipcode" value="${miMember.zipcode}"/></td>
		    	</tr>
		    </win:power>
		    <win:power powerCode="editMiMemberSpecial">
		    	<tr>
		    		<td colspan="2" class="title"><fmt:message key="mi.lable.spacial.info"/></td>
		    	</tr>
		    	<tr>
		    		<tr>
		    		<th><fmt:message key="attach.order.center"/>:</th>
		    		<td><input type="text" name="agentNo" id="agentNo" value="${miMember.agentNo}"/></td>
		    	</tr>
		    	<tr>
		    		<tr>
		    		<th class="required"><fmt:message key="poOrder.memberName"/>:</th>
		    		<td><input type="text" name="lastName" id="lastName" value="${miMember.lastName}"/></td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="miMember.certificateType"/>:</th>
		    		<td>
				        <win:list name="idType" listCode="member.cardtype" value="${miMember.idType}" defaultValue="0"/>
		    		</td>
		    	</tr>
		    	<tr>
		    		<th class="required"><fmt:message key="mi.lable.cardNo"/>:</th>
		    		<td><input type="text" name="idNo" id="idNo" value="${miMember.idNo}"/></td>
		    	</tr>
		    </win:power>
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="miMemberApalyCheck.relevance.remark"/></td>
	    	</tr>
	    	<tr>
	    		<th valign="top"><fmt:message key="busi.common.remark"/>:</th>
	    		<td><textarea name="newRemark" rows="6" cols="60"></textarea></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<form:hidden path="memberNo"/>
	    				<input type="hidden" name="strAction" value="${param.strAction }"/>
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<win:power powerCode="${param.strAction }">
	    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
	    				</win:power>
	    				<button type="button" name="cancel" onclick="window.location='miMembers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm() {
	if(bCancel){
		showLoading();
		return true;
	}
	var theForm=document.miMemberForm;
	if(theForm.roleId.value==""){
		alert("<fmt:message key='mi.choose.account.group'/>");
		return false;
	}
	if(theForm.petName.value==""){
		alert("<fmt:message key='mi.account.petName.null.requie'/>");
		theForm.petName.focus();
		return false;
	}
	if(theForm.mobile.value==""){
		alert("<fmt:message key='mi.account.telephone.null.requie'/>");
		theForm.mobile.focus();
		return false;
	}
	if(theForm.lastName.value==""){
		alert("<fmt:message key='mi.name.null.requie'/>");
		theForm.lastName.focus();
		return false;
	}
	if(theForm.idNo.value==""){
		alert("<fmt:message key='mi.cardNo.null.requie'/>");
		theForm.idNo.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}

$("#companyCode").change(function(){
	var companyCode=$(this).val();
	showRoleSelector(companyCode,'');
	showRegionSelector(companyCode,'');
});

function showRoleSelector(companyCode,roleId){
	AlCompanyAjax.getCompanyAndRolesByRegionId(companyCode,function(data) {
		if(data!=null){
			dwr.util.removeAllOptions("roleId");
			dwr.util.addOptions("roleId", data, "role_id","role_name");
			dwr.util.setValue("roleId", roleId);
		}
	});
}

function showRegionSelector(companyCode, regionCode){
	$('#regionDiv').regionSelector({
		companyCode:companyCode,
		regionCode:regionCode
	});
}

$(document).ready(function(){
	showRegionSelector("${miMember.companyCode}","${miMember.areaCode}");
	showRoleSelector("${miMember.companyCode}","${sysUserRole.roleId}");
	
	var options = {
			beforeSubmit:  validateForm,
			success:       showResponse
        }; 
	$('#miMemberForm').ajaxForm(options); 
});

function showResponse(responseText, statusText, xhr, $form)  { 
	if(statusText=="success"){
		if(responseText=="ok"){
			window.location="miMembers.jhtml?needReload=1";
		}else{
			hideLoading();
			alert(responseText);
		}
	}else{
		hideLoading();
		alert("<fmt:message key='mi.error.retry'/>");
	}
} 

</script>