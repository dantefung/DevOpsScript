<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockList.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="stStocks.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt>所属公司</dt>
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
			<dt>仓库编号</dt>
			<dd><input type="text" name="warehouseCode" id="warehouseCode" value="${param.warehouseCode }"/></dd>
		</dl>
		<dl>
			<dt>商品编号</dt>
			<dd><input type="text" name="productCode" id="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listStStocks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">

	<form id="stStockListTableForm" method="get" >
		<ec:table 
			tableId="stStockListTable"
			items="stStocks"
			var="stStockVar"
			action="stStocks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stStockListTableForm">
			<%-- <ec:exportCsv fileName="stStock.csv"/> --%>
			<ec:exportXls fileName="stStocks.xls"/>
			<c:if test="${stStockVar.total_qty-stStockVar.wait_send_qty<=0}">
				<c:set var="rowStyle"> color:red;</c:set>
			</c:if>
			<c:if test="${stStockVar.total_qty-stStockVar.wait_send_qty>0}">
				<c:set var="rowStyle"></c:set>
			</c:if>
			<ec:row style="${rowStyle }">
				<ec:column property="company_code" title="分公司" style="${rowClass }"/>
				<ec:column property="warehouse_code" title="仓库编号" />
				<ec:column property="warehouse_name" title="仓库名称" />
				<ec:column property="product_code" title="商品编号" />
				<ec:column property="product_name" title="商品名称" />
				<ec:column property="total_qty" title="当前库存" styleClass="numberColumn"/>
				<ec:column property="wait_send_qty" title="待发库存" styleClass="numberColumn"/>
				<ec:column property="1" title="可用库存" styleClass="numberColumn">
					${stStockVar.total_qty-stStockVar.wait_send_qty }
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>