<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.input.address"/></title>
    <meta name="heading" content="<fmt:message key="po.input.address"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>

<form:form commandName="poShip" method="post" action="miProductApply.jhtml" onsubmit="return validateForm(this)" name="poShipForm" id="poShipForm">
    
    <spring:bind path="miMember.*">
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
    
     <c:choose>
    	<c:when test="${poShip.shipType=='1' }">
    		<c:set var="shipType1Display" value=""/>
    		<c:set var="shipType2Display" value="none"/>
    	</c:when>
    	<c:when test="${poShip.shipType=='2' }">
    		<c:set var="shipType1Display" value="none"/>
    		<c:set var="shipType2Display" value=""/>
    	</c:when>
    </c:choose>
        
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.register.shipType"/>:</th>
    		<td>
    			<form:select path="shipType" onchange="changeShipType(this.value)">
    				<c:forEach items="${shipTypes}" var="shipTypeVar">
    					<form:option value="${shipTypeVar.key }"><fmt:message key="${shipTypeVar.value}"/></form:option>
    				</c:forEach>
    			</form:select>
    		</td>
    	</tr>
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th class="required"><fmt:message key="pdSendInfo.recipientName"/>:</th>
    		<td><form:input path="shipLastName" id="shipLastName"/></td>
    	</tr>
    	
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td><form:input path="shipMobile" id="shipMobile" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
    	</tr>
    	
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td><form:input path="shipPhone" id="shipPhone" onkeyup="this.value=this.value.replace(/\D/g,'')"/></td>
    	</tr>
    	
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th class="required"><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>
    			<select name="country" id="country" style="width:135px;display: none;"></select>
    			<select name="province" id="province" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    			<select name="city" id="city" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    			<select name="district" id="district" style="width:135px"><option><fmt:message key="list.please.select"/></option></select>
    		</td>
    	</tr>
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th class="required"><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>
    			<form:input path="shipAddress1" id="shipAddress1" style="width:300px;"/>
    			<%-- <br/><form:input path="address2" id="address2" style="width:200px;"/>--%>
    			<br/> 
    			<div style="color: gray;" ><b><fmt:message key="poShip.address.msg1"/><br/><fmt:message key="poShip.address.msg2"/></b></div>
    		</td>
    	</tr>
    	
    	<tr class="shipType1TR" style="display:${shipType1Display};">
    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td><form:input path="shipZipCode" id="shipZipCode" maxlength="6"/></td>
    	</tr>
    	
    	<c:if test="${not empty pickupStWarehouses }">
    		<c:forEach items="${pickupStWarehouses }" var="pickupStWarehouseVar">
    			<tr class="shipType2TR" style="display:${shipType2Display};">
		    		<th>
		    			<form:radiobutton path="warehouseNo" id="warehouseNo_${pickupStWarehouseVar.warehouseCode}" value="${pickupStWarehouseVar.warehouseCode}"/>
		    		</th>
		    		<td>
		    			<label for="warehouseNo_${pickupStWarehouseVar.warehouseCode}">
		    			${ pickupStWarehouseVar.warehouseName}<br/>
		    			自提地址：${pickupStWarehouseVar.address }
		    			</label>
		    		</td>
		    	</tr>
    		</c:forEach>
    	</c:if>
		
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
    				<button type="submit" class="btn btn-success" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
</form:form>

<script type="text/javascript">
$(document).ready(function(){
    refreshChildRegions("${country.regionId}","0","country");
	<c:if test="${not empty district && empty flagAreaCode }">
		refreshChildRegions("${province.regionId}","${country.regionId}","province");
		refreshChildRegions("${city.regionId}","${province.regionId}","city");
		refreshChildRegions("${district.regionId}","${city.regionId}","district");
		
		//document.getElementById("country").value = "${country.regionId}";
	</c:if>
	<c:if test="${flagAreaCode=='-1'}">
		 refreshChildRegions("-1","${country.regionId}","province");
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
  //如果分公司是中国，则可以选择国家
    if('${companyCode}'=="CN"){
    	document.getElementById("country").style.display = "";
    }	
})

function refreshChildRegions(selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,'${companyCode}', function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}

function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	
	var confirmMsg="<fmt:message key='mi.register.enter.confirm.msg'/>!.\n<fmt:message key='mi.register.shipType'/>:";
	confirmMsg+=theForm.shipType.options[theForm.shipType.selectedIndex].text;
	if(theForm.shipType.value=='1'){
		if (theForm.shipType.value == null || theForm.shipType.value == '') {
			alert("<fmt:message key='info.select.shipment.type'/>.");
			theForm.shipType.focus();
			return false;
		}
		
		if (theForm.shipLastName.value == null || theForm.shipLastName.value == '') {
			alert("<fmt:message key='po.ship.lastName.null.require'/>.");
			theForm.shipLastName.focus();
			return false;
		}
		if (theForm.shipMobile.value == null || theForm.shipMobile.value == '') {
			alert("<fmt:message key='mi.telephone.null.requie'/>.");
			theForm.shipMobile.focus();
			return false;
		}
		/* if (theForm.shipPhone.value == null || theForm.shipPhone.value == '') {
			alert("<fmt:message key='po.phone.null.require'/>.");
			theForm.shipPhone.focus();
			return false;
		} */
		
		//if (theForm.country.value == null || theForm.country.value == '' || theForm.country.value == '-1') {
		//	alert("<fmt:message key='mi.country.null.requie'/>.");
		//	theForm.country.focus();
		//	return false;
		//}
		
		if (theForm.province.value == null || theForm.province.value == '' || theForm.province.value == '-1') {
			alert("<fmt:message key='mi.province.null.requie'/>.");
			theForm.province.focus();
			return false;
		}
		
		if (theForm.city.value == null || theForm.city.value == '' || theForm.city.value == '-1') {
			alert("<fmt:message key='mi.city.null.requie'/>.");
			//alert("所在地区-城市不能为空");
			theForm.city.focus();
			return false;
		}
		
		if (theForm.district.value == null || theForm.district.value == '' || theForm.district.value == '-1') {
			alert("<fmt:message key='mi.area.null.requie'/>.");
			//alert("所在地区-区/县不能为空");
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
		confirmMsg+="\n<fmt:message key='pdSendInfo.recipientName'/>:"+theForm.shipLastName.value
		+"\n<fmt:message key='mi.register.mobil'/>:"+theForm.shipMobile.value
		+"\n<fmt:message key='mi.addrees.detail'/>:"+theForm.shipAddress1.value;
	}else if(theForm.shipType.value=='2'){
		var warehouseNo=$("input[name='warehouseNo']:checked").val();
		if (warehouseNo == null || warehouseNo == '') {
			alert("<fmt:message key='请选择需要前往自提的仓库'/>.");
			return false;
		}
		confirmMsg+="\n<fmt:message key='确认前往当前所选择的仓库自提？'/>";
	}

	if(confirm(confirmMsg)){
		//其它验证
		showLoading();
		return true;
	}else{
		return false;
	}
}

function changeShipType(newShipType){
	if(newShipType==1){
		$(".shipType1TR").css("display","");
		$(".shipType2TR").css("display","none");
	}else if(newShipType==2){
		$(".shipType1TR").css("display","none");
		$(".shipType2TR").css("display","");
	}
}
</script>