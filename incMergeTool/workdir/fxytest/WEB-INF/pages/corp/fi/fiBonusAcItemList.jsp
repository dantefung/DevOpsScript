<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.fi.listFiBonusAcItems"/></title>
    <meta name="heading" content="<fmt:message key="menu.fi.listFiBonusAcItems"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusAcItems.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="title.accout.type"/></dt>
			<dd>
				<c:forEach items="${accountTypes}" var="varAccountType">
					<input type="radio" name="accountType" value="${varAccountType.key }" id="accountType_${varAccountType.key }" onclick="this.form.submit();" class="checkbox"<c:if test="${(empty param.accountType && varAccountType.key=='normal') || (not empty param.accountType && varAccountType.key==param.accountType)}"> checked</c:if>/>
					<label for="accountType_${varAccountType.key }"><fmt:message key="${varAccountType.value}"/></label>
				</c:forEach>
			</dd>
		</dl>
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
			<dt>收益类型</dt>
			<dd>
				<win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true" />
			</dd>
		</dl>
		<win:power powerCode="searchFiBonusAcItems">
			<dl>
				<dt><fmt:message key="fiPayAdvice.userCode"/></dt>
				<dd><input name="memberNo" type="text" value="${param.memberNo }" size="10" /></dd>
			</dl>
			<dl>
				<dt><fmt:message key="fiBankbookJournal.dealType"/></dt>
				<dd><win:list name="orderType" listCode="fibonusacitem.ordertype" value="${param.orderType }" defaultValue="" showBlankLine="true" /></dd>
			</dl>
		</win:power>
		
		<win:power powerCode="advanceSearchFiBonusAcItems">
			<dl>
				<dt><fmt:message key="fiAwardTemp.week" /></dt>
				<dd><input name="wweek" type="text" value="${param.wweek }" size="6" /></dd>
			</dl>
			<dl>
				<dt><fmt:message key="printReturnList.month" /></dt>
				<dd><input name="wmonth" type="text" value="${param.wmonth }" size="6" /></dd>
			</dl>
			<dl>
				<dt>收益创建时间</dt>
				<dd>
					<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime }" size="18" class="readonly" readonly/>
					-
					<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime }" size="18" class="readonly" readonly/>
				</dd>
			</dl>
			<dl>
				<dt>收益产生时间</dt>
				<dd>
					<input name="startPayTime" id="startPayTime" type="text" value="${param.startPayTime }" size="18" class="readonly" readonly/>
					-
					<input name="endPayTime" id="endPayTime" type="text" value="${param.endPayTime }" size="18" class="readonly" readonly/>
				</dd>
			</dl>
			<dl>
				<dt><fmt:message key="bdSendRecord.bonus" /></dt>
				<dd>
					<input name="startBonus" type="text" value="${param.startBonus }" size="10" /> - <input name="endBonus" type="text" value="${param.endBonus }" size="10" />
				</dd>
			</dl>
		</win:power>

		<dl>
			<dt><fmt:message key="operation.button.search" /></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusAcItems"/>
			</dd>
		</dl>
		<!-- <dl>
			<dt>报表导出</dt>
			<dd>
				<button type="submit" name="export">导出</button>
			</dd>
		</dl> -->
	</form>
</div>

<c:set var="footTotalVar">
<tr>

	<td align="right" class="footer" colspan="7"><b><fmt:message key="report.allTotal"/>:</b></td>

	<td align="right" class="footer">
		<b>
		<c:if test="${param.accountType!='freeze'}">
			<fmt:formatNumber pattern="###,##0.00" value="${totalBalance.total_in_money}"/>
		</c:if>
		<c:if test="${param.accountType=='freeze'}">
			<fmt:formatNumber pattern="###,##0.00" value="${totalBalance.total_in_freeze}"/>
		</c:if>
		</b>
	</td>
	<td align="right" class="footer">
		<b>
		<c:if test="${param.accountType!='freeze'}">
			<fmt:formatNumber pattern="###,##0.00" value="${-totalBalance.total_out_money}"/>
		</c:if>
		<c:if test="${param.accountType=='freeze'}">
			<fmt:formatNumber pattern="###,##0.00" value="${-totalBalance.total_out_freeze}"/>
		</c:if>
		</b>
	</td>
	<td align="right" class="footer" colspan="5">
		&nbsp;
	</td>
