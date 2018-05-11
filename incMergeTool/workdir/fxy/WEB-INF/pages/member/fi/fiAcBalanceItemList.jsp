<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="fi.zhmx"/></title>
    <meta name="heading" content="<fmt:message key="fi.zhmx"/>"/>
</head>

<c:set var="leftNavVar" scope="request">
	<div class="panel panel-success">
  		<div class="panel-heading"><fmt:message key="fi.zhmx"/></div>
  		<div class="list-group">
  			<!-- <a class="list-group-item" href="bdBonusSubs.jhtml">未入账奖金</a> -->
  			<c:forEach items="${fiAcBalances }" var="fiAcBalanceVar">
		  			<a class="list-group-item <c:if test="${fiAcBalanceVar.ac_type==acType}"> list-group-item-warning</c:if>" href="fiAcBalanceItems.jhtml?acType=${fiAcBalanceVar.ac_type }">
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

<c:set var="moneykey" value="bd.blance.money"/>
<c:set var="moneytitle" value="fi.zhdqxe"/>
<c:set var="moneytitle2" value="mem.fi.dongjie"/>

<fmt:message key="fi.zhdqxe"/> <span class="redFont"><fmt:formatNumber value="${balance}" type="balance" pattern="###,###,##0.00"/></span>，
<fmt:message key="mem.fi.dongjie"/><span class="redFont"><fmt:formatNumber value="${freezeBalance}" type="balance" pattern="###,###,##0.00"/></span>。
<hr/>

<%
request.setAttribute("vEnter", "\n");
%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="comm.busi.deal.transaction.date"/></th>
			<th><fmt:message key="title.item"/></th>
			<th><fmt:message key="fibankbooktemp.dealtype.A"/></th>
			<th><fmt:message key="fibankbooktemp.dealtype.D"/></th>
			<th><fmt:message key="fiBankbookJournal.balance"/></th>
			<th><fmt:message key="poSell.notes"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${fiAcBalanceItems}" var="fiAcBalanceItemVar">
			<tr>
				<td nowrap="nowrap">${fiAcBalanceItemVar.deal_date}</td>
				<td nowrap="nowrap">
					<win:code listCode="fi_ac_order_types" value="${fiAcBalanceItemVar.order_type }"/>
					<c:if test="${not empty fiAcBalanceItemVar.reason }">
						/ <win:code listCode="fi_ac_change_reason" value="${fiAcBalanceItemVar.reason }"/>
					</c:if>
				</td>
				<td>
					<c:if test="${fiAcBalanceItemVar.money>=0.00}"><fmt:formatNumber value="${fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}">&nbsp;</c:if>
				</td>
				<td>
					<c:if test="${fiAcBalanceItemVar.money>=0.00}">&nbsp;</c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}"><fmt:formatNumber value="${-fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
				</td>
				<td>
					<fmt:formatNumber value="${fiAcBalanceItemVar.balance}" type="balance" pattern="###,###,##0.00"/>
				</td>
				<td>
					${fn:replace(fiAcBalanceItemVar.memo, vEnter, '<br>')}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="fiAcBalanceItemListPager" action="fiAcBalanceItems.jhtml" autoIncludeParameters="true"/>

<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>