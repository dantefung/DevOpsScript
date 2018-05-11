<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMemberApalyCheck.title"/></title>
    <meta name="heading" content="<fmt:message key="退货单详情"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="viewPrOrder.jhtml" id="prOrderViewForm" onsubmit="return validateForm(this)">
    
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
    		<th><fmt:message key="prRefund.reNo"/>:</th>
    		<td colspan="3">${prOrder.prNo}</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td>${prOrder.userCode}</td>
    		<th><fmt:message key="会员姓名"/>:</th>
    		<td>${user.userName}</td>
    	</tr>
    	<c:if test="${not empty poOrder }">
	    	<tr>
	    		<th><fmt:message key="poOrder.orderNo"/>:</th>
	    		<td>${poOrder.orderNo}</td>
	    		<th><fmt:message key="pd.orderType"/>:</th>
	    		<td><win:code listCode="po_order_type" value="${poOrder.orderType }"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="fiPayAdvice.dealType"/>:</th>
	    		<td><win:code listCode="order_payment_method" value="${poOrder.paymentMethod }" /></td>
	    		<th><fmt:message key="poOrder.payStatus"/>:</th>
	    		<td><win:code listCode="po_order_status" value="${poOrder.status }"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.order.amount"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalAmount }" /></td>
	    		<th><fmt:message key="busi.order.pv.total"/>:</th>
	    		<td><fmt:formatNumber pattern="###,##0.00" value="${poOrder.totalPv }" /></td>
	    	</tr>
	    	
	    	
	    	<tr>
	    		<th><fmt:message key="poOrder.billFromPersonNo"/>:</th>
	    		<td>${poOrder.creatorCode}- ${creator.userName}</td>
	    		<th><fmt:message key="poOrder.billTime"/>:</th>
	    		<td><fmt:formatDate value="${poOrder.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	    	</tr>
	    	<c:if test="${poOrder.status==100 }">
				<tr>
		    		<th><fmt:message key="poOrder.payerNo"/>:</th>
		    		<td>${poOrder.payerCode}</td>
		    		<th><fmt:message key="付款人姓名"/>:</th>
		    		<td>${payer.userName}</td>
		    	</tr>
		    	<tr>
		    		<th><fmt:message key="poOrder.payTime"/>:</th>
		    		<td><fmt:formatDate value="${poOrder.checkTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    		<th><fmt:message key="poOrder.calcDate"/>:</th>
		    		<td><fmt:formatDate value="${poOrder.calcDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    	</tr>
	    	</c:if>
    	</c:if>
    	<tr>
    		<th valign="top"><fmt:message key="相关文件"/>:</th>
    		<td colspan="4">
    			<c:forEach items="${prOrderApplyFiles }" var="prOrderApplyFileVar">
    				<img src="${ctx}/themes/${theme }/images/attach/${prOrderApplyFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${prOrderApplyFileVar.fileUrl}"/>" target="_blank">${prOrderApplyFileVar.fileName }</a>
					<br/>
    			</c:forEach>
    		</td>
    	</tr>
    	
    	<c:if test="${prOrder.locked==1 }">
	    	<tr>
		    	<th><fmt:message key="退货单结算时间"/>:</th>
		    	<td colspan="3"><fmt:formatDate value="${prOrder.calcDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    </tr>
	    </c:if>
    	
    	<c:if test="${not empty poOrderDetailList }">
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
						<ec:row>
							<ec:column property="productNo" 			title="busi.product.productno" />
							<ec:column property="pmProduct.productName" title="pmProduct.productName" />
							<ec:column property="unitPrice" 			title="label.unit.price" />
							<ec:column property="unitPv" 				title="busi.pv" />
							<ec:column property="quantity" 				title="po.quantity" />
						</ec:row>
					</ec:table>
	    		</td>
	    	</tr>
    	</c:if>
    	
    	<!-- 退货单信息-->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="退货单信息"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="退货单状态"/>:</th>
    		<td>
    			<win:code listCode="prorder.status" value="${prOrder.status }"></win:code>
			</td>
    		<th><fmt:message key="审批状态"/>:</th>
    		<td>
    			<win:code listCode="prorder.isfinished" value="${prOrder.isFinished }"></win:code>
			</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="退货申请备注"/>:</th>
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
			    		<td colspan="3">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
	    	 	</c:if>
	    	 	<c:if test="${log.checkStep != '9' }">
		    		<tr>
			    		<th valign="top"><win:code listCode="prorder.check.step" value="${log.checkStep }"/>(${log.checkerName }):</th>
			    		<td colspan="3">${log.remark }&nbsp;[${log.checkTime }]</td>
				    </tr>
			    </c:if>
	    	</c:forEach>
    	</c:if>
    	
    	<!-- 退货确认信息 -->
    	<c:if test="${prOrder.status==3 || prOrder.status==5}">
	    	<tr>
	    		<td colspan="4" class="title"><fmt:message key="退货确认信息"/></td>
	    	</tr>
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
				<td colspan="3">
					${fn:replace(prOrder.intoRemark, vEnter, '<br>')}
				</td>
			</tr>
		</c:if>
		
		<!-- 退款确认信息 -->
    	<c:if test="${prOrder.status==5}">
    		<tr>
	    		<td colspan="4" class="title"><fmt:message key="退款确认信息"/></td>
	    	</tr>
			<tr>
				<th valign="top"><fmt:message key="退款确认人"/>:</th>
				<td>${prOrder.refundCode }</td>
				<th valign="top"><fmt:message key="退款时间"/>:</th>
				<td>
					<c:if test="${prOrder.refundTime!=null }"><fmt:formatDate value="${prOrder.refundTime }" pattern="yyyy-MM-dd HH:mm:ss"/></c:if>
				</td>
			</tr>
			<tr>
	    		<th valign="top"><fmt:message key="实退金额"/>:</th>
	    		<td colspan="3"><fmt:formatNumber pattern="##,##0.00" value="${prOrder.refundAmt }"/></td>
		    </tr>
			<tr>
				<th valign="top"><fmt:message key="退款备注"/>:</th>
				<td colspan="3">
					${fn:replace(prOrder.refundRemark, vEnter, '<br>')}
				</td>
			</tr>
			<tr>
				<th valign="top"><fmt:message key="存折备注"/>:</th>
				<td colspan="3">
					${fn:replace(prOrder.bankRemark, vEnter, '<br>')}
				</td>
			</tr>
			<tr>
				
			</tr>
			
	    </c:if>
    	
    	<!--后退 -->
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="button" name="cancel" onclick="history.back(-1);"><fmt:message key="operation.button.return"/></button>
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
 </script>