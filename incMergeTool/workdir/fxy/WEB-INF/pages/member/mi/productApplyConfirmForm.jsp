<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.order.info.sure"/></title>
    <meta name="heading" content="<fmt:message key="po.order.info.sure"/>"/>
</head>

<form:form commandName="poShip" method="post" action="confirmProductApply.jhtml"  name="poShipForm" id="poShipForm">
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
        
    <table class="detail">
    	<!-- 促销分区选项end -->
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${miMember.memberNo }</td>
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
    	<c:if test="${not empty preSellDate }">
    		<tr>
	    		<th><fmt:message key="order.pre.sell.date.lable"/>:</th>
	    		<td>${preSellDate }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${poShip.shipType=='2' }">
	    	<tr>
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
		    				</tr>
	    				</c:forEach>
    				</tbody>
    			</table>	
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="2" align="right" ><b><fmt:message key="po.price.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${newOrderMap.newPoOrder.totalPrice }" /></span></b></td>
    	</tr>
    	<tr>
    		<td colspan="2" align="right" ><b><fmt:message key="busi.order.pv.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0" value="${newOrderMap.newPoOrder.totalPv }" /></span></b></td>
    	</tr>
		<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" id="strAction" name="strAction" value="${param.strAction}"/>
    				<input type="hidden" id="newOrderKey" name="newOrderKey" value="${newOrderKey}"/>
					<button type="button" class="btn btn-default" name="previous" onclick="window.location='miProductApplyStep2.jhtml?strAction=${param.strAction }&newOrderKey=${newOrderKey }'"><fmt:message key="button.previous"/></button>	    				
    				<button type="button" class="btn btn-success" name="next" onclick="bCancel=false;validateForm();"><fmt:message key="mi.surenoerror"/></button>
                </div>
    		</td>
    	</tr>
    </table>

</form:form>

<script type="text/javascript">
$(function() {

});
function validateForm() {
	if(confirm("<fmt:message key="mi.surenoerror"/>")){
		showLoading();
		document.poShipForm.submit();
	}
}
</script>