<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="refund.IntoWarehouse"/></title>
    <meta name="heading" content="<fmt:message key="refund.IntoWarehouse"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="editPrOrderInto.jhtml" id="prOrderIntoForm" onsubmit="return validateForm(this)">
    
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
    <%@ include file="/common/messages.jsp" %>
    <table class="detail">
    	<!-- 基本信息 -->
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
    	
    	<!-- 订购商品 -->
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
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					showPagination="false"
					showStatusBar="false"
					rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm">
					<ec:row highlightRow="false">
						<ec:column property="productNo" 			title="busi.product.productno" />
						<ec:column property="pmProduct.productName" title="pmProduct.productName" />
						<ec:column property="unitPrice" 			title="label.unit.price" />
						<ec:column property="unitPv" 				title="busi.pv" />
						<ec:column property="quantity" 				title="po.quantity" />
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	
    	<!-- 退货单信息-->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="退货单信息"/></td>
    	</tr>
    	<tr>
    		<th>退货单编号:</th>
    		<td colspan="3">
    			${prOrder.prNo }
			</td>
    	</tr>
    	<tr>
    		<th valign="top"><fmt:message key="退货申请备注"/>:</th>
    		<td colspan="3">
    			${fn:replace(prOrder.remark, vEnter, '<br>')}
			</td>
    	</tr>
    	
    	<!-- 审批信息 -->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="审批信息"/></td>
    	</tr>
    	<c:if test="${not empty checkLogList }">
	    	<c:forEach items="${checkLogList }" var="log">
	    	 	<c:if test="${log.checkStep == '9' }">
		    	 	<tr>
			    		<th valign="top"><fmt:message key="mi.return.applyFor"/>(${log.checkerName }):</th>
			    		<td colspan="2">${fn:replace(log.remark, vEnter, '<br>')}</td>
			    		<td valign="top">${log.checkTime }</td>
				    </tr>
	    	 	</c:if>
	    	 	<c:if test="${log.checkStep != '9' }">
		    		<tr>
			    		<th valign="top"><win:code listCode="prorder.check.step" value="${log.checkStep }"/>(${log.checkerName }):</th>
			    		<td colspan="2">${fn:replace(log.remark, vEnter, '<br>')}</td>
			    		<td valign="top">${log.checkTime }</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	
    	<!-- 发货状态 -->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="发货状态"/></td>
    	</tr>
		<tr>
			<th><fmt:message key="已发货"/>:</th>
			<td><win:code listCode="yesno" value="${poShip.confirmStatus }"/> </td>
			<th><fmt:message key="仓库"/>:</th>
			<td>${poShip.warehouseNo }</td>
		</tr>
		<tr>
			<th><fmt:message key="发货单号"/>:</th>
			<td>${poShip.siNo }</td>
			<th><fmt:message key="发货时间"/>:</th>
			<td>${poShip.confirmTime }</td>
		</tr>
		
		<!-- 相关备注 -->
		<tr>
    		<td colspan="4"><hr/></td>
    	</tr>
    	<c:if test="${prOrder.status==1}">
	    	<tr>
	    		<th valign="top"><fmt:message key="操作备注"/>:</th>
	    		<td colspan="3">
	    			<form:textarea path="intoRemark" htmlEscape="true" cssStyle="width:525px;" rows="6"/>
	    		</td>
		    </tr>
	    </c:if>
    	
    	<!--退货确认操作 -->
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${prOrder.status==1}">
    					<button type="submit" name="uncheck" onclick="return confirmBack(this.form)"><fmt:message key="mi.return.applyFor"/></button>
    					<c:if test="${poShip.removeStatus==0}">
    						<button type="submit" name="check" onclick="return confirmInto(this.form)">退货确认</button>
    					</c:if>
	    			</c:if>
    				<button type="button" name="cancel" onclick="window.location='prOrdersInto.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("button[name='check']").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
	$("button[name='uncheck']").button({
        icons: {
            primary: "ui-icon-uncheck"
        }
    });

});

function confirmInto(theForm){
	if(document.getElementById("intoRemark").value==null || document.getElementById("intoRemark").value.length==0){
		alert("请填写操作备注");
		return false;
	}
	if(confirm("确认退货?")){
		return true;
	}
	return false;
}

function confirmBack(theForm){
	if(theForm.intoRemark.value==null || theForm.intoRemark.value.length==0){
		alert("请填写操作备注");
		return false;
	}
	if(confirm("确认退回此退货单?")){
		return true;
	}
	return false;
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}

/*去除空格*/
function trim(str){
	return str.replace(/^\s+|\s+$/g, '');
}
 </script>