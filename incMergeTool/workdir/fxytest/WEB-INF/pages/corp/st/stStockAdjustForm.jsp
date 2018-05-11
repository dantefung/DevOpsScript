<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.inventory.adjustment "/></title>
    <meta name="heading" content="<fmt:message key="busi.inventory.adjustment"/>"/>
    <script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
</head>

<div class="contentBody">
    <form:form commandName="stStockAdjust" method="post" action="editStStockAdjust.jhtml" onsubmit="return validateForm(this)" id="stStockAdjustForm" name="stStockAdjustForm">
    
    <spring:bind path="stStockAdjust.*">
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
    
    <%@ include file="/common/messages.jsp" %>
    
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><%--基本信息--%><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<c:if test="${empty stStockAdjust.adjustCode}">
	    	<tr>
	    		<th class="required"><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
	    		<td>
	    			<form:select path="warehouseCode">
	    				<c:forEach items="${stWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty stStockAdjust.adjustCode}">
    		<tr>
	    		<th class="required"><%--分公司:--%><fmt:message key="bdReconsumMoneyReport.company"/></th>
	    		<td>
    				${stStockAdjust.companyCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><%--单号:--%><fmt:message key="pd.orderNo"/></th>
	    		<td>
    				${stStockAdjust.adjustCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="pdAdjustStock.warehouseNo"/>:</th>
	    		<td><input type="hidden" name="warehouseCode" value="${stWarehouse.warehouseCode }"/> ${stWarehouse.warehouseCode } - ${stWarehouse.warehouseName }</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="stStockAdjust.changeReason"/>:</th>
    		<td>
    			<win:list name="changeReason" listCode="st_stock_adjust_change_reason" defaultValue="0" value="${stStockAdjust.changeReason }"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>
    			<form:textarea path="remark" id="remark" cols="60" rows="6"/>
    		</td>
    	</tr>
    	<c:if test="${not empty stStockAdjust.adjustCode }">
	    	<tr>
	    		<td colspan="2" class="title"><%--商品--%><fmt:message key="pdWarehouseStock.productNo"/></td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<ec:table 
						items="stStockAdjustDetails"
						var="pmProductVar" form="stStockAdjustForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_code" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="stock_qty" title="busi.current.inventory" styleClass="numberColumn"/>
							<ec:column property="adjust_qty" title="pmLimitAdjust.adjustQty" styleClass="numberColumn">
								<input type="hidden" name="productId" value="${pmProductVar.product_id}"/>
								<c:if test="${pmProductVar.adjust_qty>=0 || empty pmProductVar.adjust_qty}">
									<input type="text" size="6" name="adjustQty" value="${pmProductVar.adjust_qty }"/>
								</c:if>
								<c:if test="${pmProductVar.adjust_qty<0}">
									<input type="text" size="6" name="adjustQty" value="${-pmProductVar.adjust_qty }"/>
								</c:if>
							</ec:column>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${empty stStockAdjust.adjustCode }">
    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.next"/></button>
    					</c:if>
    					<c:if test="${not empty stStockAdjust.adjustCode }">
    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    					</c:if>
    				</win:power>
    				<c:if test="${not empty stStockAdjust.adjustCode && stStockAdjust.status==0}">
    					<win:power powerCode="deleteStStockAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'StStockAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='stStockAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.warehouseCode.value==""){
		alert("<fmt:message key="busi.please.select.appropriate.warehouse"/> ");
		return false;
	}
	var adjustQtys=document.getElementsByName("adjustQty");
	if(adjustQtys!=null && adjustQtys.length>0){
		for(var i=0;i<adjustQtys.length;i++){
			if(adjustQtys[i].value!="" && !isUnsignedInteger(adjustQtys[i].value)){
				alert("<fmt:message key="busi.please.select.appropriate.warehouse"/> ");
				adjustQtys[i].focus();
				return false;
			}
		}
	}
	
	showLoading();
	return true;
}
</script>