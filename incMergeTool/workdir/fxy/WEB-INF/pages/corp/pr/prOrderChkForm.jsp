<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listPrOrdersChk"/></title>
    <meta name="heading" content="<fmt:message key="menu.listPrOrdersChk"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="prOrder" method="post" action="editPrOrderChk.jhtml" id="prOrderChkForm" onsubmit="return validateForm(this)">
    
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
    	<tr>
    		<th valign="top"><fmt:message key="miMemberApalyCheck.relevance.file"/>:</th>
    		<td colspan="4">
    			<c:forEach items="${prOrderApplyFiles }" var="prOrderApplyFileVar">
    				<img src="${ctx}/themes/${theme }/images/attach/${prOrderApplyFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${prOrderApplyFileVar.fileUrl}"/>" target="_blank">${prOrderApplyFileVar.fileName }</a>
					<br/>
    			</c:forEach>
    		</td>
    	</tr>
    	
    	
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
					autoIncludeParameters="true"
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
    	
    	<!-- 退货单信息-->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="pr.msg.q21"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fi.status"/>:</th>
    		<td><win:code listCode="prorder.status" value="${prOrder.status}"></win:code></td>
    		<th><fmt:message key="pr.approvalStatus"/>:</th>
    		<td>
    			<win:code listCode="prorder.isfinished" value="${prOrder.isFinished }"></win:code>
			</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td>
    			${fn:replace(prOrder.remark, vEnter, '<br>')}
			</td>
    	</tr>
    	
    	<!-- 审批信息 -->
    	<tr>
    		<td colspan="4" class="title"><fmt:message key="pr.msg.q22"/></td>
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
    	
    	<!-- 审核及退回操作 -->
    	<tr>
    		<td colspan="4"><hr/></td>
    	</tr>
    	<c:if test="${(prOrder.status==1 || prOrder.status==3 || prOrder.status==5) && prOrder.isFinished=='0'}">
	    	<tr>
	    		<th valign="top"><fmt:message key="pdSendApp.checkRemark"/>:</th>
	    		<td colspan="3">
	    			<textarea name="checkRemark" htmlEscape="true" cssStyle="width:525px;" rows="6" cols="80"></textarea>
	    		</td>
		    </tr>
	    </c:if>
	    <tr>
    		<th valign="top"><fmt:message key="mi.current.step.lable"/>:</th>
    		<td colspan="3">
    			<c:if test="${prOrder.currentStep=='9' }"><fmt:message key="mi.return.applyFor"/></c:if>
    			<c:if test="${prOrder.currentStep!='9' }"><win:code listCode="prorder.check.step" value="${prOrder.currentStep }"/></c:if>
    		</td>
	    </tr>
	    
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<form:hidden path="prId"/>
    				<input type="hidden" name="strAction" value="checkPrOrder"/>
    				<input type="hidden" name="checkStep" />
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${(prOrder.status==1 || prOrder.status==3 || prOrder.status==5) && prOrder.isFinished=='0'}">
	    				<c:if test="${prOrder.status==1 }">
	    					<win:power powerCode="returnPrOrder">
	    						<button type="submit" name="uncheck" onclick="return confirmCheck(this.form, '9')"><fmt:message key="mi.return.applyFor"/></button>
	    					</win:power>
	    				</c:if>
	    				<c:forEach items="${checkMap }" var="checkMapVar">
	    					<c:set var="_checked" value="false"/>
	    					<c:set var="_checkerName" value=""/>
		    				<win:power powerCode="${checkMapVar.key }">
		    					<c:forEach items="${checkLogList }" var="checkLogVar">
		    						<c:if test="${checkMapVar.value[0]==checkLogVar.checkStep }">
		    							<c:set var="_checked" value="true"/>
		    							<c:set var="_checkerName" value="${checkLogVar.checkerName }"/>
		    						</c:if>
		    					</c:forEach>
		    					<c:if test="${_checked }">    					
		    						<button type="button" name="check" style="color: gray;">${checkMapVar.value[1] }(${_checkerName })</button>
		    					</c:if>
		    					<c:if test="${!_checked }">    					
		    						<button type="submit" name="check" onclick="return confirmCheck(this.form, '${checkMapVar.value[0] }')">${checkMapVar.value[1] }</button>
		    					</c:if>
		    				</win:power>
	    				</c:forEach>
	    			</c:if>
    				<button type="button" name="cancel" onclick="window.location='prOrdersChk.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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

function confirmCheck(theForm,checkStep){
	if(checkStep=='9'){
		if(trim(theForm.checkRemark.value)==""){
			alert("<fmt:message key='mi.remark.return.reason'/>");
			return false;
		}
	}
	var confirmMsg = "";
	if(checkStep=='9'){
		confirmMsg = "<fmt:message key='mi.return.applyFor.sure'/>";
	}else{
		confirmMsg = "<fmt:message key='是否确认审批'/>";
	}
	if(confirm(confirmMsg+"?")){
		theForm.checkStep.value = checkStep;
		theForm.strAction.value = "checkPrOrder";
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