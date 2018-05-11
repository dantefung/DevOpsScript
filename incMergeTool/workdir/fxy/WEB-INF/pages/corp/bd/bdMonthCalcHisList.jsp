<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title><fmt:message key="month.bonus.enquery"/></title>
	<meta name="heading" content="<fmt:message key="month.bonus.enquery"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdMonthCalcHiss.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${param.strAction=='listBdMonthCalcHiss' }">
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
				<dt><fmt:message key="printReturnList.month" />:</dt>
				<dd>
					<select name="wmonth" id="wmonth">
						<option value=""></option>
						<c:forEach items="${bdMonthStatuss }" var="bdMonthStatusVar">
							<option value="${bdMonthStatusVar.wmonth }"<c:if test="${param.wmonth==bdMonthStatusVar.wmonth }"> selected</c:if>>${bdMonthStatusVar.wmonth }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="miMember.memberNo" /></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="poOrder.memberName" /></dt>
			<dd><input type="text" name="userName" value="${param.userName }"/></dd>
		</dl>
		<c:if test="${param.strAction=='listBdMonthCalcHiss' }">
			<dl>
				<dt><fmt:message key="lang.is.send" /></dt>
				<dd>
					<win:list name="sendStatus" listCode="yesno" defaultValue="" value="${param.sendStatus }" showBlankLine="true"/>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search" /></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td align="right" class="footer" colspan="6"><fmt:message key="report.allTotal"/>：</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.bonus_manager}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.bonus_w_share}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.bonus_divdend}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.bonus_all}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.fee_service}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.deduct_re_sell}</fmt:formatNumber></b>
		</td>
		<td align="right" class="footer">
			<b><fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisMap.send_money}</fmt:formatNumber></b>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>

	<form id="bdMonthCalcHisListTableForm" method="get" >
		<ec:table
				tableId="bdMonthCalcHisListTable"
				items="bdMonthCalcHiss"
				var="bdMonthCalcHisVar"
				action="bdMonthCalcHiss.jhtml"
				width="100%" method="get"
				autoIncludeParameters="true"
				retrieveRowsCallback="limit"
				rowsDisplayed="20" sortable="true" form="bdMonthCalcHisListTableForm" footer="${footTotalVar}">
			<ec:exportXls fileName="bmMonthCalcHis.xls"></ec:exportXls>
			<ec:row>
				<win:power powerCode="viewBdMonthCalcHis">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="viewBdMonthCalcHis.jhtml?strAction=viewBdMonthCalcHis&id=${bdMonthCalcHisVar.id}" name="view"><fmt:message key="button.view"/></a>
					</ec:column>
				</win:power>
				<ec:column property="company_code" title="bdReconsumMoneyReport.company" />
				<ec:column property="w_month" title="bdPeriod.wmonth" />
				<ec:column property="member_no" title="miMember.memberNo" />
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="card_type" title="mi.cardType">
					<win:code listCode="member.card.type" value="${bdMonthCalcHisVar.card_type }"/>
				</ec:column>
				<ec:column property="bonus_manager" title="bd.reconsume.bonus" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.bonus_manager * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_w_share" title="bdBonusReport.sellBonus" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.bonus_w_share * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_divdend" title="bdBonusReport.bonusDivdend" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.bonus_divdend * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<ec:column property="bonus_all" title="lang.should.be.sent" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.bonus_all * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<ec:column property="fee_service" title="lang.plat.mgr.fee" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.fee_service * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<ec:column property="deduct_re_sell" title="lang.sudeki.bonus" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.deduct_re_sell * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>

				<ec:column property="send_money" title="bd.reality.send" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.send_money * bdMonthCalcHisVar.exchange_rate}</fmt:formatNumber>
				</ec:column>
				<%-- <ec:column property="sendMoney" title="bdMonthCalcHis.sendMoney" />
				<ec:column property="sendStatus" title="bdMonthCalcHis.sendStatus" /> --%>
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
    function validateSearch(theForm) {
        <c:if test="${param.strAction=='listBdMonthCalcHissComm' }">
        if(theForm.memberNo.value=="" && theForm.userName.value==""){
            alert("<fmt:message key='p.inputNoOrNameToQuery' />");//请输入会员编号或者姓名进行查询
            return false;
        }
        </c:if>
        showLoading();
        return true;
    }

    function multiDeleteBdMonthCalcHis(){
        var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
        if(!selectedValues){
            alert("<fmt:message key='info.select.need.delete.items'/>.");
            return;
        }
        if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
            return;
        }
        var theForm=document.bdMonthCalcHisFunctionForm;
        theForm.selectedIds.value=selectedValues;
        theForm.strAction.value="multiDeleteBdMonthCalcHis";

        showLoading();
        theForm.submit();
    }
</script>