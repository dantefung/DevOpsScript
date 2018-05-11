<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="mi.suremember"/></title>
    <meta name="heading" content="<fmt:message key="mi.suremember"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="memberRegisterStep2.jhtml" onsubmit="return validateForm(this)" name="memberRegisterForm" id="memberRegisterForm">
    <input type="hidden" id="newMemberKey" 	name="newMemberKey" 	value="${newMemberKey}"/>
   <%--  <input type="hidden" id="newPoShipKey" 	name="newPoShipKey" 	value="${newPoShipKey}"/>
    <input type="hidden" id="newPoOrderKey" name="newPoOrderKey" 	value="${newPoOrderKey}"/> --%>
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
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.realname"/>:</th>
    		<td>${miMember.lastName }</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="mi.register.petName"/>:</th>
    		<td>${miMember.petName }</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.certificateType"/>:</th>
    		<td><win:code listCode="member.cardtype" value="${miMember.idType }"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.cardNo"/>:</th>
    		<td>${miMember.idNo }</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td>${miMember.mobile }</td>
    	</tr>
    	<tr>
    		<th>&nbsp;<fmt:message key="csServiceCenter.telephone"/>:</th>
    		<td>${miMember.telAreaCode }&nbsp;-&nbsp;${miMember.telphone }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.email"/>:</th>
    		<td>${miMember.email }</td>
    	</tr>
    	
    	<!-- 基本信息end -->


    	<!-- 注册位置start -->
		<tr>
    		<td colspan="2" class="title"><fmt:message key="mi.registplace"/></td>
    	</tr>
    	<c:if test="${miMember.knewMethod==2 }">
	    	<tr>
	    		<th><fmt:message key="mi.recommendNo"/>:</th>
	    		<td>${miMember.recommendNo }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.linkno.lable"/>:</th>
	    		<td>${miMember.linkNo }（<win:code listCode="tree_left_right" value="${miMember.leafType }"/>）</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="mi.cardType"/>:</th>
    		<td>
    			<win:code listCode="member.card.type" value="${miMember.cardType }"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="lang.regist.count"/>:</th>
    		<td>
    			${poOrder.registerCount }
    		</td>
    	</tr>
    	<!-- 注册位置end -->

    	<!-- 收货信息start -->
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="register.us.legend.shipping"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.register.shipType"/>:</th>
    		<td>
    			<win:code listCode="poship.shiptype" value="${poShip.shipType }"></win:code>
    		</td>
    	</tr>
    	
    	<c:if test="${poShip.shipType=='1' }">
	    	<tr>
	    		<th><fmt:message key="pdSendInfo.recipientName"/>:</th>
	    		<td>${poShip.shipLastName }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
	    		<td>${poShip.shipMobile }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
	    		<td>${poShip.shipPhone }</td>
	    	</tr>

	    	<tr>
	    		<th><fmt:message key="mi.addrees.detail"/>:</th>
	    		<td>${shipAddressInfo}${poShip.shipAddress1 }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
	    		<td>${poShip.shipZipCode }</td>
	    	</tr>
	    </c:if>
	    <c:if test="${poShip.shipType=='2' }">
	    	<tr>
	    		<th><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
	    		<td>
	    			${ stWarehouse.warehouseName}
	    		</td>
	    	</tr>
	    </c:if>
    	
    	<!-- 订购商品start -->
    	<tr>
    		<td colspan="2" class="title">&nbsp;<fmt:message key="poOrder.orderingProduct"/></td>
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
	    					<th><fmt:message key="busi.handsel.quantity"/> </th>
	    					<th><fmt:message key="busi.qty.subtotal"/></th>
	    					<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }"><th><fmt:message key="po.shop.amout"/></th></c:if>
	    				</tr>
    				</thead>
    				<tbody>
	    				<c:forEach items="${poOrder.poOrderDetailList }" var="poOrderDetailVar">
	    					<tr>
		    					<td>${poOrderDetailVar.productNo }</td>
		    					<td>${poOrderDetailVar.productName }</td>
		    					<td align="right">${poOrderDetailVar.unitPrice }</td>
		    					<td align="right">${poOrderDetailVar.unitPv }</td>
		    					<td align="right">${poOrderDetailVar.quantity-poOrderDetailVar.handselQuantity }</td>
		    					<td align="right">${poOrderDetailVar.handselQuantity }</td>
		    					<td align="right">${poOrderDetailVar.quantity}</td>
		    					<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
		    					 	<td align="right">${poOrderDetailVar.unitGiveShopAmount}</td>
		    					 </c:if>
		    				</tr>
	    				</c:forEach>
    				</tbody>
    			</table>	
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">&nbsp;<fmt:message key="delivery.product.details"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<table class="table table-bordered table-striped">
    				<thead>
	    				<tr>
	    					<th><fmt:message key="busi.product.productno"/></th>
	    					<th><fmt:message key="pmProduct.productName"/></th>
	    					<th><fmt:message key="po.quantity"/></th>
	    					<th><fmt:message key="package.product.no"/></th>
	    				</tr>
    				</thead>
    				<tbody>
	    				<c:forEach items="${ecDetailList }" var="productVar">
	    					<tr>
		    					<td>${productVar.ecProductNo }</td>
		    					<td>${productVar.productName }</td>
		    					<td align="right">${productVar.quantity }</td>
		    					<td align="right">${productVar.detailProductNo }</td>
		    				</tr>
	    				</c:forEach>
    				</tbody>
    			</table>	
    		</td>
    	</tr>
    	<tr>
    		<th colspan="2">
    			<fmt:message key="po.price.total"/>：<strong><span id="countPriceShow" style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPrice }" /></span></strong>
    		</th>
    	</tr>
    	<tr>
    		<th colspan="2">
    			<fmt:message key="busi.order.pv.total"/>：<strong><span id="countPvShow" style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></span></strong>
    		</th>
    	</tr>
   		<tr>
   			<th colspan="2" align="right" ><fmt:message key="shipping.cost"/>：<strong><span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }" /></span></strong></th>
   		</tr><tr>
   			<th colspan="2" align="right" ><fmt:message key="poOrder.amount"/>：<strong><span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></span></strong></th>
   		</tr>
    	<!-- 订购商品end -->

    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" class="btn btn-danger" onclick="window.location='memberRegisterStep1chooseProduct.jhtml?newMemberKey=${newMemberKey}'"><fmt:message key="mi.returnupdate"/></button>
    				<button type="submit" name="save" class="btn btn-success" onclick="bCancel=false"><fmt:message key="mi.surenoerror"/></button>    				
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