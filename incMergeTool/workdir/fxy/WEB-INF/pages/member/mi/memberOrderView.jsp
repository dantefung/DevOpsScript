<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.viewOrder"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.viewOrder"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

   <table class="detail" width="100%">
   	
   	<tr>
   		<td colspan="4" class="title"><fmt:message key="common.information"/></td>
   	</tr>

   	<tr>
   		<th><fmt:message key="poOrder.orderNo"/>:</th>
   		<td width="50%">${poOrder.orderNo}<span class="label label-info"><win:code listCode="po_order_type" value="${poOrder.orderType }"/></span></td>
   		<c:if test="${poOrder.orderType==1 }">
   			<th><fmt:message key="lang.regist.count"/>:</th>
   			<td width="50%">${poOrder.registerCount }</td>
   		</c:if>
   		<c:if test="${poOrder.orderType!=1 }">
   			<th></th>
   			<td width="50%"></td>
   		</c:if>
   	</tr>
   	<tr>
   		<th><fmt:message key="miMember.memberNo"/>:</th>
   		<td>${poOrder.userCode}</td>
   		<th><fmt:message key="mi.register.petName"/>:</th>
   		<td>${miMember.petName}</td>
   	</tr>
   	<c:if test="${poOrder.orderType == 1 || poOrder.orderType == 19}">
    	<tr>
    		<th><fmt:message key="mi.recommendNo"/>:</th>
    		<td>${miMember.recommendNo}</td>
    		<th><fmt:message key="mi.linkno.lable"/>:</th>
    		<td>${miMember.linkNo}</td>
    	</tr>
   	</c:if>
   	
   	<c:if test="${poOrder.status==100 }">
   		<tr>
    		<th valign="top"><fmt:message key="fiPayAdvice.dealType"/>:</th>
    		<td>
    			<win:code listCode="order_payment_method" value="${poOrder.paymentMethod }" />
    			<c:forEach items="${poOrderPayLogs }" var="poOrderPayLogVar">
		    		<br/>> <win:code listCode="bank_account_types" value="${poOrderPayLogVar.accountType }"/> - 
		    		<fmt:formatNumber pattern="###,##0.00">${poOrderPayLogVar.money }</fmt:formatNumber>
		    	</c:forEach>
    		</td>
    		<th><fmt:message key="poOrder.payerCode"/>:</th>
    		<td>${poOrder.payerCode}&nbsp;${sysUser.userName}</td>
    	</tr>
   	</c:if>
   	<tr>
   		<th><fmt:message key="poOrder.billTime"/>:</th>
  			<td><fmt:formatDate value="${poOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   		<th><fmt:message key="poOrder.payTime"/>:</th>
   		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
   		<%-- <th><fmt:message key="poOrder.calcDate"/>:</th>
   		<td><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
   	</tr>
   	<c:if test="${poOrder.flag == 2}">
   		<tr>
    		<th><fmt:message key="order.giftcode.lable"/>:</th>
    		<td>${poOrder.giftCode}
    		<th><fmt:message key="order.giftcode.money.lable"/>:</th>
    		<td><fmt:formatNumber value="${fiCashGift.money}" pattern="###,##0.00"/></td>
    	</tr>
   	</c:if>
   	<c:if test="${miMember.companyCode=='CN' && poOrder.isPreSell=='1'}">
   	<tr>
   		<th><fmt:message key="order.cale.date.lable"/>:</th>
   		<td colspan="3"><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd"/></td>
   	</tr>
   	</c:if>
   	<c:if test="${not empty poShip}">
	   	<tr>
	   		<td colspan="4" class="title">&nbsp;&nbsp;<fmt:message key="register.us.legend.shipping"/></td>
	   	</tr>
	   	<tr>
	   		<th ><fmt:message key="mi.register.shipType"/>:</th>
	   		<td colspan="3"><win:code listCode="poship.shiptype"  value="${poShip.shipType }"/></td>
	   	</tr>
	   	<c:if test="${poShip.shipType=='1' }">
	    	<tr>
	    		<th><fmt:message key="pdSendInfo.recipientName"/>:</th>
	    		<td colspan="3">${poShip.shipLastName }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.delivery.moblie"/>:</th>
	    		<td colspan="3">${poShip.shipMobile }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="csServiceCenter.telephone"/>:</th>
	    		<td colspan="3">${poShip.shipPhone }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="mi.addrees.detail"/>:</th>
	    		<td colspan="3">${addressInfo}${poShip.shipAddress1 }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
	    		<td colspan="3">${poShip.shipZipCode }</td>
	    	</tr>
	    </c:if>
	    <c:if test="${poShip.shipType=='2' }">
	    	<tr>
	    		<th><fmt:message key="mi.register.shipType.self"/><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
	    		<td colspan="3">
	    			${ stWarehouse.warehouseName}
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.self.rec.addr"/>:</th>
	    		<td colspan="3">
		    		${stWarehouse.address }
	    		</td>
	    	</tr>
	    </c:if>
	    <%-- <tr>
	    	<th><fmt:message key="ai.sendinfo"/>:</th>
	    	<td colspan="3">
	    		<c:if test="${poShip.checkStatus==0 }">未发货</c:if>
	    		<c:if test="${poShip.checkStatus==1 }">
	    			<c:if test="${poShip.confirmStatus==0 }">
	    				正在发货
	    			</c:if>
	    			<c:if test="${poShip.confirmStatus==1 }">
	    				<c:if test="${poShip.receiveStatus==0 }">
	    					已发货
	    				</c:if>
	    				<c:if test="${poShip.receiveStatus==1 }">
	    					已收货
	    				</c:if>
	    			</c:if>
	    		</c:if>
	    	</td>
	    </tr>
	   	<tr>
	   		<th><fmt:message key="order.shippment.sidate"/>:</th>
	   		<td colspan="3"><fmt:formatDate value="${poShip.confirmTime }" pattern="yyyy-MM-dd"/></td>
	   	</tr> --%>
   	</c:if>
   	<!-- 订购商品start -->
   	<tr>
   		<td colspan="4" class="title">&nbsp;<fmt:message key="poOrder.orderingProduct"/></td>
   	</tr>
   	<tr>
   		<td colspan="4">
   			<table width="100%" border="0" class="table poOrderDetails">
				<thead>
					<tr>
						<th width="100"></th>
						<th><fmt:message key="pmProduct.productName"/></th>
						<th><fmt:message key="label.unit.price"/></th>
						<th><fmt:message key="busi.pv"/></th>
						<th><fmt:message key="poOrder.count"/></th>
						<th><fmt:message key="busi.handsel.quantity"/> </th>
						<th><fmt:message key="busi.poMemberOrder.orderPriceTotal"/></th>
						<th><fmt:message key="busi.poMemberOrder.orderPvTotal"/></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${poOrderDetailList }" var="shoppingCartItemVar">
					<tr>
						<td>
							<a name="viewProduct" href="viewProduct.jhtml?productCode=${shoppingCartItemVar.product_no }" class="thumbnail">
								<c:if test="${not empty shoppingCartItemVar.title_pic }">
									<img src="${ctx }${shoppingCartItemVar.title_pic}" class="img-rounded productPic"/>
								</c:if>
								<c:if test="${empty shoppingCartItemVar.title_pic }">
									<img src="${ctx}/themes/${theme }/images/1pixil.gif" class="img-rounded productPic"/>
								</c:if>
							</a>
						</td>
						<td>
							<a name="viewProduct" href="viewProduct.jhtml?productCode=${shoppingCartItemVar.product_no }">${shoppingCartItemVar.product_name }</a>
							<br/>
							${shoppingCartItemVar.product_no }
						</td>
						<td>
							<span class="product_price">¥<fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_price }"/></span>
						</td>
						<td>
							<span class="product_price"><fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_pv }"/></span>
						</td>
						<td align="center">${shoppingCartItemVar.quantity-shoppingCartItemVar.handsel_quantity }</td>
						<td align="center">${shoppingCartItemVar.handsel_quantity }</td>
						<td>
							<span id="goods_price_${shoppingCartItemVar.product_no }" class="product_price">
								¥<fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_price*(shoppingCartItemVar.quantity-shoppingCartItemVar.handsel_quantity)}"/>
							</span>
						</td>
						<td>
							<span id="goods_price_${shoppingCartItemVar.product_no }" class="product_price">
								<fmt:formatNumber pattern="##,###,##0.00" value="${shoppingCartItemVar.unit_pv*(shoppingCartItemVar.quantity-shoppingCartItemVar.handsel_quantity)}"/>
							</span>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
   		</td>
   	</tr>
  	<%-- <tr>
   		<td colspan="4" class="title">&nbsp;发货商品明细</td>
   	</tr>
   	<tr>
   		<td colspan="4">
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
    				<c:forEach items="${poOrderEcItems }" var="productVar">
    					<tr>
	    					<td>${productVar.ec_product_no }</td>
	    					<td>${productVar.product_name }</td>
	    					<td align="right">${productVar.quantity }</td>
	    					<td align="right">${productVar.union_product_no }</td>
	    				</tr>
    				</c:forEach>
   				</tbody>
   			</table>	
   		</td>
   	</tr> --%>
   	<tr>
   		<th colspan="4">
   			<b><fmt:message key="po.price.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPrice }" /></span></b><br/>
			<b><fmt:message key="busi.order.pv.total"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></span></b><br/>
			<b><fmt:message key="pdSendinfo.shippingTax"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }" /></span></b><br/>
			<b><fmt:message key="mi.need.pay.money.lable"/>: <span style="color: red"><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></span>
   		</th>
   	</tr>
	<tr>
   		<td align="center" colspan="4">
   			<button type="button" name="cancel" class="btn btn-default" onclick="window.location='memberOrders.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
   			<c:if test="${(poOrder.status == 20 && (poOrder.paymentMethod == '02' || poOrder.paymentMethod == '05') && poOrder.orderType!=4) && 
					(sessionScope.sessionLoginUser.userCode == poOrder.creatorCode && poOrder.companyCode == sessionScope.sessionLoginUser.companyCode) }">
			<a class="btn btn-success" href="memberOrderPay.jhtml?orderId=${poOrder.orderId}" title="<fmt:message key="mem.pay"/>" name="pay"><fmt:message key="mem.pay"/></a>
		</c:if>
   		</td>
    </tr>
