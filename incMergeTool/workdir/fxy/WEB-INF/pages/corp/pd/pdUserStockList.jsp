<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.readyForDelivery"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.readyForDelivery"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="pdUserStocks.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="fiPayAdvice.userCode"/></dd>
			<dd>
				<input type="text" name="userCode" id="userCode" value="${param.userCode }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="busi.product.productno"/></dd>
			<dd>
				<input type="text" name="productNo" id="productNo" value="${param.productNo }"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listPdUserStocks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="pdUserStockFunctionForm" id="pdUserStockFunctionForm" action="editPdUserStock.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedStockIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pdUserStockListTableForm" method="get" >
		<ec:table 
			tableId="pdUserStockListTable"
			items="pdUserStocks"
			var="pdUserStockVar"
			action="pdUserStocks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pdUserStockListTableForm">
			<ec:row>
				<ec:column property="company_code" title="label.company" />
				<ec:column property="user_code" title="fiPayAdvice.userCode" />
				<ec:column property="user_name" title="user.name" />
				<ec:column property="product_code" title="busi.product.productno" />
				<ec:column property="product_name" title="pmProduct.productName" />
				<ec:column property="qty" title="po.quantity" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePdUserStock(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkStockId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pdUserStockFunctionForm;
	theForm.selectedStockIds.value=selectedValues;
	theForm.strAction.value="multiDeletePdUserStock";
	
	showLoading();
	theForm.submit();
}
</script>