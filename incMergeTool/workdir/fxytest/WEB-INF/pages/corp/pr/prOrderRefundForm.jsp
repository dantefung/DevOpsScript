<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="saFiIncomeReport.returnMount"/></title>
    <meta name="heading" content="<fmt:message key="saFiIncomeReport.returnMount"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="editPrOrderRefund.jhtml" id="prOrderRefundForm" onsubmit="return validateForm(this)">
    
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
    	
    	<!-- 退货确认信息 -->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="退货确认信息"/></td>
    	</tr>
    	<c:if test="${prOrder.status==3 || prOrder.status==5}">
			<tr>
				<th valign="top"><fmt:message key="退货确认人"/>:</th>
				<td>${prOrder.intoCode }</td>
				<th valign="top"><fmt:message key="退货时间"/>:</th>
				<td>
					<c:if test="${prOrder.intoTime!=null }"><fmt:formatDate value="${prOrder.intoTime }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
				</td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="退货备注"/>:</th>
				<td colspan="3">${fn:replace(prOrder.intoRemark, vEnter, '<br>')}</td>
			</tr>
		</c:if>
		
		<!-- 退款确认信息 -->
    	<c:if test="${prOrder.status==5}">
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="退款确认信息"/></td>
    	</tr>
			<tr>
				<th valign="top"><fmt:message key="退款确认人"/>:</th>
				<td colspan="2">${prOrder.refundCode }</td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="操作备注"/>:</th>
				<td colspan="2">${prOrder.refundRemark }</td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="电子存折备注"/>:</th>
				<td colspan="2">${prOrder.bankRemark }</td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="实退金额"/>:</th>
				<td colspan="2"><fmt:formatNumber pattern="###,##0.00" value="${prOrder.refundAmt }" /></td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="退款时间"/>:</th>
				<td colspan="2">
					<c:if test="${prOrder.refundTime!=null }"><fmt:formatDate value="${prOrder.refundTime }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
				</td>
			</tr>
		</c:if>
		
		<!-- 相关备注 -->
		<tr>
    		<td colspan="4"><hr/></td>
    	</tr>
    	<c:if test="${prOrder.status==3}">
	    	<tr>
	    		<th valign="top"><fmt:message key="操作备注"/>:</th>
	    		<td colspan="3">
	    			<form:textarea path="refundRemark" htmlEscape="true" cssStyle="width:525px;" rows="6"/>
	    		</td>
		    </tr>
	    </c:if>
    	
    	<!--退货确认操作 -->
    	<tr>
    		<td colspan="3">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${prOrder.status==3 && (empty poShip || poShip.status==30)}">
    					<button type="submit" name="check" onclick="return confirmRefund(this.form,${prOrder.totalAmount })">退款确认</button>
	    			</c:if>
    				<button type="button" name="cancel" onclick="window.location='prOrdersRefund.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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

function confirmRefund(theForm, orderAmount){
	if(document.getElementById("refundRemark").value==null || document.getElementById("refundRemark").value.length==0){
		alert("请填写操作备注");
		return false;
	}
	if(confirm("确认退款?")){
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

/** 判断输入是否是非负浮点数
 * @param  [Object]
 * @return boolean
 **/
function isFloat(float){
 var reFloat=/^\d+(\.\d+)?$/;	//非负浮点数(正浮点数 + 0) 的正则表达式
 return(reFloat.test(float));
}

//非负浮点数(正浮点数 + 0) 的正则表达式(小数点后只能输入两位)
function isFloatTwo(float){
 var reFloat=/^\d+(\.\d{1,2})?$/;	
 return(reFloat.test(float));
}
 </script>