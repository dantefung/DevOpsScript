<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.regional.performance.enquiry"/></title>
    <meta name="heading" content="<fmt:message key="busi.regional.performance.enquiry"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<div class="searchBar">
	<form method="get" action="rptRegionSaless.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><%--地区--%><fmt:message key="address.area"/></dt>
			<dd>
				<div id="regionDiv"></div>
			</dd>
		</dl>
		<dl>
			<dt>
				<%--日期范围--%><fmt:message key="lang.range.of.date"/>
			</dt>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><%--搜索--%><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="rptRegionSaless"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="rptRegionSalesListTableForm" method="get" >
		<ec:table 
			tableId="rptRegionSalesListTable"
			items="rptRegionSaless"
			var="rptRegionSalesVar"
			action="rptRegionSaless.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="rptRegionSalesListTableForm">
			<ec:exportXls fileName="rptRegionSales.xls"></ec:exportXls>
			<ec:row>
				<ec:column property="province" title="label.state" />
				<ec:column property="city" title="miMember.delivery.city" />
				<ec:column property="district" title="miMember.delivery.q" />
				<ec:column property="total_price" title="busi.new.performance" sortable="true" cell="currency" format="###,##0.00" styleClass="numberColumn"/>
				<ec:column property="total_pv" title="busi.new.pv" sortable="true" cell="currency" format="###,##0.00" styleClass="numberColumn" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(document).ready(function(){
	$('#regionDiv').regionSelector({
		startRegionId:0,
		'mustSelectLast':false,
		'regionCode':'${regionCode}'
	});
})

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

</script>