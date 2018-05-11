<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.input.address"/></title>
    <meta name="heading" content="<fmt:message key="po.fxProduct.order"/>-<fmt:message key="po.input.address"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/SysIdAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="po.input.memberInfo"/></li>
		<li><b>2.<fmt:message key="po.input.address"/></b></li>
		<li>3.<fmt:message key="menu.common.selectProduct"/></li>
		<li>4.<fmt:message key="po.order.info.sure"/></li>
		<li>5.<fmt:message key="po.fxProduct.order.success"/></li>
	</ul>
</c:set>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="poFxProductAcceptAddress.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" id="mtMemberKey" 	name="mtMemberKey" 	value="${mtMemberKey}"/>
    <input type="hidden" id="newPoShipKey" 	name="newPoShipKey" value="${newPoShipKey}"/>
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
    	<!-- 收货信息start -->
    	<tr>
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.register.shipType"/>:</th>
    		<td>
    			<select id="shipType" name="shipType">
    				<c:forEach items="${shipTypeMapForMt }" var="shipTypeVar">
	    				<option value="${shipTypeVar.key }"><fmt:message key="${shipTypeVar.value }"/></option>
    				</c:forEach>
    			</select>
    			
    			<form:hidden path="shipId" id="shipId"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="pdSendInfo.recipientName"/>:</th>
    		<td><form:input path="shipLastName" id="shipLastName"/></td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.register.mobil"/>:</th>
    		<td><form:input path="shipMobile" id="shipMobile" maxlength="11"/></td>
    	</tr>
    	<tr>
    		<th>&nbsp;<fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>
    			<form:input path="shipPhone" id="shipPhone" maxlength="8" style="width:90px;"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>
    			<select name="country" id="country" style="width:135px"></select>
    			<select name="province" id="province" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    			<select name="city" id="city" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    			<select name="district" id="district" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>
    			<form:input path="shipAddress1" id="shipAddress1" style="width:300px;"/>
    			<br/> 
    			<div style="color: gray;" ><b><fmt:message key="poShip.address.msg1"/><br/><fmt:message key="poShip.address.msg2"/></b></div>
    		</td>
    	</tr>
    	
    	<tr>
    		<th><font color="red">*</font><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td><form:input path="shipZipCode" id="shipZipCode" maxlength="6"/></td>
    	</tr>
		<!-- 收货信息end -->
		
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel"  onclick="window.location='poFxProduct.jhtml?mtMemberKey=${mtMemberKey}'"><fmt:message key="button.previous"/></button>
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	refreshChildRegions("${country.regionId}","0","country");
	<c:if test="${not empty district }">
		refreshChildRegions("${province.regionId}","${country.regionId}","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
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
})

function refreshChildRegions(selectedValue, regionId, targetObjId){
	var companyCode = '${sessionLoginUser.companyCode}';
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,companyCode, function(data){
 		dwr.util.addOptions(targetObjId, data);
 		$("#"+targetObjId).val(selectedValue);
	});
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (theForm.shipLastName.value == null || theForm.shipLastName.value == '') {
		alert("<fmt:message key='pdSendInfo.recipientName.notNull'/>.");
		theForm.shipLastName.focus();
		return false;
	}
	
	if (theForm.shipMobile.value == null || theForm.shipMobile.value == '') {
		alert("<fmt:message key='mi.telephone.null.requie'/>.");
		theForm.shipMobile.focus();
		return false;
	}
	
	if (theForm.country.value == null || theForm.country.value == '' || theForm.country.value == '-1') {
		alert("<fmt:message key='mi.country.null.requie'/>.");
		theForm.country.focus();
		return false;
	}
	
	if (theForm.province.value == null || theForm.province.value == '' || theForm.province.value == '-1') {
		alert("<fmt:message key='mi.province.null.requie'/>.");
		theForm.province.focus();
		return false;
	}
	
	if (theForm.city.value == null || theForm.city.value == '' || theForm.city.value == '-1') {
		alert("<fmt:message key='mi.city.null.requie'/>.");
		theForm.city.focus();
		return false;
	}
	
	if (theForm.district.value == null || theForm.district.value == '' || theForm.district.value == '-1') {
		alert("<fmt:message key='mi.area.null.requie'/>.");
		theForm.district.focus();
		return false;
	}
	
	var shipAddress1 = theForm.shipAddress1.value; 
	if (shipAddress1 == null || shipAddress1 == '') {
		alert("<fmt:message key='mi.addrees.nul.requie'/>.");
		theForm.shipAddress1.focus();
		return false;
	}

	/* if (theForm.shipZipCode.value == null || theForm.shipZipCode.value == '') {
		alert("<fmt:message key='mi.post.null.requie'/>.");
		theForm.shipZipCode.focus();
		return false;
	} */
	

	var shipTypeStr = "";
	if(document.getElementById("shipType").value==1){
		shipTypeStr = "<fmt:message key='mi.register.shipType.normal'/>";
	}else if(document.getElementById("shipType").value==2){
		shipTypeStr = "<fmt:message key='mi.register.shipType.self'/>";
	}
	if(confirm("<fmt:message key='mi.register.enter.confirm.msg'/>!."
				+"\n<fmt:message key='mi.register.shipType'/>:"+shipTypeStr
				+"\n<fmt:message key='pdSendInfo.recipientName'/>:"+theForm.shipLastName.value
				+"\n<fmt:message key='mi.register.mobil'/>:"+theForm.shipMobile.value
				+"\n<fmt:message key='mi.addrees.detail'/>:"+theForm.shipAddress1.value)){
		//其它验证
		showLoading();
		return true;
	}else{
		return false;
	}
}

/* 获取会员编号 */
function changeMemberNo() {
	SysIdAjax.getMemberNo(function(data) {
		document.getElementById("memberNoLabel").innerHTML = "<font size='4px;' color='red'>" + data + "</font>";
		document.getElementById("memberNo").value = data;
	});
}

function showName(val,showDiv) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById(showDiv).innerHTML = data.lastName;
	} else {
		document.getElementById(showDiv).innerHTML = "<fmt:message key="function.menu.memberRegister"/><fmt:message key="miMember.notFound"/>";
	}
		
	});
}
</script>