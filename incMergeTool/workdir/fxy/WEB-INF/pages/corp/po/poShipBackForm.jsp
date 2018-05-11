<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.shipping.management"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.shipping.management"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="poShip" method="post" action="editPoShipBack.jhtml" onsubmit="return validateForm(this)" id="poShipForm">
    
    <spring:bind path="poShip.*">
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
    		<td colspan="4" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<c:if test="${empty poShip.shipId }">
	    	<tr>
	    		<th class="required"><fmt:message key="original.invoice.number"/>:</th>
	    		<td colspan="3"><input type="text" name="oldSiNo" value="${param.oldSiNo }"/></td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="returned.warehouse"/>:</th>
	    		<td colspan="3">
	    			<form:select path="warehouseNo">
	    				<c:forEach items="${stWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty poShip.shipId }">
    		<tr>
	    		<th><fmt:message key="return.odd.number"/>:</th>
	    		<td colspan="3">${poShip.siNo }</td>
	    	</tr>
    		<tr>
	    		<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
	    		<td>${poShip.companyCode }</td>
	    		<th class="required"><fmt:message key="returned.warehouse"/>:</th>
	    		<td>
	    			<form:hidden path="warehouseNo"/>
	    			${poShip.warehouseNo } - ${stWarehouse.warehouseName }
	    		</td>
	    	</tr>
    		<tr>
	    		<td colspan="4" class="title"><fmt:message key="busi.original.invoice.information"/></td>
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
							<fmt:message key="alProvinceCity.zipCode"/>：${oldPoShip.shipZipCode }<br/>
							<fmt:message key="gsMember.mobile"/>：${oldPoShip.shipMobile }<br/>
							<fmt:message key="mi.phone"/>：${oldPoShip.shipPhone }
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
    			<td>${oldPoShip.creatorCode } - ${oldPoShip.createTime }</td>
    			<th><fmt:message key="delivery.confirmation.time"/>:</th>
	    		<td>${oldPoShip.confirmUserCode } - ${oldPoShip.confirmTime }</td>
    		</tr>
	    	<tr>
	    		<th><fmt:message key="pd.shno"/>:</th>
	    		<td>${oldPoShip.shipOrgCode }</td>
	    		<th><fmt:message key="pd.traceNo"/>:</th>
	    		<td>${oldPoShip.shipInvoiceNo }</td>
	    	</tr>
	    	
	    	<tr>
	    		<td colspan="4" class="title"><fmt:message key="busi.commodity.information"/></td>
	    	</tr>
    	
	    	<tr>
	    		<td colspan="4">
	    			<ec:table 
						items="poShipDetails"
						var="pmProductVar" form="poShipForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_no" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="unit_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.unit_price }"/>
							</ec:column>
							<ec:column property="quantity" title="returned.quantity" styleClass="numberColumn">
								${-pmProductVar.quantity }
							</ec:column>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" class="title"><fmt:message key="fiBankbookTemp.moneyType.7"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.common.remark"/>:</th>
	    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="shipId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${poShip.checkStatus==0}">
	    				<win:power powerCode="${param.strAction }">
	    					<c:if test="${empty poShip.shipId }">
	    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.next"/></button>
	    					</c:if>
	    					<c:if test="${not empty poShip.shipId }">
	    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
	    					</c:if>
	    				</win:power>
	    				<c:if test="${not empty poShip.shipId }">
	    					<win:power powerCode="deletePoShip">
	    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PoShipBack')"><fmt:message key="operation.button.delete"/></button>
	    					</win:power>
	    				</c:if>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='poShipBacks.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){

});

function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
</script>