<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="赠品发放管理"/></title>
    <meta name="heading" content="<fmt:message key="赠品发放管理"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="poOrder" method="post" action="editPoGiftOrder.jhtml" onsubmit="return validateForm(this)" id="poOrderForm">
    
    <spring:bind path="poOrder.*">
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
    	<c:if test="${empty poOrder.orderId }">
	    	<tr>
	    		<th class="required">会员编号:</th>
	    		<td><form:input path="userCode" id="userCode"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${not empty poOrder.orderId }">
    		<tr>
	    		<th class="required">分公司:</th>
	    		<td>${poOrder.companyCode }</td>
	    	</tr>
	    	<tr>
	    		<th>订单号:</th>
	    		<td>${poOrder.orderNo }</td>
	    	</tr>
	    	<tr>
	    		<th class="required">会员编号:</th>
	    		<td>
	    			<form:hidden path="userCode"/>
	    			${poOrder.userCode }
	    		</td>
	    	</tr>
	    	<tr>
	    		<th>备注:</th>
	    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
	    	</tr>
    		
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
							<ec:column property="qty" title="赠送数量" styleClass="numberColumn">
								<input type="hidden" name="productId" value="${pmProductVar.product_id}"/> 
	    						<input type="text" size="6" name="quantity" value="${pmProductVar.quantity }"/>
							</ec:column>
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="orderId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${empty poOrder.orderId }">
    						<button type="submit" name="save" onclick="bCancel=false">下一步</button>
    					</c:if>
    					<c:if test="${not empty poOrder.orderId }">
    						<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    					</c:if>
    				</win:power>
    				<c:if test="${not empty poOrder.orderId && poOrder.status!=100 }">
    					<win:power powerCode="deletePoGiftOrder">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PoGiftOrder')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='poGiftOrders.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	
	<c:if test="${not empty poOrder.orderId }">
		var quantitys=document.getElementsByName("quantity");
		if(quantitys!=undefined){
			for(var i=0;i<quantitys.length;i++){
				if(quantitys[i].value!="" && !isUnsignedInteger(quantitys[i].value)){
					alert("请输入正确的需要发货的商品数量");
					quantitys[i].focus();
					return false;
				}
			}
		}
	</c:if>
	//其它验证
	showLoading();
	return true;
}

</script>