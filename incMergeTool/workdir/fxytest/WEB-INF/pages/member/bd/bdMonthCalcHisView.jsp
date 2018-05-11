<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看月结奖金明细"/></title>
    <meta name="heading" content="<fmt:message key="查看月结奖金明细"/>"/>
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

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="title.monthly.bonus.details"/></div>
    
    <table class="table table-bordered">
    	<tr>
    		<th><fmt:message key="bdPeriod.wmonth"/></th>
    		<th><fmt:message key="miMember.cardType"/></th>
    		<th><fmt:message key="bdBonusReport.bonusDivdend"/></th>
    	</tr>
    	<tr>
    		<td>${bdMonthCalcHis.wmonth }</td>
    		<td><win:code listCode="member.card.type" value="${bdMonthCalcHis.cardType }"/></td>
    		<td><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusDivend}</fmt:formatNumber></td>
    	</tr>
    	<tr>
    		<th><%--个人业绩--%><fmt:message key="bdBonusReport.singleFeat"/></th>
    		<th><%--组织业绩--%><fmt:message key="function.menu.bdBonusTreeQuery"/></th>
    		<th><%--返单业绩--%><fmt:message key="title.return.performance"/></th>
    	</tr>
    	<tr>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.perSell}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.groupSell}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.perResellPv}</fmt:formatNumber>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bd.reconsume.bonus"/></th>
    		<th><fmt:message key="bd.sales.bonus"/></th>
    		<th><fmt:message key="bdSendRecord.bonusMoney"/></th>
    	</tr>
    	<tr>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusManager}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusWshare}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusAll}</fmt:formatNumber>
    		</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="lang.plat.mgr.fee"/></th>
    		<th><fmt:message key="lang.sudeki.bonus"/></th>
    		<th><fmt:message key="bdSendRecord.sendMoney"/></th>
    	</tr>
    	<tr>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.feeService}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.deductReSell}</fmt:formatNumber>
    		</td>
    		<td>
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.sendMoney}</fmt:formatNumber>
    		</td>
    	</tr>
    </table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="sources.of.reprize.awards"/></div>
 	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="busi.finance.amount"/></th>
				<th><fmt:message key="busi.pv"/></th>
				<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${m01BdBonusSubDetails}" var="agentPoShipVar">
				<tr>
					<td>${agentPoShipVar.recommend_code }</td>
					<td><fmt:formatNumber pattern="###,##0.00" value="${agentPoShipVar.money * outRate }"/></td>
					<td>${agentPoShipVar.pv * outRate }</td>
					<td>${agentPoShipVar.bonus_point }</td>
					<td>${agentPoShipVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="src.of.sales.bonus"/></div>
 	<table class="table table-bordered table-striped">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="busi.finance.amount"/></th>
				<th><fmt:message key="busi.pv"/></th>
				<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${m02BdBonusSubDetails}" var="agentPoShipVar">
				<tr>
					<td>${agentPoShipVar.recommend_code }</td>
					<td><fmt:formatNumber pattern="###,##0.00" value="${agentPoShipVar.money * outRate }"/></td>
					<td>${agentPoShipVar.pv * outRate }</td>
					<td>${agentPoShipVar.bonus_point }</td>
					<td>${agentPoShipVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<a href="bdDailyCalcs.jhtml?needReload=1" class="btn btn-default col-md-4 col-md-offset-4 col-xs-12"><fmt:message key="operation.button.return"/></a>

<script type="text/javascript">
//
</script>