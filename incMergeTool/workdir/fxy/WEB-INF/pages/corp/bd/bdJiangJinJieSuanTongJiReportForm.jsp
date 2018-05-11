<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>收益结算统计表单</title>
	<meta name="heading" content="收益结算统计表单" />
</head>
<style>
.bd_th{
	border:1px solid #C0C0C0;
	background-color: #F0F8FF;
	margin: 0 0 0 0;
	padding: 0 0 0 0;
}
.bd_td{
	border:1px solid #C0C0C0;
	margin: 0 0 0 0;
	padding: 0 0 0 0;
}
.bd_title{
	font-family: Arial, sans-serif;
	font-size: 18px;
	color: #369;
	padding-bottom: 4px;
	border-bottom: 1px solid #999;
}

</style>

<div class="contentBody" >
	
	<table width="100%">
	    <tr>
	    	<th class="bd_th" width="150px">项目</th>
	    	<th class="bd_th" width="150px">销售业绩(金额)</th>
	    	<th class="bd_th" width="150px">一般会员退货(金额)</th>
	    	<th class="bd_th" width="150px">美体会员退货(金额)</th>
	    	<th class="bd_th" width="150px">实际结算(金额)</th>
		</tr>
	    <tr>
	    	<td class="bd_td" align="center">首购</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shougou.totalamount}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shougou.nomtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shougou.mtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shougou.totalamount-mapJinE4TuiHuo.shougou.totalamount}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">升级</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shengji.totalamount}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shengji.nomtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shengji.mtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shengji.totalamount-mapJinE4TuiHuo.shengji.totalamount}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">返单</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.fandan.totalamount}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.fandan.nomtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.fandan.mtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.fandan.totalamount-mapJinE4TuiHuo.fandan.totalamount}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">合计</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shougou.nomtpramt+mapJinE4TuiHuo.shengji.nomtpramt+mapJinE4TuiHuo.fandan.nomtpramt}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4TuiHuo.shougou.mtpramt+mapJinE4TuiHuo.shengji.mtpramt+mapJinE4TuiHuo.fandan.mtpramt}</fmt:formatNumber></td>
	    	<!-- H5 -->
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapJinE4XiaoShouYeJi.shougou.totalamount-mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount-mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount-mapJinE4TuiHuo.fandan.totalamount}</fmt:formatNumber></td>
	    </tr>
	</table>
	
	<br />
	<table width="100%">
	    <tr>
	    	<th class="bd_th" width="150px">项目</th>
	    	<th class="bd_th" width="150px">销售业绩(<fmt:message key="busi.pv"/>)</th>
	    	<th class="bd_th" width="150px">一般会员退货(<fmt:message key="busi.pv"/>)</th>
	    	<th class="bd_th" width="150px">美体会员退货(<fmt:message key="busi.pv"/>)</th>
	    	<th class="bd_th" width="150px">实际结算(<fmt:message key="busi.pv"/>)</th>
		</tr>
	    <tr>
	    	<td class="bd_td" align="center">首购</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shougou.totalpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shougou.nomtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shougou.mtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shougou.totalpv-mapPv4TuiHuo.shougou.totalpv}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">升级</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shengji.totalpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shengji.nomtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shengji.mtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shengji.totalpv-mapPv4TuiHuo.shengji.totalpv}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">返单</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.fandan.totalpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.fandan.nomtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.fandan.mtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.fandan.totalpv-mapPv4TuiHuo.fandan.totalpv}</fmt:formatNumber></td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">合计</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shougou.nomtprpv+mapPv4TuiHuo.shengji.nomtprpv+mapPv4TuiHuo.fandan.nomtprpv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4TuiHuo.shougou.mtprpv+mapPv4TuiHuo.shengji.mtprpv+mapPv4TuiHuo.fandan.mtprpv}</fmt:formatNumber></td>
	    	<!-- H11 -->
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapPv4XiaoShouYeJi.shougou.totalpv-mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv-mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv-mapPv4TuiHuo.fandan.totalpv}</fmt:formatNumber></td>
	    </tr>
	</table>
	<br />
	
	<div class="bd_title">收益列项</div>
	<table width="100%">
	    <tr>
	    	<th class="bd_th" width="150px">项目</th>
	    	<th class="bd_th" width="150px">获取人数</th>
	    	<th class="bd_th" width="150px"><fmt:message key="busi.pv"/></th>
	    	<th class="bd_th" width="150px"><fmt:message key="busi.pv"/>占比</th>
	    	<th class="bd_th" width="150px">金额</th>
	    	<th class="bd_th" width="150px">金额占比</th>
		</tr>
	    <tr>
	    	<td class="bd_td" align="center">销售奖</td>
	    	<td class="bd_td" align="center">${mapLX.mapXiaoShou.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapXiaoShou.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapXiaoShou.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapXiaoShou.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapXiaoShou.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapXiaoShou.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">服务奖</td>
	    	<td class="bd_td" align="center">${mapLX.mapFuWu.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapFuWu.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapFuWu.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapFuWu.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapFuWu.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapFuWu.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapFuWu.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapFuWu.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">培训奖</td>
	    	<td class="bd_td" align="center">${mapLX.mapPeiXun.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapPeiXun.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapPeiXun.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapPeiXun.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapPeiXun.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapPeiXun.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapPeiXun.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapPeiXun.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">业绩奖</td>
	    	<td class="bd_td" align="center">${mapLX.mapYeJi.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapYeJi.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapYeJi.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapYeJi.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapYeJi.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapYeJi.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapYeJi.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapYeJi.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">促销分红</td>
	    	<td class="bd_td" align="center">${mapLX.mapCuXiao.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapCuXiao.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapCuXiao.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapCuXiao.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapCuXiao.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapCuXiao.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapCuXiao.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapCuXiao.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">年终红利</td>
	    	<td class="bd_td" align="center">${mapLX.mapNianZhong.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapNianZhong.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapNianZhong.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapNianZhong.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapNianZhong.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapNianZhong.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapNianZhong.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapNianZhong.pv*6.8)/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">合计</td>
	    	<td class="bd_td" align="center">${mapLX.mapXiaoShou.renshu+mapLX.mapFuWu.renshu+mapLX.mapPeiXun.renshu+mapLX.mapYeJi.renshu+mapLX.mapCuXiao.renshu+mapLX.mapNianZhong.renshu}</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapXiaoShou.pv+mapLX.mapFuWu.pv+mapLX.mapPeiXun.pv+mapLX.mapYeJi.pv+mapLX.mapCuXiao.pv+mapLX.mapNianZhong.pv}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapXiaoShou.pv+mapLX.mapFuWu.pv+mapLX.mapPeiXun.pv+mapLX.mapYeJi.pv+mapLX.mapCuXiao.pv+mapLX.mapNianZhong.pv)
	    			/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${(mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8)}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${((mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8))/
	    			(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    
	    
	    <tr>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center">扣税金额</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${((mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8))*0.05}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(((mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8))*0.05)/
		    		(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center"></td>
	    	<td class="bd_td" align="center">实发金额</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${((mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8))*0.95}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapXiaoShou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(((mapLX.mapXiaoShou.pv*6.8)+(mapLX.mapFuWu.pv*6.8)+(mapLX.mapPeiXun.pv*6.8)+(mapLX.mapYeJi.pv*6.8)+(mapLX.mapCuXiao.pv*6.8)+(mapLX.mapNianZhong.pv*6.8))*0.95)/
	    			(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	</table>
	<br />
	
	<div class="bd_title">基金列项</div>
	<table width="100%">
	    <tr>
	    	<th class="bd_th" width="150px">项目</th>
	    	<th class="bd_th" width="150px">获取人数</th>
	    	<th class="bd_th" width="150px"><fmt:message key="busi.pv"/></th>
	    	<th class="bd_th" width="150px"><fmt:message key="busi.pv"/>占比</th>
	    	<th class="bd_th" width="150px">金额</th>
	    	<th class="bd_th" width="150px">金额占比</th>
		</tr>
	    <tr>
	    	<td class="bd_td" align="center">旅游基金</td>
	    	<td class="bd_td" align="center">${mapLX.mapLvYou.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapLvYou.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapLvYou.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapLvYou.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapLvYou.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${mapLX.mapLvYou.pv*6.8/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">汽车基金</td>
	    	<td class="bd_td" align="center">${mapLX.mapQiChe.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapQiChe.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapQiChe.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapQiChe.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapQiChe.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapQiChe.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapQiChe.pv}">
	    			<fmt:formatNumber pattern="##0.00">${mapLX.mapQiChe.pv*6.8/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">豪宅基金</td>
	    	<td class="bd_td" align="center">${mapLX.mapHaoZhai.renshu}</td>
	    	<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapLX.mapHaoZhai.pv}</fmt:formatNumber></td>
	    	<td class="bd_td" align="center">
		    	<c:if test="${!empty mapLX.mapHaoZhai.pv}">
					<fmt:formatNumber pattern="##0.00">${mapLX.mapHaoZhai.pv/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
		    	</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapHaoZhai.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapHaoZhai.pv*6.8}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapHaoZhai.pv}">
	    			<fmt:formatNumber pattern="##0.00">${mapLX.mapHaoZhai.pv*6.8/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>
	    <tr>
	    	<td class="bd_td" align="center">合计</td>
	    	<td class="bd_td" align="center">${mapLX.mapLvYou.renshu+mapLX.mapQiChe.renshu+mapLX.mapHaoZhai.renshu}</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${mapLX.mapLvYou.pv+mapLX.mapQiChe.pv+mapLX.mapHaoZhai.pv}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${(mapLX.mapLvYou.pv+mapLX.mapQiChe.pv+mapLX.mapHaoZhai.pv)
	    			/(mapPv4XiaoShouYeJi.shougou.totalpv+mapPv4TuiHuo.shougou.totalpv+mapPv4XiaoShouYeJi.shengji.totalpv+mapPv4TuiHuo.shengji.totalpv+mapPv4XiaoShouYeJi.fandan.totalpv+mapPv4TuiHuo.fandan.totalpv)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="###,##0.00">${(mapLX.mapLvYou.pv*6.8)+(mapLX.mapQiChe.pv*6.8)+(mapLX.mapHaoZhai.pv*6.8)}</fmt:formatNumber>
	    		</c:if>
	    	</td>
	    	<td class="bd_td" align="center">
	    		<c:if test="${!empty mapLX.mapLvYou.pv}">
	    			<fmt:formatNumber pattern="##0.00">${((mapLX.mapLvYou.pv*6.8)+(mapLX.mapQiChe.pv*6.8)+(mapLX.mapHaoZhai.pv*6.8))
	    			/(mapJinE4XiaoShouYeJi.shougou.totalamount+mapJinE4TuiHuo.shougou.totalamount+mapJinE4XiaoShouYeJi.shengji.totalamount+mapJinE4TuiHuo.shengji.totalamount+mapJinE4XiaoShouYeJi.fandan.totalamount+mapJinE4TuiHuo.fandan.totalamount)*100}</fmt:formatNumber>%
	    		</c:if>
	    	</td>
	    </tr>	    
    </table>
	<br />
	
	<div class="bd_title">其它列项</div>
	<table width="100%">
		<tr>
			<th class="bd_th" width="150px">消费券</th>
			<th class="bd_th" width="150px"></th>
			<th class="bd_th" width="150px">赠送商品</th>
			<th width="0px"></th>
		</tr>
		<tr>
			<td class="bd_td" align="center">实际参与结算订单金额</td>
			<td class="bd_td" align="center">消费券金额</td>
			<td class="bd_td" align="center">赠送商品金额</td>
			<td width="0px"></td>
		</tr>	
		<tr>
			<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapXFJ.per_sell_amt}</fmt:formatNumber>&nbsp;</td>
			<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapXFJ.coupons_money}</fmt:formatNumber>&nbsp;</td>
			<td class="bd_td" align="center"><fmt:formatNumber pattern="###,##0.00">${mapZSSP.handsel_amt}</fmt:formatNumber>&nbsp;</td>
			<td width="0px"></td>
		</tr>	
	</table>
	
	<br />
	
	<hr/>
	<table class='list' width="720">
		<tr>
			<th width="120" align="center"></th>
			<th width="300" align="center"></th>
			<th width="300" align="center"></th>
		</tr>
		<tr>
			<td align="center">
				<button type="button" name="cancel" onclick="window.location='bdJiangJinJieSuanTongJiReport.jhtml'">返回</button>
			</td>
		</tr>
	</table>
	
</div>


