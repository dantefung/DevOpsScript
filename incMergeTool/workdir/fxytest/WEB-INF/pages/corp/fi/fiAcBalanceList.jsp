<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fi.accBal.statistics"/></title>
    <meta name="heading" content="<fmt:message key="fi.accBal.statistics"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiAcBalances.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<%-- <dl>
			<dd>钱包地址</dd>
			<dd><input name="acAddress" type="text" value="${param.acAddress }" size="30"/></dd>
		</dl> --%>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listFiAcBalances"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="4"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.sum_balance }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.sum_freeze_balance }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<!-- <td class="footer">
		</td> -->
	</tr>
</c:set>

<div class="contentBody">
	<form id="fiAcBalanceListTableForm" method="get" >
		<ec:table 
			tableId="fiAcBalanceListTable"
			items="fiAcBalances"
			var="fiAcBalanceVar"
			action="fiAcBalances.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="fiAcBalanceListTableForm" footer="${footTotalVar }">
			<ec:row>
				<ec:column property="member_no" 		title="miMember.memberNo" />
				<ec:column property="user_name" 		title="poOrder.memberName" />
				<ec:column property="ac_type" 	title="title.accout.type">
					<win:code listCode="bank_account_types" value="${fiAcBalanceVar.ac_type }"/>
				</ec:column>
				<ec:column property="company_code" 	title="bdReconsumMoneyReport.company" />
				<ec:column property="balance" 		title="fiAwardItem.balance" styleClass="numberColumn">
					<fmt:formatNumber value="${fiAcBalanceVar.balance}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="freeze_balance" 	title="fiBankbookBalance.freezeAmt" styleClass="numberColumn">
					<fmt:formatNumber value="${fiAcBalanceVar.freeze_balance}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<%-- <ec:column property="ac_address" 	title="钱包地址"/> --%>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiAcBalance(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiAcBalanceFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiAcBalance";
	
	showLoading();
	theForm.submit();
}
</script>