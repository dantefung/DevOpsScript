<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="day.calc.bonus.enquery"/></title>
    <meta name="heading" content="<fmt:message key='day.calc.bonus.enquery'/>"/>
</head>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="day.calc.bonus.details"/></div>
	<table class="table table-bordered">
    	<tr>
    		<th><fmt:message key="lang.calc.date"/></th>
    		<th><fmt:message key="bdCalculatingSubDetail.cardType"/></th>
    		<th><fmt:message key="pl.plate.recommend"/></th>
    		<th><fmt:message key="miMember.link"/></th>
    		<th></th>
    	</tr>
    	<tr>
    		<td><fmt:formatDate value="${bdDailyCalc.wday }" pattern="yyyy-MM-dd"/></td>
    		<td><win:code listCode="member.card.type" value="${bdDailyCalc.cardType }"/></td>
    		<td>
    			<c:if test="${empty recommendMiMember }">-</c:if>
    			<c:if test="${not empty recommendMiMember }">${recommendMiMember.memberNo }</c:if>
    		</td>
    		<td>
    			<c:if test="${empty linkMiMember }">-</c:if>
    			<c:if test="${not empty linkMiMember }">${linkMiMember.memberNo }</c:if>
    		</td>
    		<td></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bd.group.pv"/></th>
    		<th><fmt:message key="bd.sales.bonus.quali"/></th>
    		<th><fmt:message key="bd.serve.bonus.quali"/></th>
    		<th><fmt:message key="left.zone.wait.boom.perfomance"/></th>
    		<th><fmt:message key="right.zone.wait.boom.perfomance"/></th>
    	</tr>
    	<tr>
    		<td>${bdDailyCalc.groupSell }</td>
    		<td align="center"><win:code listCode="yesno" value="${bdDailyCalc.pass }"/></td>
    		<td align="center"><win:code listCode="yesno" value="${bdDailyCalc.ktPass }"/></td>
    		<td>${bdDailyCalc.keepCppv }</td>
    		<td>${bdDailyCalc.keepCppv2 }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="bd.promote.bonus"/></th>
    		<th><fmt:message key="bd.layout.bonus"/></th>
    		<th><fmt:message key="bd.sales.bonus"/></th>
    		<th><fmt:message key="bd.serve.bonus"/></th>
			<th>报单费</th>

    	</tr>
    	<tr>
    		<td>${bdDailyCalc.bonusHelp }</td>
    		<td>${bdDailyCalc.bonusCp }</td>
    		<td>${bdDailyCalc.bonusSell }</td>
    		<td>${bdDailyCalc.bonusManager }</td>
			<th>${bdDailyCalc.billFee }</th>
    	</tr>
    	<tr>
			<th><fmt:message key="bd.total.should.sent"/></th>
    		<th><fmt:message key="lang.maintain.fee"/></th>
    		<th><fmt:message key="lang.sudeki.bonus"/></th>
    		<th><fmt:message key="bd.reality.send"/></th>
    		<th colspan="1"></th>
    	</tr>
    	<tr>
			<td><fmt:formatNumber pattern="###,##0.00">${bdDailyCalc.bonusAll}</fmt:formatNumber></td>
    		<td>${bdDailyCalc.feeService }</td>
    		<td>${bdDailyCalc.deductReSell }</td>
    		<td><fmt:formatNumber pattern="###,##0.00">${bdDailyCalc.sendMoney}</fmt:formatNumber></td>
    		<td colspan="1"></td>
    	</tr>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="bd.group.performance.sta"/></div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="lang.nickname"/></th>
				<th><fmt:message key="last.day.resv.per"/></th>
				<th><fmt:message key="todate.new.group.performance"/></th>
				<th><fmt:message key="quantity.bump.perf"/></th>
				<th><fmt:message key="left.performance"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${childBdDailyCalcs }" var="childBdDailyCalcVar">
				<tr>
					<td>${childBdDailyCalcVar.member_no }</td>
					<td>${childBdDailyCalcVar.pet_name }</td>
					<td>${childBdDailyCalcVar.last_bl_group_pv }</td>
					<td>${childBdDailyCalcVar.group_sell }</td>
					<td>${childBdDailyCalcVar.group_sell_dp }</td>
					<td>${childBdDailyCalcVar.bl_group_pv }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="src.of.sales.bonus"/></div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="bd.bonusName"/></th>
				<th><fmt:message key="lang.source"/></th>
				<!-- <th>比例</th> -->
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${w01BdBonusSubDetails }" var="w01BdBonusSubVar">
				<tr>
					<td>${w01BdBonusSubVar.recommend_code }</td>
					<td>${w01BdBonusSubVar.money*outRate }</td>
					<td>${w01BdBonusSubVar.pv }</td>
					<%-- <td>${w01BdBonusSubVar.bonus_point }%</td> --%>
					<td>${w01BdBonusSubVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="src.of.promote.bonus"/></div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="bd.bonusName"/></th>
				<th><fmt:message key="lang.source"/></th>
				<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${w02BdBonusSubDetails }" var="w02BdBonusSubVar">
				<tr>
					<td>${w02BdBonusSubVar.recommend_code }</td>
					<td>${w02BdBonusSubVar.money*outRate }</td>
					<td>${w02BdBonusSubVar.pv*outRate }</td>
					<td>${w02BdBonusSubVar.bonus_point }%</td>
					<td>${w02BdBonusSubVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="src.of.serve.bonus"/></div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="bd.bonusName"/></th>
				<th><fmt:message key="lang.source"/></th>
				<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${w03BdBonusSubDetails }" var="w03BdBonusSubVar">
				<tr>
					<td>${w03BdBonusSubVar.recommend_code }</td>
					<td>${w03BdBonusSubVar.money*outRate }</td>
					<td>${w03BdBonusSubVar.pv*outRate }</td>
					<td>${w03BdBonusSubVar.bonus_point }%</td>
					<td>${w03BdBonusSubVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><fmt:message key="src.of.layout.bonus"/></div>
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th><fmt:message key="po.usertype.m"/></th>
				<th><fmt:message key="bd.bonusName"/></th>
				<th><fmt:message key="lang.source"/></th>
				<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
				<th><fmt:message key="bdMemberBounsCalcSell.level"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${w05BdBonusSubDetails }" var="w05BdBonusSubVar">
				<tr>
					<td>${w05BdBonusSubVar.recommend_code }</td>
					<td>${w05BdBonusSubVar.money *outRate}</td>
					<td>${w05BdBonusSubVar.pv*outRate }</td>
					<td>${w05BdBonusSubVar.bonus_point }%</td>
					<td>${w05BdBonusSubVar.algebras }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="panel panel-default">
	<div class="panel-heading">报单费来源</div>
	<table class="table table-striped table-hover">
		<thead>
		<tr>
			<th><fmt:message key="po.usertype.m"/></th>
			<th><fmt:message key="bd.bonusName"/></th>
			<th><fmt:message key="lang.source"/></th>
			<th><fmt:message key="report.bdSend.Statistic.scale"/></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${w11BdBonusSubDetails }" var="w05BdBonusSubVar">
			<tr>
				<td>${w05BdBonusSubVar.s_member }</td>
				<td>${w05BdBonusSubVar.money *outRate}</td>
				<td>${w05BdBonusSubVar.pv*outRate }</td>
				<td>${w05BdBonusSubVar.bonus_point }%</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<a href="bdDailyCalcs.jhtml?needReload=1" class="btn btn-default col-md-4 col-md-offset-4 col-xs-12"><fmt:message key="operation.button.return"/></a>

<script type="text/javascript">
//
</script>