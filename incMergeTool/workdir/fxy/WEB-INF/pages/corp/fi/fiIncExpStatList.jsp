<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.listFiIncExpStat"/></title>
    <meta name="heading" content="<fmt:message key="menu.listFiIncExpStat"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiIncExpStat.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="title.accout.type"/></dt>
			<dd>
				<win:list name="acType" listCode="bank_account_types" defaultValue="" value="${param.acType }"/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="fiAwardTemp.dealType"/></dd>
			<dd><win:list name="orderType" listCode="fi_ac_order_types" defaultValue="" value="${param.orderType }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="lang.reasonOfDeduction"/></dd>
			<dd><win:list name="reason" listCode="fi_ac_change_reason" defaultValue="" value="${param.reason }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input name="memberNo" type="text" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="pd.createTime"/></dd>
			<dd>
				<input name="startDate" id="startDate" type="text" value="${param.startDate }" size="14" class="readonly" readonly/>
				-
				<input name="endDate" id="endDate" type="text" value="${param.endDate }" size="14" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="poSell.notes"/></dd>
			<dd><input name="memo" type="text" value="${param.memo }"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiIncExpStat"/>
			</dd>
		</dl>
	</form>
</div>


<c:set var="footTotalVar">
	<tr>
		<td align="right" class="footer" colspan="6"><fmt:message key="report.allTotal"/>：(<b><fmt:formatNumber pattern="###,##0.00">${sumMap.total_in_money+sumMap.total_out_money}</fmt:formatNumber></b>)</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${sumMap.total_in_money}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${-sumMap.total_out_money}</fmt:formatNumber></b>
		</td>
		<td class="footer" colspan="3">&nbsp;</td>
	</tr>
</c:set>
<%
request.setAttribute("vEnter", "\n");
%>
<div class="contentBody">
	
	<form id="fiAcBalanceItemListTableForm" method="get" >
		<ec:table 
			tableId="fiAcBalanceItemListTable"
			items="fiAcBalanceItems"
			var="fiAcBalanceItemVar"
			action="fiIncExpStat.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiAcBalanceItemListTableForm" footer="${footTotalVar}">
			<ec:exportXls fileName="fiIncExpStats.xls"/>
			<ec:row>
				<ec:column property="member_no" 		title="miMember.memberNo" />
				<ec:column property="user_name" 	title="poOrder.memberName" />
				<ec:column property="company_code" 		title="bdReconsumMoneyReport.company" />
				<ec:column property="Ac_type" 	title="title.accout.type">
					<win:code listCode="bank_account_types" value="${fiAcBalanceItemVar.ac_type }"/>
				</ec:column>
				<ec:column property="Order_type" 	title="fiAwardTemp.dealType">
					<win:code listCode="fi_ac_order_types" value="${fiAcBalanceItemVar.order_type }"/>
				</ec:column>
				<ec:column property="Reason" 		title="lang.reasonOfDeduction">
					<win:code listCode="fi_ac_change_reason" value="${fiAcBalanceItemVar.reason }"/>
				</ec:column>
				<ec:column property="money1" 		title="fibankbooktemp.dealtype.A" styleClass="numberColumn">
					<c:if test="${fiAcBalanceItemVar.money>=0.00}"><fmt:formatNumber value="${fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="money2" 		title="fibankbooktemp.dealtype.D" styleClass="numberColumn">
					<c:if test="${fiAcBalanceItemVar.money>=0.00}">&nbsp;</c:if>
					<c:if test="${fiAcBalanceItemVar.money<0.00}"><fmt:formatNumber value="${-fiAcBalanceItemVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
				</ec:column>
				<ec:column property="create_time" 	title="pd.createTime">
					${fiAcBalanceItemVar.creater_code } - ${fiAcBalanceItemVar.create_time }
				</ec:column>
				<ec:column property="memo" 		title="poSell.notes" >
					${fn:replace(fiAcBalanceItemVar.memo, vEnter, '<br>')}
				</ec:column>
				<ec:column property="remark" 		title="busi.common.remark" sortable="false">
					${fn:replace(fiAcBalanceItemVar.remark, vEnter, '<br>')}
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

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});


</script>