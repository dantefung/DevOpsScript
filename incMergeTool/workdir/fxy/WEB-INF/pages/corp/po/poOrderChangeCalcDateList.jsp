<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.po.poOrderChangeCalcDates"/></title>
    <meta name="heading" content="<fmt:message key="menu.po.poOrderChangeCalcDates"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="poOrderChangeCalcDates.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
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
			<dd><fmt:message key="poOrder.orderNo"/></dd>
			<dd><input type="text" name="orderNo" id="orderNo" value="${param.orderNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd>
				<input type="text" name="userCode" id="userCode" value="${param.userCode }"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="pd.orderType"/></dd>
			<dd><win:list listCode="po_order_type" name="orderType" defaultValue="" value="${param.orderType }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="fiPayAdvice.dealType"/></dd>
			<dd>
				<!--<select name="paymentMethod" id="paymentMethod" style="width:80px;">
					<option value=""><fmt:message key="list.please.select"/></option>
					<c:forEach items="${paymentMethodMap }" var="var">
					<option value="${var.key }" <c:if test="${param.paymentMethod == var.key }">selected="selected"</c:if>>${var.value }</option>
					</c:forEach>
				</select>
				--><win:list listCode="order_payment_method" name="paymentMethod" defaultValue="" value="${param.paymentMethod }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="poOrder.billType"/></dd>
			<dd>
				<!--<select name="generateMethod" id="generateMethod" style="width:100px;">
					<option value=""><fmt:message key="list.please.select"/></option>
					<c:forEach items="${generateMethodMap }" var="var">
					<option value="${var.key }" <c:if test="${param.generateMethod == var.key }">selected="selected"</c:if>>${var.value }</option>
					</c:forEach>
				</select>
				--><win:list listCode="order_generate_method" name="generateMethod" defaultValue="" value="${param.generateMethod }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="poOrder.billFromPersonNo"/></dd>
			<dd>
				<input type="text" name="creatorCode" id="creatorCode" value="${param.creatorCode }"/>
			</dd>
		</dl>
		<dl>
			<dd>
				<!--<select name="dateType" id="dateType" style="width:120px;">
					<option value=""><fmt:message key="poOrder.chooseDateRange"/></option>
					<c:forEach items="${dateTypeMap }" var="var">
						<option value="${var.key }" <c:if test="${param.dateType == var.key }">selected="selected"</c:if>>${var.value }</option>
					</c:forEach>
				</select>
				--><win:list listCode="order_search_date_types" name="dateType" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dd>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<%-- <dl>
			<dd><fmt:message key="po.preplanOrder.isOrNot"/></dd>
			<dd>
				<win:list name="isPreSell" listCode="yesno" defaultValue="" value="${param.isPreSell }" showBlankLine="true"/>
			</dd>
		</dl> --%>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="memberOrderSearchForm" id="memberOrderSearchForm" action="poOrderChangeCalcDates.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="poOrderChangeCalcDates">
				<fmt:message key="busi.new.calc.date"/>
				<input type="text" name="newCalcDate" id="newCalcDate" value="${param.newCalcDate }" size="12"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:message key="busi.new.calc.remark"/>
				<input type="text" name="newCalcRemark" id="newCalcRemark" value="${param.newCalcRemark }" size="24"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:poOrderChangeCalcDates();" name="change">
					<fmt:message key="button.change"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedOrderIds" id="selectedOrderIds">
		<input type="hidden" name="strAction" id="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="poOrderListTableForm" method="get" >
		<ec:table 
			tableId="poOrderListTable"
			items="poOrders"
			var="poOrder"
			action="poOrderChangeCalcDates.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="poOrderListTableForm">
			<ec:row>
				<ec:exportXls fileName="poOrderChangeCalcDate.xls"></ec:exportXls>
				<ec:column alias="chkOrderId" headerCell="selectAll" style="width:5px;">
					<input type="checkbox" name="chkOrderId" value="${poOrder.order_id}" class="checkbox"/>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" style="width:15px;">
					<a href="poOrderView.jhtml?orderId=${poOrder.order_id}" name="view"><fmt:message key="function.menu.view"/></a>
				</ec:column>
				<ec:column property="order_no" title="poOrder.orderNo" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="total_amount" title="busi.order.amount" style="text-align: right;">
					<fmt:formatNumber pattern="##,##0.00" value="${poOrder.total_amount }"/>
				</ec:column>
				<ec:column property="total_pv" title="poSell.totalPv" style="text-align: right;"/>
				<ec:column property="order_type" title="pd.orderType">
					<win:code listCode="po_order_type" value="${poOrder.order_type }"/>
				</ec:column>
				<ec:column property="payment_method" title="fiPayAdvice.dealType">
					<win:code listCode="order_payment_method" value="${poOrder.payment_method }"></win:code>
				</ec:column>
				<ec:column property="payment_status" title="poOrder.payStatus">
					<win:code listCode="po_order_status" value="${poOrder.status }"/>
				</ec:column>
				<ec:column property="generate_method" title="poOrder.billType">
					<win:code listCode="order_generate_method" value="${poOrder.generate_method }" />
				</ec:column>
				<ec:column property="creator_code" title="poOrder.billFromPersonNo" />
				<ec:column property="creator_name" title="poOrder.billFromPersonName" />
				<ec:column property="create_time" title="poOrder.billTime" >
					<c:if test="${poOrder.create_time!=null && poOrder.create_time!='' && fn:length(poOrder.create_time)>=19}">
						${fn:substring(poOrder.create_time,0,19)} 
					</c:if>
				</ec:column>
				<ec:column property="check_time" title="poOrder.payTime" />
				<ec:column property="calc_date" title="poOrder.calcDate" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate,#newCalcDate" ).datepicker();
	$("a[name='change']").button({
        icons: {
            primary: "ui-icon-disk"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function poOrderChangeCalcDates(){
	if($("#newCalcDate").val()==""){
		alert("<fmt:message key='info.new.date.required'/>.");
		$("#newCalcDate").focus();
		return;
	}
	
	if($("#newCalcRemark").val()==""){
		alert("<fmt:message key='info.new.remark.required'/>.");
		$("#newCalcRemark").focus();
		return;
	}
	
	var selectedValues = getCheckedBoxesValue(document.getElementsByName("chkOrderId"));
	if(selectedValues == null || selectedValues == ''){
		alert("<fmt:message key='info.select.need.change.items'/>.");
		return;
	}

	if(confirm("<fmt:message key='confirm.change.selected'/>.")){
		var theForm = document.memberOrderSearchForm;
		theForm.selectedOrderIds.value = selectedValues;
		theForm.strAction.value="poOrderChangeCalcDates";
		
		showLoading();
		theForm.submit();
	}
}
</script>