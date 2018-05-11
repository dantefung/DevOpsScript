<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="day.calc.bonus.query"/></title>
    <meta name="heading" content="<fmt:message key="day.calc.bonus.query"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdDailyCalcs.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="title.date" /></dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12"/>
				-
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo" /></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.memberName" /></dt>
			<dd><input type="text" name="userName" value="${param.userName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="lang.is.send" /></dt>
			<dd>
				<win:list name="sendStatus" listCode="yesno" defaultValue="" value="${param.sendStatus }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.recommendNo" /></dt>
			<dd><input type="text" name="recommendNo" value="${param.recommendNo }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search" /></button>
				<input type="hidden" name="strAction" value="listBdDailyCalcs"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="5"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bonus_help }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bonus_cp }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bonus_sell }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bonus_manager }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bill_fee }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.bonus_all }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.fee_service }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.deduct_re_sell }</fmt:formatNumber></b>
		</td>
		<td class="footer" style="text-align: right;">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.send_money }</fmt:formatNumber></b>
		</td>
		<td class="footer" align="right"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="bdDailyCalcFunctionForm" id="bdDailyCalcFunctionForm" action="editBdDailyCalc.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdDailyCalcListTableForm" method="get" >
		<ec:table 
			tableId="bdDailyCalcListTable"
			items="bdDailyCalcs"
			var="bdDailyCalcVar"
			action="bdDailyCalcs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="bdDailyCalcListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="bdDailyCals.xls"/>
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false"  viewsAllowed="html">
					<win:power powerCode="viewBdDailyCalc">
						<a href="viewBdDailyCalc.jhtml?strAction=viewBdDailyCalc&id=${bdDailyCalcVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				<ec:column property="w_day" title="title.date">
					<fmt:parseDate pattern="yyyy-MM-dd" value="${bdDailyCalcVar.w_day }" var="theDay"/>
					<fmt:formatDate value="${theDay }" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="member_no" title="miMember.memberNo">
					${bdDailyCalcVar.member_no}
				</ec:column>
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="card_type" title="bdCalculatingSubDetail.cardType">
					<win:code listCode="member.card.type" value="${bdDailyCalcVar.card_type }"/>
				</ec:column>
				<ec:column property="bonus_help" title="bd.promote.bonus" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_help * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_cp" title="bd.layout.bonus" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_cp * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_sell" title="bd.sales.bonus" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_sell * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_manager" title="bd.serve.bonus" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_manager * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="bill_fee" title="报单费" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bill_fee * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
<%--
				<ec:column property="bonus_diviend" title="bdBonusReport.bonusDivdend" styleClass="numberColumn" >
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_diviend * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
--%>
				<ec:column property="bonus_all" title="bd.total.should.sent" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.bonus_all * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="fee_service" title="lang.maintain.fee" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.fee_service * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="deduct_re_sell" title="lang.sudeki.bonus" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.deduct_re_sell * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="send_money" title="bd.total.actually" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdDailyCalcVar.send_money * bdDailyCalcVar.exchange_rate }</fmt:formatNumber>
				</ec:column>
				<ec:column property="send_Status" title="lang.is.send" styleClass="centerColumn">
					<win:code listCode="yesno" value="${bdDailyCalcVar.send_status }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}
</script>