</tr>
</c:set>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
	
	<form id="fiBonusAcItemListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusAcItemListTable"
			items="fiBonusAcItems"
			var="fiBonusAcItemVar"
			action="fiBonusAcItems.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusAcItemListTableForm" footer="${footTotalVar}">
			<ec:exportXls fileName="fiBonusAcItems.xls"/>
			<ec:row>
				<ec:column property="company_code" title="公司"/>
				<ec:column property="member_no" title="fiPayAdvice.userCode"/>
				<ec:column property="Bonus_type" title="收益类型" styleClass="centerColumn" width="100">
					<win:code listCode="bonus.type" value="${fiBonusAcItemVar.bonus_type }"/>
				</ec:column>
				
				<ec:column property="w_week" title="fiAwardTemp.week">
					<c:if test="${not empty fiBonusAcItemVar.w_week && fiBonusAcItemVar.w_week!=0}">${fiBonusAcItemVar.w_week}</c:if>
					<c:if test="${empty fiBonusAcItemVar.w_week || fiBonusAcItemVar.w_week==0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="w_month" title="printReturnList.month">
					<c:if test="${not empty fiBonusAcItemVar.w_month && fiBonusAcItemVar.w_month!=0}">${fiBonusAcItemVar.w_month}</c:if>
					<c:if test="${empty fiBonusAcItemVar.w_month || fiBonusAcItemVar.w_month==0}">&nbsp;</c:if>
				</ec:column>
				<ec:column property="Order_type" title="sysDataLog.changeType">
					<win:code listCode="fibonusacitem.ordertype" value="${fiBonusAcItemVar.order_type}"/>
				</ec:column>
				<ec:column property="deal_date" title="pd.createTime" styleClass="centerColumn">
					${fiBonusAcItemVar.deal_date}
				</ec:column>
				<ec:column property="money1" title="fibankbooktemp.dealtype.A" styleClass="numberColumn">
					<c:if test="${param.accountType!='freeze'}">
						<c:if test="${fiBonusAcItemVar.money>0.00}"><fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcItemVar.money}"/></c:if>
						<c:if test="${fiBonusAcItemVar.money<=0.00}">&nbsp;</c:if>
					</c:if>
					<c:if test="${param.accountType=='freeze'}">
						<c:if test="${fiBonusAcItemVar.freeze>0.00}"><fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcItemVar.freeze}"/></c:if>
						<c:if test="${fiBonusAcItemVar.freeze<=0.00}">&nbsp;</c:if>
					</c:if>
				</ec:column>
				<ec:column property="money2" title="fibankbooktemp.dealtype.D" styleClass="numberColumn">
					<c:if test="${param.accountType!='freeze'}">
						<c:if test="${fiBonusAcItemVar.money<0.00}"><fmt:formatNumber pattern="###,##0.00" value="${-fiBonusAcItemVar.money}"/></c:if>
						<c:if test="${fiBonusAcItemVar.money>=0.00}">&nbsp;</c:if>
					</c:if>
					<c:if test="${param.accountType=='freeze'}">
						<c:if test="${fiBonusAcItemVar.freeze<0.00}"><fmt:formatNumber pattern="###,##0.00" value="${-fiBonusAcItemVar.freeze}"/></c:if>
						<c:if test="${fiBonusAcItemVar.freeze>=0.00}">&nbsp;</c:if>
					</c:if>
				</ec:column>
				
				<ec:column property="balance" title="fiAwardItem.balance" styleClass="numberColumn">
					<c:if test="${param.accountType!='freeze'}"><fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcItemVar.balance}"/></c:if>
					<c:if test="${param.accountType=='freeze'}"><fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcItemVar.freeze_amt}"/></c:if>
				</ec:column>
				
				<ec:column property="payTime" title="收益产生时间">
					${fiBonusAcItemVar.pay_time }
				</ec:column>
				
				<c:if test="${sessionScope.sessionLogin.userType=='C'}">
					<ec:column property="createrName" title="title.operator">
						${fiBonusAcItemVar.creater_name}
					</ec:column>
				</c:if>
				<ec:column property="notes" title="poSell.notes">
					${fn:replace(fiBonusAcItemVar.notes, vEnter, '<br>')}
					<br/>
					${fiBonusAcItemVar.out_code}
					<br/>
					${fiBonusAcItemVar.b_name}
				</ec:column>
				<ec:column property="remark" title="busi.common.remark">
					${fn:replace(fiBonusAcItemVar.remark, vEnter, '<br>')}
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime, #startPayTime, #endPayTime" ).datepicker();
	$("button[name='export']").button({
        icons: {
            primary: "ui-icon-export"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusAcItem(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkItemId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusAcItemFunctionForm;
	theForm.selectedItemIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusAcItem";
	
	showLoading();
	theForm.submit();
}
</script>