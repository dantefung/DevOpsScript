<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="function.menu.listPrOrders"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.listPrOrders"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="prOrders.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="prRefund.reNo"/></dt>
			<dd><input type="text" name="prNo" value="${param.prNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="prReFund.originateOrderNo"/></dt>
			<dd><input type="text" name="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.orderType"/></dt>
			<dd>
				<win:list name="orderType" listCode="po_order_type" defaultValue="" value="${param.orderType }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd>
				<win:list name="status" listCode="prorder.status" defaultValue="" value="${param.status }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.approvalStatus"/></dt>
			<dd>
				<win:list name="isFinished" listCode="prorder.isfinished" defaultValue="" value="${param.isFinished }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q2"/></dt>
			<dd><input type="text" name="intoCode" value="${param.intoCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q3"/></dt>
			<dd><input type="text" name="refundCode" value="${param.refundCode }"/></dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="prorder.datetype" defaultValue="" value="${param.dateType }" showBlankLine="true"></win:list>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				-
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pr.msg.q4"/></dt>
			<dd><win:list name="hasAttach" listCode="yesno" defaultValue="" value="${param.hasAttach }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listPrOrders"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="prOrderFunctionForm" id="prOrderFunctionForm" action="editPrOrder.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPrOrder">
				<a href="editPrOrderCreateStep1.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeletePrOrder">
				<a href="javascript:multiDeletePrOrder()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedPrIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="prOrderListTableForm" method="get" >
		<ec:table 
			tableId="prOrderListTable"
			items="prOrders"
			var="prOrderVar"
			action="prOrders.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="prOrderListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<nobr>
						<a href="viewPrOrder.jhtml?strAction=viewPrOrder&prId=${prOrderVar.pr_id}" name="view"><fmt:message key="function.menu.view"/></a>
						<win:power powerCode="addPrOrderApplyFile">
							<a href="editPrOrderApplyFile.jhtml?strAction=addPrOrderApplyFile&prNo=${prOrderVar.pr_no}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
						</win:power>
						<c:if test="${prOrderVar.status == 0 }">
							<a href="javascript:submitPrOrder('${prOrderVar.pr_id}');" name="submit"><fmt:message key="button.submit"/></a>
						</c:if>
						<c:if test="${prOrderVar.status == 0 || prOrderVar.status == 9}">
							<a href="javascript:cancelPrOrder('${prOrderVar.pr_id}');" name="unsubmit"><fmt:message key="efubo.card.zf"/></a>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="pr_no" title="prRefund.reNo" >
					${prOrderVar.pr_no }
					<c:if test="${prOrderVar.apply_file_num>0 }">
						<span class="ui-icon ui-icon-attachment" style="display:inline-block;vertical-align: text-bottom;"></span>
					</c:if>
				</ec:column>
				<ec:column property="order_no" title="prReFund.originateOrderNo" />
				<ec:column property="user_code" title="fiPayAdvice.userCode" />
				<ec:column property="total_price" title="poSell.totalPrice" style="text-align: right;"/>
				<ec:column property="total_amount" title="bonus.order.amount" style="text-align: right;"/>
				<ec:column property="total_pv" title="poSell.totalPv" style="text-align: right;"/>
				<%-- <ec:column property="order_type" title="pd.orderType" >
					<win:code listCode="po_order_type" value="${prOrderVar.order_type }"></win:code>
				</ec:column> --%>
				<ec:column property="status" title="fi.status" >
					<win:code listCode="prorder.status" value="${prOrderVar.status }"></win:code>
				</ec:column>
				<ec:column property="is_finished" title="pr.approvalStatus" >
					<win:code listCode="prorder.isfinished" value="${prOrderVar.is_finished }"></win:code>
				</ec:column>
				<ec:column property="create_time" title="pd.createTime" >
					${prOrderVar.creator_code } - ${prOrderVar.create_time }
				</ec:column>
				<ec:column property="into_time" title="pr.msg.q5">
					${prOrderVar.into_code } - ${prOrderVar.into_time }
				</ec:column>
				<ec:column property="refund_time" title="busi.order.refundTime">
					${prOrderVar.refund_code } - ${prOrderVar.refund_time }
				</ec:column>
				<ec:column property="refund_amt" title="pr.msg.q6" />
			</ec:row>
		</ec:table>
	</form>
	<form action="editPrOrder.jhtml" method="post" name="editForm" id="editForm">
		<input type="hidden" name="strAction" value=""/>
		<input type="hidden" name="prId"/>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker();
	
	$("a[name='submit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-check"
        },
        text: false
    });
	
	$("a[name='unsubmit']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-cancel"
        },
        text: false
    });
});

function submitPrOrder(prId){
	if(confirm("<fmt:message key='mi.suresubmitm'/>")){
		document.editForm.prId.value = prId;
		document.editForm.strAction.value = "submitPrOrder";
		document.editForm.submit();
	}
}
function cancelPrOrder(prId){
	if(confirm("<fmt:message key='button.confirm.invalid'/>?")){
		document.editForm.prId.value = prId;
		document.editForm.strAction.value = "cancelPrOrder";
		document.editForm.submit();
	}
}

function validateSearch(theForm) {
	showLoading();
	return true;
}


function multiDeletePrOrder(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPrId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.prOrderFunctionForm;
	theForm.selectedPrIds.value=selectedValues;
	theForm.strAction.value="multiDeletePrOrder";
	
	showLoading();
	theForm.submit();
}
</script>