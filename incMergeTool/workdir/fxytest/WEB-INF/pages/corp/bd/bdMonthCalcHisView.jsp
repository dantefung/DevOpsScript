<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看月结奖金明细"/></title>
    <meta name="heading" content="<fmt:message key="查看月结奖金明细"/>"/>
</head>

<style>
table.detail th{
	text-align: center;
	background-color: #F0F0F0;
	border: 1px solid #fff;
}
table.detail td{
}
</style>

<div class="contentBody">
    <form:form commandName="bdMonthCalcHis" method="post" id="bdMonthCalcHisForm" name="bdMonthCalcHisForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="6" class="title">个人结算信息<!--视情况可以删除--></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="工作月"/></th>
    		<th><fmt:message key="会员编号"/></th>
    		<th><fmt:message key="姓名"/></th>
    		<th><fmt:message key="会员级别"/></th>
    		<th colspan="2"></th>
    	</tr>
    	<tr>
    		<td>${bdMonthCalcHis.wmonth }</td>
    		<td>${bdMonthCalcHis.memberNo }</td>
    		<td>${bdMonthCalcHis.lastName }</td>
    		<td><win:code listCode="member.card.type" value="${bdMonthCalcHis.cardType }"/></td>
    		<td colspan="2"></td>
    	</tr>
    	<tr>
    		<th>个人业绩</th>
    		<th>组织业绩</th>
    		<th>返单业绩</th>
			<th colspan="3"></th>
		</tr>
		<tr>
			<td align="right">
				<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.perSell}</fmt:formatNumber>
			</td>
			<td align="right">
				<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.groupSell}</fmt:formatNumber>
			</td>
			<td align="right">
				<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.perResellPv}</fmt:formatNumber>
			</td>
		</tr>
		<tr>
    		<th>重消奖</th>
    		<th>销售奖</th>
    		<th>全球分红奖</th>
    		<th>应发奖金</th>
			<th colspan="2"></th>
    	</tr>
    	<tr>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusManager}</fmt:formatNumber>
    		</td>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusWshare}</fmt:formatNumber>
    		</td>
			<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusDivend}</fmt:formatNumber>
    		</td>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.bonusAll}</fmt:formatNumber>
    		</td>
    	</tr>
    	
    	<tr>
    		<th>平台管理费</th>
    		<th>精彩金</th>
    		<th>实发奖金</th>
    		<th colspan="3"></th>
    	</tr>
    	<tr>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.feeService}</fmt:formatNumber>
    		</td>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.deductReSell}</fmt:formatNumber>
    		</td>
    		<td align="right">
    			<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHis.sendMoney}</fmt:formatNumber>
    		</td>
    		<td colspan="3"></td>
    	</tr>
    	
    	<tr>
    		<td colspan="6" class="title">重消奖来源</td>
    	</tr>
    	
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="m01ListTable"
					items="m01BdBonusSubDetails"
					var="m01BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdMonthCalcHisForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="recommend_code" title="会员" />
						<ec:column property="money" title="奖金" styleClass="numberColumn" >
							<fmt:formatNumber pattern="###,##0.00">${m01BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="busi.pv" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${m01BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn" />
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="6" class="title">销售奖来源</td>
    	</tr>
    	
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="m02ListTable"
					items="m02BdBonusSubDetails"
					var="m02BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdMonthCalcHisForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="recommend_code" title="会员" />
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${m02BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="busi.pv" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${m02BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn" />
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	
    	<tr>
    		<td colspan="6">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="history.back()"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>