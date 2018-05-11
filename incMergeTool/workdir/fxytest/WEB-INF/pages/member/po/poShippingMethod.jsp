<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="label.checkout"/></title>
    <meta name="heading" content="<fmt:message key="label.checkout"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<c:set var="isShowSubModules" scope="request" value="0"/>

<form:form commandName="poShip" method="post" action="shippingMethod.jhtml" onsubmit="return validateForm(this)" id="poShipForm">
    
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
    
	<div class="panel panel-default">
		<div class="panel-heading"><fmt:message key="miMember.shippingAddress"/></div>
		<div class="panel-body">
			<c:forEach items="${sysUserAddresss }" var="sysUserAddressVar" varStatus="statusVar">
				<div class="radio">
					<label>
						<input type="radio" name="addressId" id="addressId_${sysUserAddressVar.address_id }" value="${sysUserAddressVar.address_id }"<c:if test="${statusVar.index==0 }"> checked</c:if>>
					    ${sysUserAddressVar.region_name }${sysUserAddressVar.ship_address1 }
					    <br/>${sysUserAddressVar.ship_last_name }<br/>${sysUserAddressVar.ship_phone } ${sysUserAddressVar.ship_mobile }
					</label>
				</div>
			</c:forEach>
			<div class="radio">
				<label>
					<input type="radio" name="addressId" id="addressId_0" value="0"<c:if test="${empty sysUserAddresss }"> checked</c:if>>
					<fmt:message key="label.use.new.shipping.address"/>
				</label>
			</div>
			<table class="detail" id="addressForm">
				<tr>
					<th class="required"><fmt:message key="pdSendInfo.recipientName"/></th>
					<td><input name="shipLastName" class="form-control" type="text" value="${sysUserAddress.shipLastName}" placeholder="<fmt:message key="pdSendInfo.recipientName"/>" /></td>
				</tr>
				<tr>
					<th class="required"><fmt:message key="pdSendInfo.recipientMobile"/></th>
					<td><input name="shipMobile" class="form-control" type="text" value="${sysUserAddress.shipMobile}" placeholder="<fmt:message key="pdSendInfo.recipientMobile"/>" /></td>
				</tr>
				<tr>
					<th class="required"><fmt:message key="miMember.sysUser.userArea"/></th>
					<td>
						<div id="regionDiv"></div>
					</td>
				</tr>
				<tr>
					<th class="required"><fmt:message key="miMember.shippingAddress"/></th>
					<td>
						<input name="shipAddress1" class="form-control" type="text" value="${sysUserAddress.shipAddress1}" placeholder="<fmt:message key="miMember.shippingAddress"/>"/>
					</td>
				</tr>
				<tr>
					<th class="required"><fmt:message key="alProvinceCity.zipCode"/></th>
					<td>
						<input name="shipZipCode" class="form-control" type="text" value="${sysUserAddress.shipZipCode}" placeholder="<fmt:message key="alProvinceCity.zipCode"/>" />
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading"><fmt:message key="label.buy.products.list"/></div>		
			<table width="100%" border="0" class="table poOrderDetails">
				<thead>
					<tr>
						<th width="100"></th>
						<th><fmt:message key="pmProduct.productName"/></th>
						<th><fmt:message key="label.unit.price"/></th>
						<th><fmt:message key="label.awards"/></th>
						<th><fmt:message key="poOrder.count"/></th>
						<th><fmt:message key="busi.poMemberOrder.orderPriceTotal"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${shoppingCartItems }" var="shoppingCartItemVar">
					<tr>
						<td>
							<a href="<c:url value="/viewPmProduct.jhtml"/>?productCode=${shoppingCartItemVar.product_no }" class="thumbnail" target="_blank">
								<c:if test="${not empty shoppingCartItemVar.title_pic }">
									<img src="${ctx }${shoppingCartItemVar.title_pic}" class="img-rounded productPic"/>
								</c:if>
								<c:if test="${empty shoppingCartItemVar.title_pic }">
									<img src="${ctx}/themes/${theme }/images/1pixil.gif" class="img-rounded productPic"/>
								</c:if>
							</a>
						</td>
						<td>
							<a href="<c:url value="/viewPmProduct.jhtml"/>?productCode=${shoppingCartItemVar.product_no }" target="_blank">${shoppingCartItemVar.product_name }</a>
							<br/>
							${shoppingCartItemVar.product_no }
						</td>
						<td>
							<span class="product_price_m">¥<fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_price }"/></span>
						</td>
						<td>
							<span class="product_price_m"><fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_give_shop_amount }"/></span>
						</td>
						<td>${shoppingCartItemVar.quantity }</td>
						<td>
							<span id="goods_price_${shoppingCartItemVar.product_no }" class="product_price_m">
								¥<fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_price*shoppingCartItemVar.quantity}"/>
							</span>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading"><fmt:message key="pdDlSend.transType"/></div>
		<div class="panel-body">
			<table class="detail" width="100%">
				<tr>
					<th class="required" width="60"><fmt:message key="pdDlSend.transType"/></th>
					<td><fmt:message key="label.free.shipping"/></td>
				</tr>
				<tr>
					<th class="required"><fmt:message key="busi.common.remark"/></th>
					<td><input name="remark" id="remark" class="form-control" type="text" placeholder="<fmt:message key="busi.common.remark"/>" style="width: 100%;"></td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-body text-right">
			<fmt:message key="poSell.totalPrice"/>：<span id="spnTotalPrice" class="product_price">¥<fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPrice }"/></span><br/>
			<fmt:message key="label.awards"/>：<span class="product_price"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalGiveShopAmount }"/></span><br/>
			<fmt:message key="shipping.cost"/>：<span id="spnShipPrice">¥<fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }"/></span><br/>
			<fmt:message key="label.should.pay.amount"/>：<span id="spnTotalAmount" class="product_price">¥<fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }"/></span>
		</div>
	</div>
	
	<div class="row">
    	<div class="col-md-3">
    		<button type="button" class="btn btn-default btn-block" onclick="window.location='<c:url value="/shoppingCart.jhtml"/>'"><fmt:message key="label.return.and.modify.product"/></button>
    	</div>
    	<div class="col-md-3  col-md-offset-6">
    		<button type="submit"  class="btn btn-success btn-block"><fmt:message key="pomember.order.new.submit"/></button>
    	</div>
    </div>
	