</table>

	<c:if test="${not empty isUrl}">
		<c:if test="${isUrl == 'no'}">
		<table class="detail">
		<tr><td colspan="4" align="center">
		<b><win:code listCode="pd.express.name" value="${shNo}" />&nbsp;&nbsp;&nbsp;${expressInfo}</b>
		</td></tr> 
		</table>
		</c:if>

		<c:if test="${isUrl == 'yes'}">
			 <c:if test="${not empty kaidiUrl}">
			 <c:if test="${kaidiUrl == '0'}">searchkuaiDiInfo exception</c:if>
			 <c:if test="${kaidiUrl != '0'}">
			 <div align="center">
			 	<a href="${kaidiUrl}" name="view" id="btnView"><fmt:message key="lang.query.logistics"/></a>
			 </div>
			 </c:if>
			 </c:if>   
		</c:if>
	</c:if>	    

	    
 <form:form method="post" action="orderReceived.jhtml"  name="poShipForm" id="poShipForm">
	<input type="hidden" name="orderId" id="orderId"/>
 </form:form>
<script type="text/javascript">
function sureReceive(orderId){
	if(confirm('<fmt:message key="mi.order.sure.receive"/>')){
		document.poShipForm.orderId.value = orderId;
		document.poShipForm.submit();
		//window.location.href = "orderReceived1.jhtml?orderId="+orderId;
	}
}

$(document).ready(function(){
	$("#btnView").colorbox({iframe:true, width:"500px", height:"400px"});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
	
	$("a[name='viewProduct']").colorbox({width:"80%", height:"80%"});

});
</script>