<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>未入账奖金</title>
    <meta name="heading" content="未入账奖金"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<c:set var="leftNavVar" scope="request">
	<div class="panel panel-success">
  		<div class="panel-heading"><fmt:message key="fi.zhmx"/></div>
  		<div class="list-group">
  			<a class="list-group-item list-group-item-warning" href="bdBonusSubs.jhtml">未入账奖金</a>
  			<c:forEach items="${fiAcBalances }" var="fiAcBalanceVar">
	  			<a class="list-group-item" href="fiAcBalanceItems.jhtml?acType=${fiAcBalanceVar.ac_type }">
					<win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
					(
					<span class="text-danger">
					<c:set var="totalBalanceVar" value="${fiAcBalanceVar.balance}"/>
					<c:if test="${fn:indexOf(totalBalanceVar,'.')>0 }">
						<fmt:formatNumber pattern="###0.00">${fn:substring(totalBalanceVar,0,fn:indexOf(totalBalanceVar,'.')+3) }</fmt:formatNumber>
					</c:if>
					<c:if test="${fn:indexOf(totalBalanceVar,'.')<=0 }">
						<fmt:formatNumber pattern="###0.00">${totalBalanceVar}</fmt:formatNumber>
					</c:if>
					</span>
					)
				</a>
			</c:forEach>
		</div>
	</div>
</c:set>

<c:if test="${not empty bdBonusSubs }">
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th>产生时间</th>
				<th>类型</th>
				<th>金额</th>
				<th>摘要</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${bdBonusSubs}" var="bdBonusSubVar">
				<tr>
					<td>${bdBonusSubVar.create_time}</td>
					<td><win:code listCode="bdbonussub.bonustype" value="${bdBonusSubVar.bonus_type }"/></td>
					<td>
						<fmt:formatNumber value="${bdBonusSubVar.send_money}" type="number" pattern="###,###,##0.00"/>
					</td>
					<td>
						${fn:replace(bdBonusSubVar.notes, vEnter, '<br>')}
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<td colspan="2" align="right"><strong>合计：</strong></td>
			<td><strong><fmt:formatNumber pattern="###,##0.00">${bdBonusSubSum.sum_send_money }</fmt:formatNumber></strong></td>
			<td></td>
		</tfoot>
	</table>
</c:if>

<win:page pageId="bdBonusRecordsPager" action="bdBonusSubs.jhtml" autoIncludeParameters="true"/>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

</script>