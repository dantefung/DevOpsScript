<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.order.info.sure"/></title>
    <meta name="heading" content="<fmt:message key="po.order.info.sure"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="confirmPoUpgrade.jhtml"  name="poShipForm" id="poShipForm">
    <input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
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
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="po.old.grade"/>:</th>
    		<td><win:code listCode="member.card.type"  value="${miMember.cardType }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="po.new.grade"/>:</th>
    		<td><win:code listCode="member.card.type"  value="${newOrderMap.newCardType }"/></td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="register.us.legend.shipping"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.register.shipType"/>:</th>
    		<td><win:code listCode="poship.shiptype"  value="${poShip.shipType }"/></td>
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
	    		<th><fmt:message key="miMember.delivery.area"/>:</th>
	    		<td>${addressInfo}</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.addrees.detail"/>:</th>
	    		<td>${poShip.shipAddress1 }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
	    		<td>${poShip.shipZipCode }</td>
	    	</tr>
	    </c:if>
	    <c:if test="${poShip.shipType=='2' }">
	    	<%-- <tr>
	    		<th><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
	    		<td>
	    			${ stWarehouse.warehouseName}
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>自提地址:</th>
	    		<td>
		    		${stWarehouse.address }
	    		</td>
	    	</tr> --%>
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
	    					<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
	    						 <th><fmt:message key="po.shop.amout"/></th>
	    					</c:if>
	    				</tr>
    				</thead>
    				<tbody>
	    				<c:forEach items="${detailList }" var="productVar">
	    					<tr>
		    					<td>${productVar.productNo }</td>
		    					<td>${productVar.pmProduct.productName }</td>
		    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${productVar.unitPrice }"/></td>
		    					<td align="right"><fmt:formatNumber pattern="###,##0" value="${productVar.unitPv }"/></td>
		    					<td align="right">${productVar.quantity-productVar.handselQuantity }</td>
		    					<td align="right">${productVar.handselQuantity }</td>
		    					<td align="right">${productVar.quantity}</td>
		    					<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
		    						<td align="right">${productVar.unitGiveShopAmount}</td>
		    					</c:if>
		    				</tr>
	    				</c:forEach>
    				</tbody>
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
    		<td colspan="2" align="right" >
    			<b><fmt:message key="po.price.total"/>:<span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${newOrderMap.newPoOrder.totalPrice }" /></span></b>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" align="right" ><b><fmt:message key="busi.order.pv.total"/>:<span style="color: red"><fmt:formatNumber pattern="###,##0" value="${newOrderMap.newPoOrder.totalPv }" /></span></b></td>
    	</tr>
   		<tr>
   			<td colspan="2" align="right" ><b><fmt:message key="shipping.cost"/>:<span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }" /></span></b></td>
   		</tr>
   		<tr>
   			<td colspan="2" align="right" ><b><fmt:message key="poOrder.amount"/>:<span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></span></b></td>
   		</tr>
    	<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
	    	<tr>
	    		<td colspan="2" align="right" ><b><fmt:message key="po.shop.amout.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalGiveShopAmount }" /></span></b></td>
	    	</tr>
    	</c:if>
		<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
					<button type="button" class="btn btn-default" name="previous" onclick="window.location='poUpgradeStep3.jhtml?strAction=${param.strAction }&newOrderKey=${newOrderKey }'"><fmt:message key="button.previous"/></button>	    				
    				<button type="button" class="btn btn-success" name="next" onclick="bCancel=false;validateForm();"><fmt:message key="mi.surenoerror"/></button>
                </div>
    		</td>
    	</tr>
    </table>

		
		 <table class="detail" width="100%">
				 
	    </table>
    </form:form>
</div>

<script type="text/javascript">
$(function() {

});
function validateForm() {
	if(confirm("<fmt:message key="mi.surenoerror"/>")){
		document.poShipForm.submit();
	}
}
</script>