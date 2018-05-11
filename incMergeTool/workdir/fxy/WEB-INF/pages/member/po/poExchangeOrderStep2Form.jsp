<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.input.address"/></title>
    <meta name="heading" content="<fmt:message key="po.input.address"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<form:form commandName="poShip" method="post" action="poExchangeOrderStep2.jhtml" onsubmit="return validateForm(this)" name="poShipForm" id="poShipForm" cssClass="form-horizontal">
    
    <spring:bind path="poShip.*">
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
    
    <p class="text-muted"><fmt:message key="item.in.bold.required"/></p>
	<fmt:message key="mi.mustred"/>
	<hr/>
	
	<div class="row">
		<div class="col-md-7">
			<div class="form-group form-group-sm">
		    	<label class="col-sm-3 control-label required"><fmt:message key="mi.register.shipType"/>:</label>
		    	<div class="col-sm-9">
		    		<form:select path="shipType" onchange="changeShipType()" cssClass="form-control">
	    				<c:forEach items="${shipTypes}" var="shipTypeVar">
	    					<form:option value="${shipTypeVar.key }"><fmt:message key="${shipTypeVar.value}"/></form:option>
	    				</c:forEach>
	    			</form:select>
	    			<form:hidden path="shipId" id="shipId"/>
		    	</div>
			</div>
			
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label required"><fmt:message key="pdSendInfo.recipientName"/>:</label>
		    	<div class="col-sm-9">
		    		<form:input path="shipLastName" id="shipLastName" cssClass="form-control"/>
		    	</div>
			</div>
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label required"><fmt:message key="mi.register.mobil"/>:</label>
		    	<div class="col-sm-9">
		    		<form:input path="shipMobile" id="shipMobile" maxlength="11" cssClass="form-control"/>
		    	</div>
			</div>
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label"><fmt:message key="csServiceCenter.telephone"/>:</label>
		    	<div class="col-sm-9">
		    		<form:input path="shipPhone" id="shipPhone" maxlength="8" cssClass="form-control"/>
		    	</div>
			</div>
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label required"><fmt:message key="miMember.delivery.area"/>:</label>
		    	<div class="col-sm-9">
		    		<div id="regionDiv"></div>
		    	</div>
			</div>
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label required"><fmt:message key="mi.addrees.detail"/>:</label>
		    	<div class="col-sm-9">
		    		<form:input path="shipAddress1" id="shipAddress1" cssClass="form-control"/>
	    			<br/> 
	    			<p class="help-block"><fmt:message key="poShip.address.msg1"/><br/><fmt:message key="poShip.address.msg2"/></b></p>
		    	</div>
			</div>
			<div class="form-group form-group-sm shipType1TR">
		    	<label class="col-sm-3 control-label"><fmt:message key="alProvinceCity.zipCode"/>:</label>
		    	<div class="col-sm-9">
		    		<form:input path="shipZipCode" id="shipZipCode" maxlength="6" cssClass="form-control"/>
		    	</div>
			</div>
			<!-- 自提 -->
	    	<c:if test="${not empty pickupStWarehouses }">
	    		<div class="form-group form-group-sm shipType2TR">
				    <label class="col-sm-3 control-label required">自提仓库:</label>
				    <div class="col-sm-9">
			    		<c:forEach items="${pickupStWarehouses }" var="pickupStWarehouseVar">
			    			<div class="radio shipType2TR">
		  						<label for="warehouseNo_${pickupStWarehouseVar.warehouseCode}">
		    						<form:radiobutton path="warehouseNo" id="warehouseNo_${pickupStWarehouseVar.warehouseCode}" value="${pickupStWarehouseVar.warehouseCode}"/>
		    						${ pickupStWarehouseVar.warehouseName}<br/>
					    			自提地址：${pickupStWarehouseVar.address }
		  						</label>
							</div>
			    		</c:forEach>
	    			</div>
				</div>
	    	</c:if>
	    	
	    	<hr/>
			<div class="form-group form-group-sm">
				<div class="col-sm-12 text-center">
  					<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
					<button type="button" class="btn btn-default" name="previous" onclick="window.location='poExchangeOrderStep1.jhtml?strAction=${param.strAction }&newOrderKey=${newOrderKey }'"><fmt:message key="button.previous"/></button>
    				<button type="submit" class="btn btn-success" name="next" onclick="bCancel=false"><fmt:message key="button.next"/></button>
				</div>
			</div>
		</div>
	</div>
    
</form:form>

<script type="text/javascript">

    var topNodeId='${topNodeId}';
$(document).ready(function(){
	$('#regionDiv').regionSelector({
		startRegionId:topNodeId,
		width:'',
		cssName:'form-control',
		regionCode:'${poShip.shipAreaCode}'
	});
	
	changeShipType();
})

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
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
	}else if(theForm.shipType.value=='2'){
		var warehouseNo=$("input[name='warehouseNo']:checked").val();
		if (warehouseNo == null || warehouseNo == '') {
			alert("<fmt:message key='请选择需要前往自提的仓库'/>.");
			return false;
		}
	}

	//其它验证
	showLoading();
	return true;
}

function changeShipType(){
	var theForm=document.poShipForm;
	if(theForm.shipType.value==1){
		$(".shipType1TR").css("display","");
		$(".shipType2TR").css("display","none");
	}else if(theForm.shipType.value==2){
		$(".shipType1TR").css("display","none");
		$(".shipType2TR").css("display","");
	}
}
</script>