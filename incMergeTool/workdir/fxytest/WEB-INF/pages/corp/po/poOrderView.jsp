<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrder.orderBasicInformation"/></title>
    <meta name="heading" content="<fmt:message key='poOrder.orderBasicInformation'/>"/>
</head>

<div class="contentBody">
    <table class="detail" width="50%">
    	
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="common.information"/></td> 
    	</tr>

    	<tr>
    		<th><fmt:message key="poOrder.orderNo"/>:</th>
    		<td colspan="3">${poOrder.orderNo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.orderType"/>:</th>
    		<td>
    			<win:code listCode="po_order_type" value="${poOrder.orderType }"/>
    			<c:if test="${poOrder.orderType==1 }">
    				（${poOrder.registerCount }）
    			</c:if>
    		</td>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${poOrder.userCode} / ${miMember.petName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiPayAdvice.dealType"/>:</th>
    		<td><win:code listCode="order_payment_method" value="${poOrder.paymentMethod }" /></td>
    		<th><fmt:message key="poOrder.payStatus"/>:</th>
    		<td><win:code listCode="po_order_status" value="${poOrder.status }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.billFromPersonNo"/>:</th>
    		<td>${poOrder.creatorCode} / ${creatorUser.userName}</td>
    		<th><fmt:message key="poOrder.billTime"/>:</th>
    		<td><fmt:formatDate value="${poOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>

    	<c:if test="${poOrder.flag == 2}">
    		<tr>
	    		<th><fmt:message key="order.giftcode.lable"/>:</th>
	    		<td>${poOrder.giftCode}
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="order.giftcode.money.lable"/>:</th>
	    		<td><fmt:formatNumber value="${fiCashGift.money}" pattern="###,##0.00"/></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th>收货地区:</th>
    		<td colspan="3">${fullRegionName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td colspan="3">${poOrder.remark}</td>
    	</tr>
    	
    	<c:if test="${poOrder.status==100 }">
    		<tr>
	    		<td colspan="4" class="title">&nbsp;&nbsp;付款信息</td>
	    	</tr>
			<tr>
	    		<th><fmt:message key="poOrder.payerNo"/>:</th>
	    		<td>${poOrder.payerCode} / ${payUser.userName}</td>
	    		<th><fmt:message key="poOrder.payTime"/>:</th>
	    		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="poOrder.calcDate"/>:</th>
	    		<td colspan="3"><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
	    	<c:forEach items="${poOrderPayLogs }" var="poOrderPayLogVar">
		    	<tr>
		    		<th><win:code listCode="bank_account_types" value="${poOrderPayLogVar.accountType }"/>：</th>
		    		<td colspan="3">
		    			<fmt:formatNumber pattern="###,##0.00">${poOrderPayLogVar.money }</fmt:formatNumber>
		    		</td>
		    	</tr>
		    </c:forEach>
    	</c:if>

    	<tr>
    		<td colspan="4" class="title">&nbsp;&nbsp;<fmt:message key="register.us.legend.shipping"/></td>
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
	    		<td colspan="3">${poShip.shipLastName }</td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="mi.register.mobil"/>:</th>
	    		<td>${poShip.shipMobile }</td>
	    		<th>&nbsp;<fmt:message key="csServiceCenter.telephone"/>:</th>
	    		<td>${poShip.shipPhone }</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.shippingAddress"/>:</th>
	    		<td colspan="3">
	    			${shipAddressInfo }${poShip.shipAddress1 }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="alProvinceCity.zipCode"/>:</th>
	    		<td colspan="3">${poShip.shipZipCode }</td>
	    	</tr>
    	</c:if>
	
    	<c:if test="${poOrder.orderType !=12 }">
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="poOrder.orderingProduct"/></td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
						items="poOrderDetailList"
						var="poOrderDetailVar"
						showPagination="false"
						width="100%" method="get" sortable="false" showStatusBar="false"
						>
						<ec:row>
							<ec:column property="productNo" title="busi.product.productno" />
							<ec:column property="productName" title="pmProduct.productName">
								${poOrderDetailVar.pmProduct.productName }
							</ec:column>
							<ec:column property="unitPrice" title="label.unit.price" styleClass="numberColumn">
								<span class="${returnCss}">
									<fmt:formatNumber pattern="###,##0.00" value="${poOrderDetailVar.unitPrice }"/>
								</span>
							</ec:column>
							<ec:column property="unitPv" title="busi.pv" styleClass="numberColumn">
								<span class="${returnCss}">
									<fmt:formatNumber pattern="###,##0.00" value="${poOrderDetailVar.unitPv }"/>
								</span>
							</ec:column>
							<ec:column property="111" title="poOrder.count" styleClass="numberColumn">
								<span class="${returnCss}">
									${poOrderDetailVar.quantity-poOrderDetailVar.handselQuantity }
								</span>
							</ec:column>
							<ec:column property="handselQuantity" title="busi.handsel.quantity" styleClass="numberColumn">
								<span class="${returnCss}">
									${poOrderDetailVar.handselQuantity }
								</span>
							</ec:column>
							<ec:column property="quantity" title="busi.qty.subtotal" styleClass="numberColumn"/>
							<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
								<ec:column property="unitGiveShopAmount" title="po.shop.amout" styleClass="numberColumn"/>
							</c:if>
						</ec:row>
					</ec:table>
    		</td>
    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="4" class="title">&nbsp;<fmt:message key="products.detail.lable"/></td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
						items="poOrderEcItems"
						var="itemVar"
						showPagination="false"
						width="100%" method="get" sortable="false" showStatusBar="false"
						>
						<ec:row>
							<ec:column property="ec_product_no" title="busi.product.productno" />
							<ec:column property="productName" title="pmProduct.productName">
								${itemVar.product_name }
							</ec:column>
							<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
								<span class="${returnCss}">
									<fmt:formatNumber pattern="###,##0.00" value="${itemVar.unit_price }"/>
								</span>
							</ec:column>
							<ec:column property="unitPv" title="busi.pv" styleClass="numberColumn">
								<span class="${returnCss}">
									<fmt:formatNumber pattern="###,##0.00" value="${itemVar.unit_pv }"/>
								</span>
							</ec:column>
							<ec:column property="quantity" title="po.quantity" styleClass="numberColumn"/>
							<ec:column property="union_product_no" title="package.product.no" />
						</ec:row>
					</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="4" align="right">
		    		<fmt:message key="poAssistMemberOrder.productAmount"/>:
		    		<strong><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPrice }" /></strong></br>
					<fmt:message key="busi.order.pv.total"/>:
		    		<strong><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></strong></br>
		    		<fmt:message key="bonus.order.amount"/>:
		    		<strong><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></strong></br>
		    		<fmt:message key="pdSendinfo.shippingTax"/>:
		    		<strong><fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }" /></strong>
		    	<%-- <c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
		    		<br/><fmt:message key="po.shop.amout.total"/>:
		    		<strong><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalGiveShopAmount }" /></strong>
		    	</c:if> --%>
		    	</tr>
    		</td>
    	</tr>
		
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<button type="button" name="cancel" onclick="history.back(-1);"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>