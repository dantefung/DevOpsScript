<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.order.info.sure"/></title>
    <meta name="heading" content="<fmt:message key="po.fxProduct.order"/>-<fmt:message key="po.order.info.sure"/>" />
</head>

<c:set var="leftNavVar" scope="request">
	<ul>
		<li>1.<fmt:message key="po.input.memberInfo"/></li>
		<li>2.<fmt:message key="po.input.address"/></li>
		<li>3.<fmt:message key="menu.common.selectProduct"/></li>
		<li><b>4.<fmt:message key="po.order.info.sure"/></b></li>
		<li>5.<fmt:message key="po.fxProduct.order.success"/></li>
	</ul>
</c:set>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="poFxProductConfirmWork.jhtml" onsubmit="return validateForm(this)" name="poMtOrderForm" id="poMtOrderForm">
    <input type="hidden" id="mtMemberKey" 	name="mtMemberKey" 		value="${mtMemberKey}"/>
    <input type="hidden" id="newPoShipKey" 	name="newPoShipKey" 	value="${newPoShipKey}"/>
    <input type="hidden" id="newPoOrderKey" name="newPoOrderKey" 	value="${newPoOrderKey}"/>
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
    	<!-- 基本信息start -->
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.realname"/>:</th>
    		<td>${miMember.lastName }</td>
    	</tr>
    	<!-- 基本信息end -->
    	
    	<!-- 收货信息start -->
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="register.us.legend.shipping"/></td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.register.shipType"/>:</th>
    		<td>
    			<win:code listCode="poship.shiptype" value="${poShip.shipType }"></win:code>
    		</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="pdSendInfo.recipientName"/>:</th>
    		<td>${poShip.shipLastName }</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.register.mobil"/>:</th>
    		<td>${poShip.shipMobile }</td>
    	</tr>
    	<tr>
    		<th>&nbsp;<fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>${poShip.shipPhone }</td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="miMember.delivery.area"/>:</th>
    		<td>
    			${shipAddressInfo }
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.addrees.detail"/>:</th>
    		<td>${poShip.shipAddress1 }</td>
    	</tr>
    	
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="alProvinceCity.zipCode"/>:</th>
    		<td>${poShip.shipZipCode }</td>
    	</tr>
    	<!-- 收货信息end -->

    	
    	<!-- 订购商品start -->
    	<tr>
    		<td colspan="2" class="title">&nbsp;<fmt:message key="poOrder.orderingProduct"/></td>
    	</tr>
    	<tr>
    		<th class="required"><font color="red">*</font><fmt:message key="mi.register.orderedProduct"/>:</th>
    		<td>
    			<table style="width: 500px;" border="1" cellspacing="0" cellpadding="0">
    				<tr style="height: 30px;">
    					<td><fmt:message key="busi.product.productno"/></td>
    					<td><fmt:message key="pmProduct.productName"/></td>
    					<td><fmt:message key="label.unit.price"/></td>
    					<td><fmt:message key="po.quantity"/></td>
    				</tr>
    				<c:forEach items="${poOrder.poOrderDetailList }" var="poOrderDetailVar">
    					<tr style="height: 30px;">
	    					<td>${poOrderDetailVar.productNo }</td>
	    					<td>${poOrderDetailVar.productName }</td>
	    					<td>${poOrderDetailVar.unitPrice }</td>
	    					<td>${poOrderDetailVar.quantity }</td>
	    				</tr>
    				</c:forEach>
    			</table>	
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">&nbsp;<fmt:message key="products.detail.lable"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<table class="table table-bordered table-striped">
    				<thead>
	    				<tr>
	    					<th><fmt:message key="busi.product.productno"/></th>
	    					<th><fmt:message key="pmProduct.productName"/></th>
	    					<th><fmt:message key="label.unit.price"/></th>
	    					<th><fmt:message key="busi.pv"/></th> 
	    					<th><fmt:message key="po.quantity"/></th>
	    					<th><fmt:message key="package.product.no"/></th>
	    				</tr>
    				</thead>
    				<tbody>
	    				<c:forEach items="${ecDetailList }" var="productVar">
	    					<tr>
		    					<td>${productVar.ecProductNo }</td>
		    					<td>${productVar.productName }</td>
		    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${productVar.unitPrice }"/></td>
		    					<td align="right"><fmt:formatNumber pattern="###,##0" value="${productVar.unitPv }"/></td>
		    					<td align="right">${productVar.quantity }</td>
		    					<td align="right">${productVar.detailProductNo }</td>
		    				</tr>
	    				</c:forEach>
    				</tbody>
    			</table>	
    		</td>
    	</tr>
    	<tr>
    		<th colspan="2" class="required" style="text-align: right;"><fmt:message key="po.price.total"/>：<font color="#FF6600"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></font></th>
    	</tr>
    	<!-- 订购商品end -->
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" onclick="window.location='poFxProductSelectProduct.jhtml?mtMemberKey=${mtMemberKey}&newPoShipKey=${newPoShipKey}&newPoOrderKey=${newPoOrderKey}'"><fmt:message key="mi.returnupdate"/></button>
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="mi.surenoerror"/></button>    				
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	
	if (confirm("<fmt:message key="mi.suresubmitm"/>")) {
		//其它验证
		showLoading();
		return true;
	}

	return false;
}
</script>