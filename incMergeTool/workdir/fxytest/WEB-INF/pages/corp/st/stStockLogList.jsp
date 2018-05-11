<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stStockLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="stStockLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="stStockLogs.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="分公司"/></dt>
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
			<dt><fmt:message key="仓库"/></dt>
			<dd><input type="text" name="warehouseCode" id="warehouseCode" value="${param.warehouseCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="商品编号"/></dt>
			<dd><input type="text" name="productCode" id="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="stStockLog.changeSource"/></dt>
			<dd>
				<win:list name="changeSource" listCode="change_source" defaultValue="" value="${param.changeSource}" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="stStockLog.sourceOrderNo"/></dt>
			<dd><input type="text" name="sourceOrderNo" id="sourceOrderNo" value="${param.sourceOrderNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="变更时间"/></dt>
			<dd>
				<input type="text" name="startCreateDate" id="startCreateDate" value="${param.startCreateDate }" size="10"/>
				 - <input type="text" name="endCreateDate" id="endCreateDate" value="${param.endCreateDate }" size="10"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="变更人编号"/></dt>
			<dd><input type="text" name="creatorCode" id="creatorCode" value="${param.creatorCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listStStockLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="stStockLogFunctionForm" id="stStockLogFunctionForm" action="editStStockLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="stStockLogListTableForm" method="get" >
		<ec:table 
			tableId="stStockLogListTable"
			items="stStockLogs"
			var="stStockLogVar"
			action="stStockLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stStockLogListTableForm">
			<ec:exportXls fileName="stStockLogs.xls"/>
			<ec:row>
				<ec:column property="company_code" title="分公司" />
				<ec:column property="warehouse_code" title="仓库" />
				<ec:column property="product_code" title="商品编号" />
				<ec:column property="product_name" title="商品名称" />
				<ec:column property="change_qty" title="stStockLog.changeQty" styleClass="numberColumn"/>
				<ec:column property="left_qty" title="stStockLog.leftQty" styleClass="numberColumn"/>
				<ec:column property="change_source" title="stStockLog.changeSource" >
					<win:code listCode="change_source" value="${stStockLogVar.change_source}"/>
					<c:if test="${not empty stStockLogVar.reason }">
						-
						<win:code listCode="st_stock_adjust_change_reason" value="${stStockLogVar.reason }"/>
					</c:if>
				</ec:column>
				<ec:column property="source_order_no" title="stStockLog.sourceOrderNo" />
				<ec:column property="creator_code" title="变更人" />
				<ec:column property="create_time" title="变更时间" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCreateDate,#endCreateDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});


function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteStStockLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.stStockLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteStStockLog";
	
	showLoading();
	theForm.submit();
}
</script>