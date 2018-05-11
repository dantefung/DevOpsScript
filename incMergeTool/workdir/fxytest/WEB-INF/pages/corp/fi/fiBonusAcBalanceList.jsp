<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>收益帐户查询</title>
    <meta name="heading" content="收益帐户查询"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusAcBalances.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${sessionScope.sessionLogin.companyCode=='AA'}">
			<dl>
				<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
				<dd>
					<select name="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="pd.agentormember"/></dt>
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list name="status" listCode="bonus_account_status" value="${param.status }" defaultValue="" showBlankLine="true" /></dd>
		</dl>
		<dl>
			<dt><fmt:message key="bonus.can.send.money.scope"/></dt>
			<dd>
				<input name="startMoney" type="text" value="${param.startMoney }" size="10"/> - 
				<input name="endMoney" type="text" value="${param.endMoney }" size="10"/>		
			</dd>
		</dl>

		<dl>
			<dt><fmt:message key="operation.button.search"/></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusAcBalances"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
<tr>
	<td align="right" class="footer"><b><fmt:message key="report.allTotal"/>:</b></td>
	<td align="right" class="footer">
		<b><c:if test="${not empty totalBalance.total_normal_balance}"><fmt:formatNumber pattern="###,##0.00" value="${totalBalance.total_normal_balance}"/></c:if>
		<c:if test="${empty totalBalance.total_normal_balance}">0.00</c:if></b>
	</td>
	<td align="right" class="footer">
		<b><c:if test="${not empty totalBalance.total_freeze_balance}"><fmt:formatNumber pattern="###,##0.00" value="${totalBalance.total_freeze_balance}"/></c:if>
		<c:if test="${empty totalBalance.total_freeze_balance}">0.00</c:if></b>
	</td>
	<td align="right" class="footer" colspan="3">
		&nbsp;
	</td>
	<td align="right" class="footer">
		<b><c:if test="${not empty totalBalance.total_send_money}"><fmt:formatNumber pattern="###,##0.00" value="${totalBalance.total_send_money}"/></c:if>
		<c:if test="${empty totalBalance.total_send_money}">0.00</c:if></b>
	</td>
</tr>
</c:set>

<div class="contentBody">
	
	<form id="fiBonusAcBalanceListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusAcBalanceListTable"
			items="fiBonusAcBalances"
			var="fiBonusAcBalanceVar"
			action="fiBonusAcBalances.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusAcBalanceListTableForm" footer="${footTotalVar}">
			<ec:row>
				<ec:column property="member_no" title="miMember.memberNo">
					${fiBonusAcBalanceVar.member_no} ${fiBonusAcBalanceVar.user_name}
				</ec:column>
				<ec:column property="balance" title="bonus.account.type.normal" styleClass="numberColumn" width="100">
					<fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcBalanceVar.balance}"/>
				</ec:column>
				<ec:column property="freeze_amt" title="bonus.account.type.freeze" styleClass="numberColumn" width="100">
					<fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcBalanceVar.freeze_amt}"/>
				</ec:column>
				<ec:column property="status" title="fi.status" styleClass="centerColumn" width="100">
					<win:code listCode="bonus_account_status" value="${fiBonusAcBalanceVar.status }"/>
				</ec:column>
				<ec:column property="send_percent" title="bonus.send.percent" styleClass="numberColumn" width="100">
					${fiBonusAcBalanceVar.send_percent}%
				</ec:column>
				<ec:column property="send_low" title="bonus.send.lowest" styleClass="numberColumn" width="100">
					<fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcBalanceVar.send_low}"/>
				</ec:column>
				<ec:column property="need_send_money" title="bonus.can.send.money" styleClass="numberColumn" width="100">
					<fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcBalanceVar.need_send_money}"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>