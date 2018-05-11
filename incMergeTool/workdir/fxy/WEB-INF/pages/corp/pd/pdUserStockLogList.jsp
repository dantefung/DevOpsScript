<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.prepare.shipping.log.query"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.prepare.shipping.log.query"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdUserStockLogs.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd>
				<input type="text" name="userCode" id="userCode" value="${param.userCode }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.product.productno"/></dt>
			<dd>
				<input type="text" name="productNo" id="productNo" value="${param.productNo }"/>
			</dd>
		</dl>
		<dl>
			<dt>
				<fmt:message key="change.date"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;"/> - 
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPdUserStockLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdUserStockLogFunctionForm" id="pdUserStockLogFunctionForm" action="editPdUserStockLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>

	<form id="pdUserStockLogListTableForm" method="get" >
		<ec:table 
			tableId="pdUserStockLogListTable"
			items="pdUserStockLogs"
			var="pdUserStockLogVar"
			action="pdUserStockLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdUserStockLogListTableForm">
			<ec:row>
				<ec:column property="company_code" title="label.company" />
				<ec:column property="user_code" title="fiPayAdvice.userCode" />
				<ec:column property="user_name" title="user.name" />
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="qty" title="change.quantity" styleClass="numberColumn"/>
				<ec:column property="left_qty" title="remaining.qty" styleClass="numberColumn"/>
				<ec:column property="create_time" title="mi.time.update">
					${pdUserStockLogVar.creator_code } - ${pdUserStockLogVar.create_time }
				</ec:column>
				<ec:column property="source_order_no" title="bill.number" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdUserStockLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdUserStockLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdUserStockLog";
	
	showLoading();
	theForm.submit();
}
</script>