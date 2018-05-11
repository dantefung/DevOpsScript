<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="启动积分值流水"/></title>
    <meta name="heading" content="<fmt:message key="启动积分值流水"/>"/>
</head>

<c:set var="moneykey" value="bd.blance.money"/>
<c:set var="moneytitle" value="fi.zhdqxe"/>
<c:set var="moneytitle2" value="mem.fi.dongjie"/>

<br/>
<form method="get" action="fiQdBankbookDetail.jhtml" onsubmit="return validateSearch(this)">
	<fmt:message key="${moneytitle }"/><span class="redFont"><fmt:formatNumber value="${userBalance*showPercent}" type="balance" pattern="###,###,##0.00"/></span><%-- ，
	<fmt:message key="${moneytitle2 }"/><span class="redFont"><fmt:formatNumber value="${userFreezeAmt*showPercent}" type="balance" pattern="###,###,##0.00"/></span> --%>。
	<c:if test="${param.search==null }">
		<button type="submit" class="btn btn-info btn-sm" name="search"><fmt:message key="fi.ckzhmx"/></button>
	</c:if>
	<input type="hidden" name="strAction" value="memberQdBankbookDetail"/>
</form>

<hr/>

<%
request.setAttribute("vEnter", "\n");
%>

<table class="table table-striped table-hover">
	<thead>
		<tr>
			<%-- <th><fmt:message key="fiBankbookTemp.moneyType"/></th> --%>
			<th><fmt:message key="comm.busi.deal.transaction.date"/></th>
			<th><fmt:message key="fibankbooktemp.dealtype.A"/></th>
			<th><fmt:message key="fibankbooktemp.dealtype.D"/></th>
			<th><fmt:message key="${moneykey }"/></th>
			<th><fmt:message key="poSell.notes"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${fiBankbookJournals}" var="fiBankbookJournalVar">
			<tr>
				<%-- <td nowrap="nowrap"><win:code listCode="fibankbooktemp.moneytype" value="${fiBankbookJournalVar.moneyType }"></win:code></td> --%>
				<td nowrap="nowrap">${fiBankbookJournalVar.dealDate}</td>
				<td>
					<c:if test="${fiBankbookJournalVar.dealType=='A'}"><fmt:formatNumber value="${fiBankbookJournalVar.money*showPercent}" type="number" pattern="###,###,##0.00"/></c:if>
					<c:if test="${fiBankbookJournalVar.dealType=='D'}">&nbsp;</c:if>
				</td>
				<td>
					<c:if test="${fiBankbookJournalVar.dealType=='A'}">&nbsp;</c:if>
					<c:if test="${fiBankbookJournalVar.dealType=='D'}"><fmt:formatNumber value="${fiBankbookJournalVar.money*showPercent}" type="number" pattern="###,###,##0.00"/></c:if>
				</td>
				<td>
					<fmt:formatNumber value="${fiBankbookJournalVar.balance*showPercent}" type="balance" pattern="###,###,##0.00"/>
				</td>
				<td>
					${fn:replace(fiBankbookJournalVar.notes, vEnter, '<br>')}
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%-- <win:page pageId="fiBankbookJournalListPager" action="fiQdBankbookDetail.jhtml" autoIncludeParameters="true"/> --%>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>