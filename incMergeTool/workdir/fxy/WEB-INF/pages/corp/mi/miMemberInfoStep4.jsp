<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.applyFor.modify.member.info"/></title>
    <meta name="heading" content="<fmt:message key="mi.applyFor.modify.member.info"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>

<style>
.tooltip {
    background-color:#000;
    border:1px solid #fff;
    padding:10px 15px;
    width:200px;
    display:none;
    color:#fff;
    text-align:left;
    font-size:12px;
 
    /* outline radius for mozilla/firefox only */
    -moz-box-shadow:0 0 10px #000;
    -webkit-box-shadow:0 0 10px #000;
}
</style>

<div class="contentBody">
    <form:form commandName="miMemberApply" method="post" action="miMemberInfoStep4.jhtml" id="miMemberApplyForm">
    
   	<div class="error" style="display: none;">
    </div>
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
	    	<%-- <tr>
	    		<th><fmt:message key="mi.lable.linkNo"/>:</th>
	    		<td>${miMember.linkNo }</td>
	    	</tr> --%>
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
		    		<td><input type="text" name="mobile" id="mobile" value="${miMember.mobile}" onkeypress="checkNum()" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="miMember.email"/>:</th>
		    		<td><input type="text" name="email" id="email" value="${miMember.email}"/></td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="miMember.delivery.area"/>:</th>
		    		<td>
		    			<select name="country" id="country" style="width:100px"></select>
		    			<select name="province" id="province" style="width:140px"><option value=""><fmt:message key="mi.input.select"/></option></select>
		    			<select name="city" id="city" style="width:140px"><option value=""><fmt:message key="mi.input.select"/></option></select>
		    			<select name="district" id="district" style="width:140px"><option value=""><fmt:message key="mi.input.select"/></option></select>
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
		    		<th class="required"><fmt:message key="mi.lable.group"/>:</th>
		    		<td>
		    			<select name="roleId">
		    				<c:if test="${not empty sysRoles}">
		    					<c:forEach items="${sysRoles }" var="sysRoleVar">
		    						<option value="${sysRoleVar.roleId }"<c:if test="${sysRoleVar.roleId==sysUserRole.roleId }"> selected</c:if>>${sysRoleVar.roleName}</option>
		    					</c:forEach>
		    				</c:if>
		    			</select>
		    		</td>
		    	</tr>
		    </win:power>
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="miMemberApalyCheck.relevance.remark"/></td>
	    	</tr>
	    	<tr>
	    		<th valign="top"><fmt:message key="miMemberApply.createRemark"/>:</th>
	    		<td><textarea name="applyRemark" rows="6" style="width:525px;">${miMemberApply.applyRemark}</textarea></td>
	    	</tr>
	    	<tr>
	    		<th valign="top"><fmt:message key="miMember.remark"/>:<br/><fmt:message key="mi.lable.remark.show"/></th>
	    		<td><textarea name="memberRemark" rows="6" style="width:525px;">${miMemberApply.memberRemark}</textarea></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<form:hidden path="userCode"/>
	    				<input type="hidden" name="strAction" value="addMiMemberApply"/>
	    				<input type="hidden" name="memberApplyKey" value="${memberApplyKey }"/>
	    				<input type="hidden" name="modify_type" value="${param.modify_type }"/>
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				
	    				<button type="button" name="previous" onclick="window.location='miMemberInfoStep2.jhtml?strAction=miMemberInfoStep2&userCode=${param.userCode}&modify_type=${param.modify_type}'"><fmt:message key="button.previous"/></button>
	    				<win:power powerCode="addMiMemberApply">
	    					<button type="button" name="next"  onclick="bCancel=false;validateForm();"><fmt:message key="button.next"/></button>
	    				</win:power>
	    				<%-- <button type="button" name="cancel" onclick="window.location='miMemberApplys.jhtml?memberApplyKey=${memberApplyKey}&modify_type=${param.modify_type }'"><fmt:message key="operation.button.cancel"/></button> --%>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    </form:form>
