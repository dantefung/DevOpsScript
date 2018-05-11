<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="poOrder.orderBasicInformation"/></title>
    <meta name="heading" content="<fmt:message key='poOrder.orderBasicInformation'/>"/>
</head>

<div class="contentBody">
    <table class="detail" width="50%">
    	
    	<tr>
    		<td colspan="2" class="title" style="text-align: left; "><fmt:message key="common.information"/></td> 
    	</tr>

    	<tr>
    		<th style="width:20%;"><fmt:message key="poOrder.orderNo"/>:</th>
    		<td>${poOrder.orderNo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${poOrder.userCode}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.register.petName"/>:</th>
    		<td>${miMember.petName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poAssistMemberOrder.productAmount"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPrice }" /></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bonus.order.amount"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></td>
    	</tr>
    	<%-- <c:if test="${poOrder.orderType !=12 }">
    	<tr>
    		<th><fmt:message key="pdSendinfo.shippingTax"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poShip.shipPrice }" /></td>
    	</tr>
    	</c:if> --%>
    	<c:if test="${not empty poOrder.totalGiveShopAmount && poOrder.totalGiveShopAmount>0 }">
	    	<tr>
	    		<th><fmt:message key="po.shop.amout.total"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalGiveShopAmount }" /></td>
    		</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="busi.order.pv.total"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="pd.orderType"/>:</th>
    		<td><win:code listCode="po_order_type" value="${poOrder.orderType }"/></td>
    	</tr>
    	<c:if test="${poOrder.orderType == 14 || poOrder.orderType == 15}">
	    	 <tr>
	    		<th><fmt:message key="mi.sendPV.lable"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.giveTotalPv }" /></td>
	    	 </tr>
	    	 <tr>
	    		<th><fmt:message key="mi.recommendNo"/>:</th>
	    		<td>${miMember.agentRecommendNo }</td>
	    	 </tr>
    	 </c:if>
    	 <c:if test="${poOrder.orderType ==11 }">
     	<tr>
    		<th><fmt:message key="busi.common.conference.site"/>:</th>
    		<td>${poOrder.conferenceSite}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>${poOrder.remark}</td>
    	</tr>    	   	 
    	 </c:if>
    	 <c:if test="${poOrder.orderType ==12 }">
    	 <tr>
	   		<th><fmt:message key="pmProductSppm.checkUser"/> :</th>
	   		<td>${poOrder.checkerCode}</td>
	    </tr>
    	 <tr>
	   		<th><fmt:message key="icAnnounce.checkTime"/> :</th>
	   		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    </tr>	    
    	 <tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>${poOrder.remark}</td>
    	</tr>  
    	 </c:if>
    	<c:if test="${poOrder.orderType !=11 && poOrder.orderType !=12}">
    	<tr>
    		<th><fmt:message key="fiPayAdvice.dealType"/>:</th>
    		<td><win:code listCode="order_payment_method" value="${poOrder.paymentMethod }" /></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.payStatus"/>:</th>
    		<td><win:code listCode="po_order_status" value="${poOrder.status }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.billFromPersonNo"/>:</th>
    		<td>${poOrder.creatorCode}</td>
    	</tr>
    	<tr>
    		<!-- <th><fmt:message key="poOrder.billFromPersonName"/>:</th> -->
    		<th><fmt:message key="mem.po.ordername"/> :</th>
    		<td>${creatorUserPetName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.billTime"/>:</th>
    		<td><fmt:formatDate value="${poOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
    	</tr>
    	</c:if>
    	<c:if test="${poOrder.orderType !=12 }">
    	<c:if test="${poOrder.status==100 }">
			<tr>
	    		<th><fmt:message key="poOrder.payerNo"/>:</th>
	    		<td>${poOrder.payerCode}</td>
	    	</tr>
	    	<tr>
	    		<!-- <th><fmt:message key="poOrder.payerName"/>:</th> --> 
	    		<th><fmt:message key="mem.po.payname"/> :</th>
	    		<td>${payUserPetName}</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="poOrder.payTime"/>:</th>
	    		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${miMember.companyCode=='CN' && poOrder.isPreSell=='1'}">
	    	<tr>
	    		<th><fmt:message key="order.cale.date.lable"/>:</th>
	    		<td><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd"/></td>
	    	</tr>
    	</c:if>
    	</c:if>
    	<c:if test="${strAction == 'poUpgrade' }">
    		<tr>
	    		<th ><fmt:message key="po.old.grade"/>:</th>
	    		<td><win:code listCode="member.card.type"  value="${miMember.cardType }"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="po.new.grade"/>:</th>
	    		<td><win:code listCode="member.card.type"  value="${sessionScope[newOrderKey].newCardType }"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${poOrder.orderType == 2 && not empty plateSelectList}">
	    	<!-- 促销分区选项start -->
			<tr>
				<td colspan="2" class="title"><font color="red">*</font><fmt:message key="mi.register.plate.lable"/></td>
			</tr>
			<c:forEach items="${plateSelectList }" var="plate">
		    	<tr>
		    		<th class="required">${plate.plateModel }<input type="checkbox" name="plateModle" disabled="disabled" value="${plate.plateModel }" <c:if test="${plate.iniStatus == 1 }">checked="checked"</c:if> /> <fmt:message key="mi.linkNo"/>:</th>
		    		<td>
		    		   ${plate.iniLinkNo }
		    		</td>
		    	</tr>
	    	</c:forEach>
	    	<!-- 促销分区选项end -->
    	</c:if>
    	<c:if test="${poOrder.orderType != 4 && poOrder.orderType != 5}">
    	<%--
	    	<tr>
	    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="register.us.legend.shipping"/></td>
	    	</tr>
	    	<c:if test="${poOrder.orderType !=12 }">
	    	<tr>
	    		<th><fmt:message key="mi.register.shipType"/>:</th>
	    		<td>
	    			<win:code listCode="poship.shiptype" value="${poShip.shipType }"></win:code>
	    		</td>
	    	</tr>
	    	</c:if>
	    	<c:if test="${poShip.shipType=='1' }">
		    	<tr>
		    		<th><fmt:message key="pdSendInfo.recipientName"/>:</th>
		    		<td>${poShip.shipLastName }</td>
		    	</tr>
		    	
		    	<tr>
		    		<th><fmt:message key="mi.register.mobil"/>:</th>
		    		<td>${poShip.shipMobile }</td>
		    	</tr>
		    	<tr>
		    		<th>&nbsp;<fmt:message key="csServiceCenter.telephone"/>:</th>
		    		<td>${poShip.shipPhone }</td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="miMember.delivery.area"/>:</th>
		    		<td>
		    			${shipAddressInfo }
		    		</td>
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
	    	<c:if test="${poShip.shipType=='3' }">
	    		<tr>
		    		<th><fmt:message key="busi.store.no"/>:</th>
		    		<td>${poShip.recptCode }</td>
		    	</tr>
	    	</c:if>
	    </c:if>
	    
	    <c:if test="${poOrder.orderType !=11 }">
	    <tr>
    		<th><fmt:message key="busi.store.no"/>:</th>
    		<td>${poOrder.agentNo }</td>
    	</tr>
    	</c:if>
	    <c:if test="${poOrder.orderType ==12 }">
	    <tr>
    		<th><fmt:message key="mem.po.giverno"/> :</th>
    		<td>${poOrder.giverNameTmp }</td>
    	</tr>
	    --%>
    	</c:if>    	
    	<c:if test="${poOrder.orderType !=12 }">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="poOrder.orderingProduct"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<%-- <table style="width: 500px;" border="1" cellspacing="0" cellpadding="0">
    				<tr style="height: 30px;">
    					<td><fmt:message key="busi.product.productno"/></td>
    					<td><fmt:message key="pmProduct.productName"/></td>
    					<td><fmt:message key="label.unit.price"/></td>
    					<td><fmt:message key="busi.pv"/></td>
    					<td><fmt:message key="poOrder.count"/></td>
    					<td><fmt:message key="busi.handsel.quantity"/></td>
    					<td><fmt:message key="busi.qty.subtotal"/></td>
    				</tr>
    				<c:forEach items="${poOrderDetailList }" var="poOrderDetailVar">
    					<tr style="height: 30px;">
	    					<td>${poOrderDetailVar.productNo }</td>
	    					<td>${poOrderDetailVar.pmProduct.productName }</td>
	    					<td>${poOrderDetailVar.unitPrice }</td>
	    					<td>${poOrderDetailVar.unitPv }</td>
	    					<td>${poOrderDetailVar.quantity-poOrderDetailVar.handselQuantity }</td>
	    					<td>${poOrderDetailVar.handselQuantity }</td>
	    					<td>${poOrderDetailVar.quantity }</td>
	    				</tr>
    				</c:forEach>
    			</table>	 --%>
    			<ec:table 
						items="poOrderDetailList"
						var="poOrderDetailVar"
						showPagination="false"
						width="100%" method="get"
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
    	 <c:if test="${poOrder.orderType == 14 || poOrder.orderType == 15}">
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="mi.sendPV.lable"/></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<ec:table 
						items="givePvList"
						var="giveVar"
						showPagination="false"
						width="100%" method="get"
						>
						<ec:row>
							<ec:column property="give_user_code" title="mi.give.member.lable" styleClass="centerColumn"/>
							<ec:column property="last_name" title="mi.giver.name.lable" styleClass="centerColumn"/>
							<ec:column property="give_pv" title="mi.give.pv.lable" styleClass="centerColumn">
								<span class="${returnCss}">
									<fmt:formatNumber pattern="###,##0.00" value="${giveVar.give_pv }"/>
								</span>
							</ec:column>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<button type="button" name="cancel" onclick="history.back(-1);"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
</div>