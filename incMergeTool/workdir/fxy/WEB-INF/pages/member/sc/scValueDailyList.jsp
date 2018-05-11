<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="启动积分前10日价值"/></title>
    <meta name="heading" content="<fmt:message key="启动积分前10日价值"/>"/>
</head>

<script src="${ctx}/scripts/Highstock-4.2.3/highstock-all.js"></script>

<div id="container" style="height: 500px; min-width: 310px"></div>
	
<script type="text/javascript">
$(function() {
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
	$.getJSON('scValueDailys.jhtml?doType=getData', function (data) {
        // Create the chart
        $('#container').highcharts('StockChart', {
        	chart: {
        		borderWidth:1,
        		borderColor:"#eeeeee"
        	},
            rangeSelector : {
                enabled:false
            },
            scrollbar: {
            	enabled:false
            },
            navigator: {
            	enabled:false
            },
            credits: {
        		enabled: false
        	},
        	exporting: {
        		enabled:false
        	},
            title : {
                text : '启动积分前10日价值'
            },
            
            plotOptions: {
            	line:{
            		color:"#ff0000",
            		lineWidth:1,
            		shadow:false
            	},
            	spline:{
            		lineWidth:1
            	}
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
});

</script>