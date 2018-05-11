<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.memberListBdDailyCalcs"/></title>
    <meta name="heading" content="<fmt:message key="menu.memberListBdDailyCalcs"/>"/>
</head>

<c:if test="${empty bdDailyCalcs }">
	<fmt:message key="error.current.no.daily.calc.data"/>
</c:if>
<c:if test="${not empty bdDailyCalcs }">
	<table class="table">
		<thead>
	        <tr>
	          	<th><fmt:message key="title.date"/></th>
	          	<th><fmt:message key="title.level"/></th>
	          	<th><fmt:message key="bd.promote.bonus"/></th>
	          	<th><fmt:message key="bd.layout.bonus"/></th>
	    		<th><fmt:message key="bdBonusReport.sellBonus"/></th>
	    		<th><fmt:message key="bd.serve.bonus"/></th>
				<th>报单费</th>
	          	<th><fmt:message key="bd.total.should.sent"/></th>
				<th><fmt:message key="实发"/></th>
	          	<th><fmt:message key="lang.is.send"/></th>
	        </tr>
		</thead>
		<c:forEach items="${bdDailyCalcs}" var="bdDailyCalcVar">
			<c:if test="${bdDailyCalcVar.w_day>='2017-07-16'}">
				<tr>
					<td>
						<a href="viewBdDailyCalc.jhtml?id=${bdDailyCalcVar.id}">
							<fmt:parseDate pattern="yyyy-MM-dd" value="${bdDailyCalcVar.w_day }" var="theDay"/>
							<fmt:formatDate value="${theDay }" pattern="yyyy-MM-dd"/>
						</a>
					</td>
					<td><win:code listCode="member.card.type" value="${bdDailyCalcVar.card_type }"/></td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_help }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_cp }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_sell }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_manager }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bill_fee }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_all }</fmt:formatNumber>
					</td>
					<td>
						<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.send_money }</fmt:formatNumber>
					</td>
					<td align="center"><win:code listCode="yesno" value="${bdDailyCalcVar.send_status }"/></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</c:if>

<script type="text/javascript">
$(function() {
	
});
</script>