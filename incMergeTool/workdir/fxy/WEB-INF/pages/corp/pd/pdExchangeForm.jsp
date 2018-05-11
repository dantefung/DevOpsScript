<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.pdExchangeOrderManage"/></title>
    <meta name="heading" content="<fmt:message key="busi.pdExchangeOrderManage"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="pdExchange" method="post" action="editPdExchange.jhtml" onsubmit="return validateForm(this)" id="pdExchangeForm" name="pdExchangeForm">
    
    <spring:bind path="pdExchange.*">
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
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="4" class="title"><%--基本信息--%><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
		<c:if test="${empty pdExchange.exchangeCode }">
	    	<tr>
	    		<th class="required"><%--发货单号:--%><fmt:message key="pdSendInfo.siNo"/></th>
	    		<td colspan="3"><form:input path="siNo" id="siNo"/></td>
	    	</tr>
	    	<tr>
	    		<th class="required"><%--仓库:--%><fmt:message key="pdAdjustStock.warehouseNo"/></th>
	    		<td colspan="3">
	    			<form:select path="warehouseCode">
	    				<c:forEach items="${stWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><%--备注:--%><fmt:message key="busi.common.remark"/></th>
	    		<td colspan="3"><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty pdExchange.exchangeCode }">
    		<tr>
	    		<th><%--换货单号:--%><fmt:message key="busi.pdExchangeOrder.no"/></th>
	    		<td colspan="3">${pdExchange.exchangeCode }</td>
	    	</tr>
    		<tr>
	    		<th class="required"><%--分公司:--%><fmt:message key="bdReconsumMoneyReport.company"/></th>
	    		<td>${stWarehouse.companyCode }</td>
	    		<th class="required"><%--发货仓:--%><fmt:message key="pdSendInfo.sendWarehouseNo"/></th>
	    		<td>
	    			<form:hidden path="warehouseCode"/>
	    			${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }
	    		</td>
	    	</tr>
    		<tr>
	    		<td colspan="4" class="title"><%--原发货单信息--%><fmt:message key="busi.original.invoice.information"/></td>
	    	</tr>
	    	
	    	<tr>
	    		<th><fmt:message key="pdSendInfo.siNo"/>:</th>
	    		<td>
	    			${oldPoShip.siNo }
	    		</td>
	    		<th><fmt:message key="po.ship.recievedno.lable"/>:</th>
	    		<td>
	    			${oldPoShip.recptCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="pdSendInfo.sendWarehouseNo"/>:</th>
	    		<td>
	    			${oldStWarehouse.warehouseCode } - ${oldStWarehouse.warehouseName }
	    		</td>
	    		<th><fmt:message key="po.shipment.type"/>:</th>
	    		<td>
	    			<win:code listCode="poship.shiptype" value="${oldPoShip.shipType }"/>
	    		</td>
	    	</tr>
	    	<c:if test="${oldPoShip.shipType==1 }">
		    	<tr>
		    		<th valign="top"><fmt:message key="register.us.legend.shipping"/>:</th>
		    		<td colspan="3">
		    			${oldPoShip.shipLastName }<br/>
		    			${fullRegionName}${oldPoShip.shipAddress1 }<br/>
		    			<%--邮编--%><fmt:message key="alProvinceCity.zipCode"/>：${oldPoShip.shipZipCode }<br/>
		    			<%--手机--%><fmt:message key="gsMember.mobile"/>：${oldPoShip.shipMobile }<br/>
		    			<%--电话--%><fmt:message key="mi.phone"/>：${oldPoShip.shipPhone }
		    		</td>
		    	</tr>
	    	</c:if>
	    	<tr>
	    		<th><fmt:message key="busi.common.remark"/>:</th>
	    		<td colspan="3">
	    			${fn:replace(oldPoShip.remark, vEnter, '<br>')}
	    		</td>
	    	</tr>
	    	
	    	<tr>
    			<th><fmt:message key="pd.createTime"/>:</th>
    			<td colspan="3">${oldPoShip.creatorCode } - ${oldPoShip.createTime }</td>
    		</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title"><%--原商品信息--%><fmt:message key="busi.original.commodity.information"/></td>
	    	</tr>
	    	<tr>
	    		<td colspan="4">
	    			<c:set var="totalOldPrice" value="0"/>
	    			<ec:table 
						items="pdExchangeDetails"
						var="pmProductVar" form="pdExchangeForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false" >
						<ec:row highlightRow="false">
							<ec:column property="product_code" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
							</ec:column>
							<ec:column property="qty" title="po.quantity" styleClass="numberColumn">
								${pmProductVar.qty }
							</ec:column>
							<ec:column property="unit_price*qty" title="report.subtotal" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price*pmProductVar.qty }"/>
								<c:set var="totalOldPrice" value="${totalOldPrice+pmProductVar.unit_price*pmProductVar.qty }"/>
							</ec:column>
						</ec:row>
					</ec:table>
					<table width="100%">
						<tr>
							<td align="right">
								<fmt:message key="poOrder.amtCount"/>：<strong><fmt:formatNumber pattern="###,##0.00" value="${totalOldPrice }"/></strong>
							</td>
						</tr>
					</table>
	    		</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title">新商品信息</td>
	    	</tr>
	    	<tr>
	    		<td colspan="4">
	    			<ec:table 
						items="pmProducts"
						var="pmProductVar" form="pdExchangeForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_code" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="first_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/>
							</ec:column>
							<ec:column property="stock_qty" title="busi.current.inventory" styleClass="numberColumn"/>
							<ec:column property="qty" title="po.quantity" styleClass="numberColumn">
								<input type="hidden" name="unitPrice" value="${pmProductVar.first_price}"/> 
								<input type="hidden" name="productId" value="${pmProductVar.product_id}"/> 
								<input type="text" name="qty" value="${pmProductVar.qty }" size="8" onchange="getTotal()"/>
							</ec:column>
						</ec:row>
					</ec:table>
					<table width="100%">
						<tr>
							<td align="right">
								<fmt:message key="poOrder.amtCount"/>：<strong><span id="newTotalPrice"></span></strong>
							</td>
						</tr>
					</table>
	    		</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title"><%--其它--%><fmt:message key="fiBankbookTemp.moneyType.7"/></td>
	    	</tr>
	    	<tr>
	    		<th><%--备注:--%><fmt:message key="busi.common.remark"/></th>
	    		<td colspan="3"><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="exchangeCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${empty pdExchange.exchangeCode }">
    						<button type="submit" name="save" onclick="bCancel=false">下一步</button>
    					</c:if>
    					<c:if test="${not empty pdExchange.exchangeCode }">
    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    					</c:if>
    				</win:power>
    				<c:if test="${not empty pdExchange.exchangeCode }">
    					<win:power powerCode="deletePdExchange">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PdExchange')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pdExchanges.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	//其它验证
	<c:if test="${not empty pdExchange.exchangeCode }">
	var quantitys=document.getElementsByName("qty");
	if(quantitys!=undefined){
		for(var i=0;i<quantitys.length;i++){
			if(quantitys[i].value!="" && !isUnsignedInteger(quantitys[i].value)){
				alert("<fmt:message key="busi.please.enter.quantity.exchanged"/>");
				quantitys[i].focus();
				return false;
			}
		}
	}
	</c:if>
	showLoading();
	return true;
}

function getTotal(){
	var unitPrices=document.getElementsByName("unitPrice");
	var qtys=document.getElementsByName("qty");
	var totalPrice=0;
	for(var i=0;i<unitPrices.length;i++){
		if(qtys[i].value!="" && isUnsignedInteger(qtys[i].value)){
			totalPrice+=unitPrices[i].value*qtys[i].value;
		}
	}
	$("#newTotalPrice").text(totalPrice);
}
</script>