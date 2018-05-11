<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.listPrOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.listPrOrders"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="editPrOrderCreateStep2.jhtml" onsubmit="return validateForm(this)" id="prOrderForm">
    <input type="hidden" name="orderNo" value="${poOrder.orderNo }"/>
    
    <spring:bind path="prOrder.*">
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
    		<td colspan="4" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.orderNo"/>:</th>
    		<td>${poOrder.orderNo}</td>
    		<th><fmt:message key="pd.orderType"/>:</th>
    		<td><win:code listCode="po_order_type" value="${poOrder.orderType }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${poOrder.userCode}</td>
    		<th><fmt:message key="会员姓名"/>:</th>
    		<td>${user.userName}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.order.amount"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></td>
    		<th><fmt:message key="busi.order.pv.total"/>:</th>
    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="fiPayAdvice.dealType"/>:</th>
    		<td><win:code listCode="order_payment_method" value="${poOrder.paymentMethod }" /></td>
    		<th><fmt:message key="poOrder.payStatus"/>:</th>
    		<td><win:code listCode="po_order_status" value="${poOrder.status }"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poOrder.billFromPersonNo"/>:</th>
    		<td>${poOrder.creatorCode} - ${creator.userName}</td>
    		<th><fmt:message key="poOrder.billTime"/>:</th>
    		<td><fmt:formatDate value="${poOrder.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
    	</tr>
    	<c:if test="${poOrder.status==100 }">
			<tr>
	    		<th><fmt:message key="poOrder.payerNo"/>:</th>
	    		<td>${poOrder.payerCode} - ${payer.userName}</td>
	    		<th><fmt:message key="poOrder.payTime"/>:</th>
	    		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="poOrder.calcDate"/>:</th>
	    		<td colspan="3"><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="poOrder.orderingProduct"/></td>
    	</tr>
    	<tr>
    		<td colspan="4">
    			<ec:table 
					tableId="poOrderDetailListTable"
					items="poOrderDetailList"
					var="poOrderDetailVar"
					action="editFiBonusSendOfAppls.jhtml"
					width="100%" method="get"
					autoIncludeParameters="true"
					retrieveRowsCallback="limit"
					showPagination="false"
					showStatusBar="false"
					rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm">
					<ec:row>
						<ec:column property="productNo" 			title="busi.product.productno" />
						<ec:column property="pmProduct.productName" title="pmProduct.productName" />
						<ec:column property="unitPrice" 			title="label.unit.price" styleClass="numberColumn"/>
						<ec:column property="unitPv" 				title="busi.pv" styleClass="numberColumn"/>
						<ec:column property="quantity" 				title="po.quantity" styleClass="numberColumn"/>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	
    	<tr>
	    	<th valign="top" class="required"><fmt:message key="busi.common.remark"/>:</th>
	    	<td colspan="4">
	    		<form:textarea id="remark" path="remark" htmlEscape="true" cssStyle="width:525px;" rows="6"/>
	    	</td>
		</tr>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				<button type="button" name="cancel" onclick="window.location='editPrOrderCreateStep1.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	var remark = document.getElementById("remark").value;
	if(remark==null || remark.length==0){
		alert("<fmt:message key="ic.remark.null.requie"/>");
		return false;
	}
	if(confirm("<fmt:message key="pr.msg.q18"/>?")){
		showLoading();
		return true;
	}
	return false;
}
</script>