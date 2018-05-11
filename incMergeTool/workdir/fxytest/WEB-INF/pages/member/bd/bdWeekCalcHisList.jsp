<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="周结收益查询"/></title>
    <meta name="heading" content="<fmt:message key="周结收益查询"/>"/>
</head>

<table class="table table-bordered table-striped">
	<thead>
		<tr>
			<th>周期</th>
			<th>荣誉级别</th>
			<th>总收益积分</th>
			<th>实发收益积分</th>
			<th>已发放</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bdWeekCalcHiss}" var="bdWeekCalcHisVar">
			<tr>
				<td>${bdWeekCalcHisVar.w_week }</td>
				<td><win:code listCode="stars_level" value="${bdWeekCalcHisVar.star }"/></td>
				<td align="right"><fmt:formatNumber pattern="###,##0.00" value="${bdWeekCalcHisVar.bonus_money }"/></td>
				<td align="right">
					<a href="viewBdWeekCalcHis.jhtml?id=${bdWeekCalcHisVar.id}" name="view">
						<fmt:formatNumber pattern="###,##0.00" value="${bdWeekCalcHisVar.send_money }"/>
					</a>
				</td>
				<td align="center">
					<win:code listCode="yesno" value="${bdWeekCalcHisVar.send_status }"/>
				</td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td align="right" colspan="2"><fmt:message key="report.allTotal"/>：</td>
			<td align="right">
				<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_bonus_money}</fmt:formatNumber></b>
			</td>
			<td align="right">
				<b><fmt:formatNumber pattern="###,##0.00">${bdWeekCalcHisMap.total_send_money}</fmt:formatNumber></b>
			</td>
			<td></td>
		</tr>
	</tfoot>
</table>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>