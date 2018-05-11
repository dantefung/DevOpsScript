<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="po.order.info.sure"/></title>
    <meta name="heading" content="<fmt:message key="po.order.info.sure"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="agentRegisterStep3.jhtml"  name="poShipForm" id="poShipForm">
	    <input type="hidden" id="newAgentRegisterKey" name="newAgentRegisterKey" value="${newAgentRegisterKey}"/>
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
	    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="common.information"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.memberNo"/>:</th>
	    		<td>${memberNo }</td>
	    	</tr>
	    	<%-- <tr>
	    		<th><fmt:message key="mi.store.type.lable"/>:</th>
	    		<td><win:code listCode="mi.store.type.list" value="${storeType }"></win:code> </td>
	    	</tr> --%>
	    	<tr>
	    		<th><fmt:message key="mi.recommendNo"/>:</th>
	    		<td>${agentRecommendNo}</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="服务点编号"/>:</th>
	    		<td>${agentLinkNo}</td>
	    	</tr>
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
	    	<!-- 收货信息end -->
		    <tr><td colspan="2"></td></tr>
		    <tr>
	    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="poOrder.orderingProduct"/></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<table class="table table-bordered table-striped">
	    				<thead>
		    				<tr>
		    					<th><fmt:message key="busi.product.productno"/></th>
		    					<th><fmt:message key="pmProduct.productName"/></th>
		    					<th><fmt:message key="label.unit.price"/></th>
		    					<th><fmt:message key="po.quantity"/></th>
		    					<th><fmt:message key="busi.handsel.quantity"/> </th>
		    					<th><fmt:message key="busi.qty.subtotal"/></th>
		    				</tr>
	    				</thead>
	    				<tbody>
		    				<c:forEach items="${detailList }" var="productVar">
		    					<tr>
			    					<td>${productVar.productNo }</td>
			    					<td>${productVar.pmProduct.productName }</td>
			    					<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${productVar.unitPrice }"/></td>
			    					<td align="right">${productVar.quantity-productVar.handselQuantity }</td>
			    					<td align="right">${productVar.handselQuantity }</td>
			    					<td align="right">${productVar.quantity}</td>
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
	    		<th colspan="2">
	    			<b><fmt:message key="po.price.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${sessionScope[newAgentRegisterKey].newPoOrder.totalPrice }" /></span></b>
	    			<br/>
	    			<b><fmt:message key="mi.need.pay.money.lable"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${sessionScope[newAgentRegisterKey].newPoOrder.totalAmount }" /></span></b>
	    		</th>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<button type="button" name="previous" class="btn btn-default" onclick="window.location='agentRegisterStep2chooseProduct.jhtml?newAgentRegisterKey=${newAgentRegisterKey}'"><fmt:message key="button.previous"/></button>
	    				<button type="button" name="next" class="btn btn-success" onclick="bCancel=false;validateForm();"><fmt:message key="mi.surenoerror"/></button>
	                </div>
	    		</td>
	    	</tr>
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