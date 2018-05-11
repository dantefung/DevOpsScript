<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="busi.regional.performance.enquiry"/></title>
    <meta name="heading" content="<fmt:message key="busi.regional.performance.enquiry"/>"/>
</head>

<style>
.eXtremeTable .tableHeader{
	white-space:normal;
}

.eXtremeTable .tableHeaderSort {
	white-space: normal;
}
</style>

<script type="text/javascript" src="${ctx}/scripts/jquery.regionselector.js"></script>

<div class="searchBar">
	<form method="get" action="rptRegionMemberCounts.jhtml" onsubmit="return validateSearch(this)">
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
				<input type="hidden" name="strAction" value="rptRegionMemberCounts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="rptRegionMemberCountListTableForm" method="get" >
		<ec:table 
			tableId="rptRegionMemberCountListTable"
			items="rptRegionMemberCounts"
			var="rptRegionMemberCountVar"
			action="rptRegionMemberCounts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="rptRegionMemberCountListTableForm">
			<ec:exportXls fileName="rptRegionMemberCount.xls"></ec:exportXls>
			<ec:row>
				<ec:column property="province" title="label.state" style="white-space:nowrap;"/>
				<ec:column property="city" title="miMember.delivery.city" style="white-space:nowrap;" />
				<ec:column property="district" title="miMember.delivery.q" style="white-space:nowrap;" />
				
				<ec:column property="0" title="busi.the.total.number.of.silver" styleClass="numberColumn" style="background-color: #f5ecff;" width="50">
					${rptRegionMemberCountVar.first_count_5+rptRegionMemberCountVar.manul_5 }
				</ec:column>
				<ec:column property="first_count_5" title="busi.the.first.purchase.of.silver" sortable="true" styleClass="numberColumn" style="background-color: #f5ecff;" width="50"/>
				<ec:column property="manul_5" title="busi.silver.adjustment" sortable="true" styleClass="numberColumn" style="background-color: #f5ecff;" width="50" />
				<ec:column property="active_5" title="busi.active.silver" sortable="true" styleClass="numberColumn" style="background-color: #f5ecff;" width="50" />
				
				<ec:column property="1" title="busi.total.gold.card" styleClass="numberColumn" style="background-color: #ffffdd;" width="50">
					${rptRegionMemberCountVar.first_count_10+rptRegionMemberCountVar.manul_10 }
				</ec:column>
				<ec:column property="first_count_10" title="busi.gold.card.initial.purchase" sortable="true" styleClass="numberColumn" style="background-color: #ffffdd;" width="50"/>
				<ec:column property="upgrade_count_10" title="busi.gold.card.upgrade" sortable="true" styleClass="numberColumn" style="background-color: #ffffdd;" width="50" />
				<ec:column property="manul_10" title="busi.gold.card.adjustment" sortable="true" styleClass="numberColumn" style="background-color: #ffffdd;" width="50" />
				<ec:column property="active_10" title="busi.gold.card.is.active" sortable="true" styleClass="numberColumn" style="background-color: #ffffdd;" width="50" />
				
				<ec:column property="2" title="busi.total.platinum" styleClass="numberColumn" style="background-color: #dfffdf;" width="50">
					${rptRegionMemberCountVar.first_count_20+rptRegionMemberCountVar.upgrade_count_20+rptRegionMemberCountVar.manul_20 }
				</ec:column>
				<ec:column property="first_count_20" title="busi.platinum.first.purchase" sortable="true" styleClass="numberColumn" style="background-color: #dfffdf;" width="50" />
				<ec:column property="upgrade_count_20" title="busi.platinum.upgrade" sortable="true" styleClass="numberColumn" style="background-color: #dfffdf;" width="50" />
				<ec:column property="manul_20" title="busi.platinum.adjustment" sortable="true" styleClass="numberColumn" style="background-color: #dfffdf;" width="50" />
				<ec:column property="active_20" title="bsui.platinum.active" sortable="true" styleClass="numberColumn" style="background-color: #dfffdf;" width="50" />
				
				<ec:column property="3" title="busi.total.diamonds" styleClass="numberColumn" style="background-color: #ddeeff;" width="50">
					${rptRegionMemberCountVar.first_count_30+rptRegionMemberCountVar.upgrade_count_30+rptRegionMemberCountVar.manul_30 }
				</ec:column>
				<ec:column property="first_count_30" title="busi.diamond.first.purchase" sortable="true" styleClass="numberColumn" style="background-color: #ddeeff;" width="50" />
				<ec:column property="upgrade_count_30" title="busi.diamond.upgrade" sortable="true" styleClass="numberColumn" style="background-color: #ddeeff;" width="50" />
				<ec:column property="manul_30" title="busi.diamond.adjustment" sortable="true" styleClass="numberColumn" style="background-color: #ddeeff;" width="50" />
				<ec:column property="active_30" title="busi.diamond.active" sortable="true" styleClass="numberColumn" style="background-color: #ddeeff;" width="50" />
				
				<%--<ec:column property="4" title="busi.shop.total" styleClass="numberColumn" style="background-color: #ffe8e8;" width="50">--%>
					<%--${rptRegionMemberCountVar.first_count_40+rptRegionMemberCountVar.upgrade_count_40+rptRegionMemberCountVar.manul_40 }--%>
				<%--</ec:column>--%>
				<%--<ec:column property="first_count_40" title="busi.shop.first.purchase" sortable="true" styleClass="numberColumn" style="background-color: #ffe8e8;" width="50" />--%>
				<%--<ec:column property="upgrade_count_40" title="busi.store.upgrade" sortable="true" styleClass="numberColumn" style="background-color: #ffe8e8;" width="50" />--%>
				<%--<ec:column property="manul_40" title="busi.shop.adjustment" sortable="true" styleClass="numberColumn" style="background-color: #ffe8e8;" width="50" />--%>
				<%--<ec:column property="active_40" title="busi.shop.active" sortable="true" styleClass="numberColumn" style="background-color: #ffe8e8;" width="50" />--%>
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