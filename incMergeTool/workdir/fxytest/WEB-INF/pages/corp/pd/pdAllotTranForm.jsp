<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="申请调拨"/></title>
    <meta name="heading" content="<fmt:message key="申请调拨"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="pdAllotTran" method="post" action="editPdAllotTran.jhtml" onsubmit="return validateForm(this)" id="pdAllotTranForm" name="pdAllotTranForm">
    
    <spring:bind path="pdAllotTran.*">
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
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<c:if test="${empty pdAllotTran.tranNo }">
	    	<tr>
	    		<th class="required"><fmt:message key="出库仓"/>:</th>
	    		<td>
	    			<form:select path="outWarehouseNo">
	    				<c:forEach items="${outStWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="入库仓"/>:</th>
	    		<td>
	    			<form:select path="inWarehouseNo">
	    				<c:forEach items="${inStWarehouses }" var="stWarehouseVar">
	    					<form:option value="${stWarehouseVar.warehouseCode }">${stWarehouseVar.warehouseCode } - ${stWarehouseVar.warehouseName }</form:option>
	    				</c:forEach>
	    			</form:select>
	    		</td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty pdAllotTran.tranNo }">
	    	<tr>
	    		<th class="required"><fmt:message key="出库仓"/>:</th>
	    		<td>
	    			<form:hidden path="outWarehouseNo"/>
	    			${stWarehouseOut.warehouseCode } - ${stWarehouseOut.warehouseName }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="入库仓"/>:</th>
	    		<td>
	    			<form:hidden path="inWarehouseNo"/>
	    			${stWarehouseIn.warehouseCode } - ${stWarehouseIn.warehouseName }
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
    	</tr>
    	<c:if test="${not empty pdAllotTran.tranNo }">
	    	<tr>
	    		<td colspan="2" class="title">商品信息</td>
	    	</tr>
    	
	    	<tr>
	    		<td colspan="2">
	    			<ec:table 
						items="pmProducts"
						var="pmProductVar" form="pdAllotTranForm" autoIncludeParameters="false"
						showPagination="false" width="100%" method="get" sortable="false" showStatusBar="false">
						<ec:row highlightRow="false">
							<ec:column property="product_code" title="busi.product.productno" />
							<ec:column property="product_name" title="pmProduct.productName"/>
							<ec:column property="first_price" title="label.unit.price" styleClass="numberColumn">
								<fmt:formatNumber pattern="###,##0.00" value="${pmProductVar.first_price }"/>
							</ec:column>
							<ec:column property="stock_qty" title="当前库存" styleClass="numberColumn"/>
							<ec:column property="qty" title="调拨数量" styleClass="numberColumn">
								<input type="hidden" name="productId" value="${pmProductVar.product_id}"/> 
	    						<input type="text" size="6" name="qty" value="${pmProductVar.qty }"/>
							</ec:column>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="tranNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${empty pdAllotTran.tranNo }">
    						<button type="submit" name="save" onclick="bCancel=false">下一步</button>
    					</c:if>
    					<c:if test="${not empty pdAllotTran.tranNo && pdAllotTran.checkStatus==0 }">
    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    					</c:if>
    				</win:power>
    				<c:if test="${not empty pdAllotTran.tranNo && pdAllotTran.checkStatus==0}">
    					<win:power powerCode="deletePdAllotTran">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PdAllotTran')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pdAllotTrans.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	var qtys=document.getElementsByName("qty");
	if(qtys!=undefined){
		for(var i=0;i<qtys.length;i++){
			if(qtys[i].value!="" && !isUnsignedInteger(qtys[i].value)){
				alert("请输入正确的需要调拨的商品数量");
				qtys[i].focus();
				return false;
			}
		}
	}
	showLoading();
	return true;
}
</script>