<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="month.bonus.enquery"/></title>
    <meta name="heading" content="<fmt:message key="month.bonus.enquery"/>"/>
</head>

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th><%--工作月--%><fmt:message key="bdPeriod.wmonth"/></th>
			<th><%--级别--%><fmt:message key="bdCalculatingSubDetail.cardType"/></th>
			<th><%--重消奖--%><fmt:message key="bd.reconsume.bonus"/></th>
			<th><%--销售奖--%><fmt:message key="bd.sales.bonus"/></th>
			<th><%--全球分红奖--%><fmt:message key="bdBonusReport.bonusDivdend"/></th>
			<th><%--应发--%><fmt:message key="lang.should.be.sent"/></th>
			<th><%--实发--%><fmt:message key="bd.reality.send"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bdMonthCalcHiss}" var="bdMonthCalcHisVar">
			<tr>
				<td><a href="viewBdMonthCalcHis.jhtml?id=${bdMonthCalcHisVar.id}" name="view">${bdMonthCalcHisVar.w_month }</a></td>
				<td><win:code listCode="member.card.type" value="${bdMonthCalcHisVar.card_type }"/></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${bdMonthCalcHisVar.bonus_manager * bdMonthCalcHisVar.exchange_rate }"/></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${bdMonthCalcHisVar.bonus_w_share * bdMonthCalcHisVar.exchange_rate  }"/></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${bdMonthCalcHisVar.bonus_divdend * bdMonthCalcHisVar.exchange_rate  }"/></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${bdMonthCalcHisVar.bonus_all * bdMonthCalcHisVar.exchange_rate  }"/></td>
				<td align="right">
					<fmt:formatNumber pattern="###,##0.00" value="${bdMonthCalcHisVar.send_money }"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
	
<script type="text/javascript">
function validateSearch(theForm) {

	showLoading();
	return true;
}
</script>