</form:form>

<script type="text/javascript">
$(document).ready(function(){
	$('#regionDiv').regionSelector({
		startRegionId:'${currentCountry.regionId}',
		width:'400px',
		cssName:'form-control'
	});
});

$("#addressForm input,#addressForm select").focus(function(){
	$("#addressId_0").prop("checked",true);
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	//其它验证
	return true;
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	if(theForm.addressId.value==""){
		alert("<fmt:message key="notice.select.or.create.new.address"/>");
		return false;
	}
	if(theForm.addressId.value=="0"){
		if (theForm.shipLastName.value=="") {
			showMsg('<fmt:message key="po.ship.lastName.null.require"/>');
			theForm.shipLastName.focus();
			return false;
		}
		
		if (theForm.shipMobile.value == null || theForm.shipMobile.value == '') {
			showMsg("<fmt:message key="busi.edit.pdSendInfo.RecipientPhone.isNotEmpty"/>");
			theForm.shipMobile.focus();
			return false;
		}
		
		if (theForm.district.value == null || theForm.district.value == '' || theForm.district.value == '-1') {
			showMsg("<fmt:message key="register.us.select.sysUser.userArea"/>");
			theForm.district.focus();
			return false;
		}
		
		if (theForm.shipAddress1.value=="" || isNumeric(theForm.shipAddress1.value)) {
			showMsg("<fmt:message key="aiAgent.bossAddr.isNull"/>");
			theForm.shipAddress1.focus();
			return false;
		}
	}
	showLoading();
	return true;
}
</script>