</div>
<script type="text/javascript">
$(function() {
	$( "#birthDate" ).datepicker();
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
function showResponse(responseText, statusText, xhr, $form)  { 
	if(statusText=="success"){
		if(responseText=="ok"){
			window.location="miMemberApplys.jhtml?needReload=1";
		}else if(responseText=="pointOk"){
			window.location="miMemberInfoPoint.jhtml?memberApplyKey=${memberApplyKey}&modify_type=${param.modify_type}&userCode=${param.userCode}&strAction=miMemberInfoPoint";
		}else{
			hideLoading();
			$('.error').html(responseText);
			$('.error').show();
		}
	}else{
		hideLoading();
		$('.error').html("<fmt:message key='mi.error.retry'/>");
		$('.error').show();
	}
} 
function getAjax(){
	$.ajax({
	    type: "POST",
	    url: "miMemberInfoStep4.jhtml",
	    data: "name=John&location=Boston",
	    success: function(msg){
	      alert( "Data Saved: " + msg );
	    }
	 });
}
//function validateForm(formData, jqForm, options) {
function validateForm() {
	if(bCancel){
		showLoading();
		return true;
	}
   var jqForm = document.getElementById("miMemberApplyForm");
   if(isEmpty(jqForm.petName.value)){
		alert("<fmt:message key='mi.account.petName.null.requie'/>");
		jqForm.petName.focus();
		return ;
	}
	if(isEmpty(jqForm.roleId.value)){
		alert("<fmt:message key='mi.choose.account.group'/>");
		return ;
	}
	if(isEmpty(jqForm.idNo.value)){
		alert("<fmt:message key='mi.cardNo.null.requie'/>");
		jqForm.idNo.focus();
		return ;
	}
		
	if(isEmpty(jqForm.mobile.value)){
		alert("<fmt:message key='mi.account.telephone.null.requie'/>");
		jqForm.mobile.focus();
		return false;
	}else if('${miMember.companyCode}'=="CN" && jqForm.mobile.value.length != 11){
		alert("<fmt:message key='mi.mobile.right.input'/>");
		jqForm.mobile.select();
		return ;
	}
	/* if(isEmpty(jqForm.district.value)|| jqForm.district.value=="-1"){
		alert("<fmt:message key='mi.choose.account.area'/>");
		return ;
	}
	if(isEmpty(jqForm.address1.value)){
		alert("<fmt:message key='mi.address.null.requie'/>");
		jqForm.address1.focus();
		return ;
	} */
	if(isEmpty(jqForm.lastName.value)){
		alert("<fmt:message key='mi.name.null.requie'/>");
		jqForm.lastName.focus();
		return ;
	}
	if(isEmpty(jqForm.applyRemark.value)){
		alert("<fmt:message key='miMemberApply.createRemark.null.reqired'/>");
		jqForm.applyRemark.focus();
		return ;
	}
	if(isEmpty(jqForm.memberRemark.value)){
		alert("<fmt:message key='ic.remark.null.requie'/>");
		jqForm.memberRemark.focus();
		return ;
	} 
	var zipCode = jqForm.zipcode.value;
	var idType = jqForm.idType.value;
	var idNo = jqForm.idNo.value;

	dwr.engine.setAsync(false); 
	AlRegionAjax.validMemberInfo(zipCode,idType,idNo,'${miMember.companyCode}',function(msg){
		if(msg!=null){
			alert(msg);
			//alert("<fmt:message key='"+msg+"' />"); 
			//return false;
		}else{
			//return true;
			jqForm.submit();
		}
	});
	dwr.engine.setAsync(true); 
	//其它验证
	//showLoading();
	//return true;
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
$(document).ready(function(){
	refreshChildRegions("${country.regionId}","0","country");
	<c:if test="${not empty district }">
		refreshChildRegions("${province.regionId}","${country.regionId}","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
		
		$("#country ").val("${country.regionId}");
		$("#province ").val("${province.regionId}");
	</c:if>
    $('#country').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"province");
    	refreshChildRegions("","-1","city");
    	refreshChildRegions("","-1","district");
    });
    $('#province').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"city");
    	refreshChildRegions("","-1","district");
    });
    $('#city').change(function(){
    	refreshChildRegions("",$(this).children('option:selected').val(),"district");
    });
    
    var options = { 
           // beforeSubmit:  validateForm,
            success:       showResponse
        }; 
        // bind form using 'ajaxForm' 
	$('#miMemberApplyForm').ajaxForm(options); 
})

function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,"", function(data){
 		dwr.util.addOptions(targetObjId, data);
 		$("#"+targetObjId).val(selectedValue);
	});
}
function $id(tagId){
	return document.getElementById(tagId);
}
function isNum(num){
	 var reNum=/^\d+\.{0,1}\d*$/;	//数字的正则表达式
	  return(reNum.test(num));
}
 </script>