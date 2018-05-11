<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="FCF值日收盘价"/></title>
    <meta name="heading" content="<fmt:message key="FCF值日收盘价"/>"/>
</head>

<script src="${ctx}/scripts/Highstock-4.2.3/highstock-all.js"></script>

<div class="searchBar">
	<form method="get" action="scValueDailys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>
				日期
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>显示方式</dt>
			<dd>
				<win:list name="showMethod" listCode="sc_show_method" defaultValue="" value="${param.showMethod }"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listScValueDailys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<c:if test="${param.showMethod=='table' }">
		<form id="scValueDailyListTableForm" method="get" >
			<ec:table 
				tableId="scValueDailyListTable"
				items="scValueDailys"
				var="scValueDailyVar"
				action="scValueDailys.jhtml"
				width="100%" method="get"
				autoIncludeParameters="true"
				retrieveRowsCallback="limit"
				rowsDisplayed="20" sortable="false" form="scValueDailyListTableForm">
				<ec:row>
					<ec:column property="scValue" title="币值" />
					<ec:column property="runDate" title="日期">
						${fn:substring(scValueDailyVar.runDate,0,10) }
					</ec:column>
				</ec:row>
			</ec:table>
		</form>
	</c:if>
	<c:if test="${param.showMethod=='chart' }">
		<div id="container" style="height: 500px; min-width: 310px"></div>
	</c:if>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
	<c:if test="${param.showMethod=='chart' }">
	Highcharts.setOptions({
		global: {
			useUTC: false
		},
		lang: {
			downloadJPEG: "转成JPEG文件并下载",
			downloadPDF: "转成PDF文件并下载",
			downloadPNG: "转成PNG文件并下载",
			downloadSVG: "转成SVG文件并下载",
			loading: "正在加载...",
			months: ['一月','二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
			printChart: "打印图表",
			rangeSelectorFrom: "从",
			rangeSelectorTo: "至",
			rangeSelectorZoom: "缩放",
			resetZoom: "复原",
			resetZoomTitle: "复原至1:1",
			shortMonths:['一月','二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
			weekdays: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]
		}
	});
	$.getJSON('scValueDailys.jhtml?startDate=${param.startDate}&endDate=${param.endDate}&showMethod=chart&doType=getData', function (data) {
        // Create the chart
        $('#container').highcharts('StockChart', {
            rangeSelector : {
                selected : 1
            },

            title : {
                text : 'ETB值日收盘价'
            },
            
            tooltip:{
            	valueDecimals: 5,
            	formatter: function() {
                    return '<b>日期:</b>' + Highcharts.dateFormat("%Y-%m-%d",this.x) + '<br/><b>币值:</b>' + this.y + '';
                }
            },
            
            xAxis: {
                tickInterval: 1 * 24 * 3600 * 1000,
            },

            series : [{
                name : '币值',
                data : data
            }]
        });
    });
	</c:if>
});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>