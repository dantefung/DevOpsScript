<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看周结收益明细"/></title>
    <meta name="heading" content="<fmt:message key="查看周结收益明细"/>"/>
</head>

<style>
table.detail th{
	text-align: center;
	background-color: #F0F0F0;
	border: 1px solid #fff;
}
table.detail td{
}
</style>

<div class="contentBody">
    <form:form commandName="bdWeekCalcHis" method="post" id="bdWeekCalcHisForm">
    
    <table class="table table-bordered table-striped" width="100%">
    	<tr>
    		<th><fmt:message key="工作周"/></th>
    		<th><fmt:message key="荣誉级别"/></th>
    		<th>应发收益</th>
    		<th>实发收益</th>
    		<th>全球分红级别</th>
    	</tr>
    	<tr>
    		<td>${bdWeekCalcHis.wweek }</td>
    		<td><win:code listCode="stars_level" value="${bdWeekCalcHis.star }"/></td>
    		<td align="right">${bdWeekCalcHis.bonusMoney }</td>
    		<td align="right">${bdWeekCalcHis.sendMoney }</td>
    		<td>${bdWshareList.shareLevel }</td>
    	</tr>
    	<tr>
    		<th>当周个人消费积分</th>
    		<th>当周部门消费积分</th>
    		<th>累计部门消费积分</th>
    		<th>扣复投积分</th>
    		<th>扣购物券</th>
    	</tr>
    	<tr>
    		<td align="right">${bdWeekCalcHis.perSell }</td>
    		<td align="right">${bdWeekCalcHis.groupSellRe }</td>
    		<td align="right">${bdWeekCalcHis.acGroupSellRe }</td>
    		<td align="right">${bdWeekCalcHis.deductReSell }</td>
    		<td align="right">${bdWeekCalcHis.deductCoupon }</td>
    	</tr>
    </table>
    
    <table class="table table-bordered table-striped" width="100%">
    	<tr>
    		<th style="width:150px;">奖项</th>
    		<th>收益积分</th>
    	</tr>
    	<tr>
    		<td>进货折扣奖励</td>
    		<td>${bdWeekCalcHis.bonusSell }</td>
    	</tr>
    	<tr>
    		<td>商铺管理奖</td>
    		<td>${bdWeekCalcHis.bonusManager }</td>
    	</tr>
    	<tr>
    		<td>销售管理奖</td>
    		<td>${bdWeekCalcHis.bonusLevel }</td>
    	</tr>
    	<tr>
    		<td>代理费用</td>
    		<td>${bdWeekCalcHis.bonusHelp }</td>
    	</tr>
    	<tr>
    		<td>全球分红</td>
    		<td>${bdWeekCalcHis.bonusWshare }</td>
    	</tr>
    	<%-- <th>
    		<td></td>
    		<td>福利奖金</td>
    		<td>${bdWeekCalcHis.bonusSell }</td>
    	</th>
    	<th>
    		<td></td>
    		<td>稳健积分奖</td>
    		<td>${bdWeekCalcHis.bonusSell }</td>
    	</th> --%>
    </table>
    
    <p class="text-center">
    	<form:hidden path="id"/>
		<input type="hidden" name="strAction" value="${param.strAction }"/>
		<button type="button" name="return" class="btn btn-default" onclick="window.location='bdWeekCalcHiss.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
    </p>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>