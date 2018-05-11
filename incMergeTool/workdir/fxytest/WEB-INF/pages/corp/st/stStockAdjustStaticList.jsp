<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="库存调整 - 统计"/></title>
    <meta name="heading" content="<fmt:message key="库存调整 - 统计"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="searchBar">
	<form method="get" action="stStockAdjustStatic.jhtml" onsubmit="return validateSearch(this)">
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
			<dt>调整单号</dt>
			<dd><input type="text" name="adjustCode" value="${param.adjustCode }"/></dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateRangeType" listCode="st_adjust_date_range" defaultValue="0" value="${param.dateRangeType }" showBlankLine="true"/>
			</dt>
			<dd>
				 <input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12"/>
				 -
				 <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt>状态</dt>
			<dd><win:list name="status" listCode="st_stock_adjust_status" defaultValue="" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>所包含商品编号</dt>
			<dd><input type="text" name="productCode" value="${param.productCode }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="stStockAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="stStockAdjustListTableForm" method="get" >
		<ec:table 
			tableId="stStockAdjustListTable"
			items="stStockAdjusts"
			var="stStockAdjustVar"
			action="stStockAdjustStatic.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stStockAdjustListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" width="20">
					<nobr>
						<win:power powerCode="viewStStockAdjust">
							<a href="viewStStockAdjust.jhtml?strAction=viewStStockAdjust&adjustCode=${stStockAdjustVar.adjustCode}" name="view"><fmt:message key="button.view"/></a>
						</win:power>
					</nobr>
				</ec:column>
				<ec:column property="adjustCode" title="调整单号" />
				<ec:column property="companyCode" title="分公司" />
				<ec:column property="warehouseCode" title="仓库编号" />
				<ec:column property="changeReason" title="stStockAdjust.changeReason">
					<win:code listCode="st_stock_adjust_change_reason" value="${stStockAdjustVar.changeReason }"/>
				</ec:column>
				<ec:column property="creatorCode" title="stStockAdjust.creatorCode" />
				<ec:column property="createTime" title="创建时间" />
				<ec:column property="status" title="状态" styleClass="centerColumn">
					<win:code listCode="st_stock_adjust_status" value="${stStockAdjustVar.status }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate, #endDate" ).datepicker();
	$("a[name='view']").colorbox({width:"80%", height:"80%"});
});
$(document).ready(function(){
	
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiConfirmStStockAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAdjustCode"));
	if(!selectedValues){
		alert("请选择需要确认的项目.");
		return;
	}
	if(!confirm("确认确认当前所选择的项目？")){
		return;
	}
	var theForm=document.stStockAdjustFunctionForm;
	theForm.selectedAdjustCodes.value=selectedValues;
	theForm.strAction.value="confirmStStockAdjust";
	
	showLoading();
	theForm.submit();
}
</script>