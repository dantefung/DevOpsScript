<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看日结奖金明细"/></title>
    <meta name="heading" content="<fmt:message key="查看日结奖金明细"/>"/>
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
    <form:form commandName="bdDailyCalc" method="post" id="bdDailyCalcForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="6" class="title">个人结算信息<!--视情况可以删除--></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="结算日期"/></th>
    		<th><fmt:message key="会员编号"/></th>
    		<th><fmt:message key="姓名"/></th>
    		<th><fmt:message key="级别"/></th>
    		<th><fmt:message key="推荐人"/></th>
    		<th><fmt:message key="接点人"/></th>
    	</tr>
    	<tr>
    		<td><fmt:formatDate value="${bdDailyCalc.wday }" pattern="yyyy-MM-dd"/></td>
    		<td>${bdDailyCalc.memberNo }</td>
    		<td>${bdDailyCalc.lastName }</td>
    		<td><win:code listCode="member.card.type" value="${bdDailyCalc.cardType }"/></td>
    		<td>
    			<c:if test="${empty recommendMiMember }">-</c:if>
    			<c:if test="${not empty recommendMiMember }">${recommendMiMember.memberNo } - ${recommendMiMember.lastName }</c:if>
    		</td>
    		<td>
    			<c:if test="${empty linkMiMember }">-</c:if>
    			<c:if test="${not empty linkMiMember }">${linkMiMember.memberNo } - ${linkMiMember.lastName }</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>组织业绩pv</th>
    		<th>达标布局奖资格</th>
    		<th>管理奖资格</th>
    		<th>左区待层碰业绩</th>
    		<th>右区待层碰业绩</th>
    		<th></th>
    	</tr>
    	<tr>
    		<td align="right">${bdDailyCalc.groupSell }</td>
    		<td align="center"><win:code listCode="yesno" value="${bdDailyCalc.pass }"/></td>
    		<td align="center"><win:code listCode="yesno" value="${bdDailyCalc.ktPass }"/></td>
    		<td>${bdDailyCalc.keepCppv }</td>
    		<td>${bdDailyCalc.keepCppv2 }</td>
    		<td></td>
    	</tr>
    	<tr>
    		<th>推广奖</th>
    		<th>布局奖</th>
    		<th>销售奖</th>
    		<th>管理奖</th>
			<th>报单费</th>
    		<th>合计应发</th>

    	</tr>
    	<tr>
    		<td align="right">${bdDailyCalc.bonusHelp }</td>
    		<td align="right">${bdDailyCalc.bonusCp }</td>
    		<td align="right">${bdDailyCalc.bonusSell }</td>
    		<td align="right">${bdDailyCalc.bonusManager }</td>
			<td align="right">${bdDailyCalc.billFee }</td>
    		<td align="right"><fmt:formatNumber pattern="###,##0.00">${bdDailyCalc.bonusAll}</fmt:formatNumber></td>
    	</tr>
    	<tr>
    		<th>维护费</th>
    		<th>责任消费金</th>
    		<th>实发</th>
    		<th colspan="3"></th>
    	</tr>
    	<tr>
    		<td align="right">${bdDailyCalc.feeService }</td>
    		<td align="right">${bdDailyCalc.deductReSell }</td>
    		<td align="right"><fmt:formatNumber pattern="###,##0.00">${bdDailyCalc.sendMoney}</fmt:formatNumber></td>
    		<td colspan="3"></td>
    	</tr>

		<tr>
    		<td colspan="6" class="title">组织业绩统计</td>
    	</tr>
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="linkListTable"
					items="childBdDailyCalcs"
					var="childBdDailyCalcVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="member_no" title="会员编号"/>
						<ec:column property="last_name" title="会员姓名"/>
						<ec:column property="last_bl_group_pv" title="上日保留业绩" styleClass="numberColumn"/>
						<ec:column property="group_sell" title="当日新增组织业绩" styleClass="numberColumn" />
						<ec:column property="group_sell_dp" title="量碰业绩" styleClass="numberColumn" />
						<ec:column property="bl_group_pv" title="剩余业绩" styleClass="numberColumn"/>
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
					tableId="w01ListTable"
					items="w01BdBonusSubDetails"
					var="w01BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w01BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="贡献来源" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w01BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<%-- <ec:column property="bonus_point" title="比例" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.##">${w01BdBonusSubVar.bonus_point}</fmt:formatNumber>%
						</ec:column> --%>
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="6" class="title">推广奖来源</td>
    	</tr>
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="w02ListTable"
					items="w02BdBonusSubDetails"
					var="w02BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="recommend_code" title="miMember.memberNo"/>
						<%-- <ec:column property="last_name" title="会员姓名" /> --%>
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w02BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="贡献来源" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w02BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.##">${w02BdBonusSubVar.bonus_point}</fmt:formatNumber>%
						</ec:column>
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="6" class="title">管理奖来源</td>
    	</tr>
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="w03ListTable"
					items="w03BdBonusSubDetails"
					var="w03BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="recommend_code" title="miMember.memberNo"/>
						<%-- <ec:column property="last_name" title="会员姓名" /> --%>
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w03BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="贡献来源" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w03BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.##">${w03BdBonusSubVar.bonus_point}</fmt:formatNumber>%
						</ec:column>
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="6" class="title">布局奖来源</td>
    	</tr>
    	<tr>
    		<td colspan="6">
    			<ec:table 
					tableId="w05ListTable"
					items="w05BdBonusSubDetails"
					var="w05BdBonusSubVar"
					action="bdDailyCalcs.jhtml"
					width="100%" method="get"
					autoIncludeParameters="false"
					retrieveRowsCallback="limit"
					rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="recommend_code" title="miMember.memberNo"/>
						<%-- <ec:column property="last_name" title="会员姓名" /> --%>
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w05BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="贡献来源" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w05BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.##">${w05BdBonusSubVar.bonus_point}</fmt:formatNumber>%
						</ec:column>
						<ec:column property="algebras" title="代数" styleClass="numberColumn" />
						<%-- <ec:column property="sendMoney" title="应发奖金" />
						<ec:column property="sendStatus" title="是否发放" /> --%>
					</ec:row>
				</ec:table>
    		</td>
    	</tr>

		<tr>
			<td colspan="6" class="title">报单费来源</td>
		</tr>
		<tr>
			<td colspan="6">
				<ec:table
						tableId="w11ListTable"
						items="w11BdBonusSubDetails"
						var="w11BdBonusSubVar"
						action="bdDailyCalcs.jhtml"
						width="100%" method="get"
						autoIncludeParameters="false"
						retrieveRowsCallback="limit"
						rowsDisplayed="0" sortable="false" form="bdDailyCalcForm" showPagination="false" showStatusBar="false">
					<ec:row highlightRow="false">
						<ec:column property="s_member" title="miMember.memberNo"/>
						<%-- <ec:column property="last_name" title="会员姓名" /> --%>
						<ec:column property="money" title="奖金" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w11BdBonusSubVar.money * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="pv" title="贡献来源" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.00">${w11BdBonusSubVar.pv * outRate }</fmt:formatNumber>
						</ec:column>
						<ec:column property="bonus_point" title="比例" styleClass="numberColumn">
							<fmt:formatNumber pattern="###,##0.##">${w11BdBonusSubVar.bonus_point}</fmt:formatNumber>%
						</ec:column>
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
    				<button type="button" name="return" onclick="window.location='bdDailyCalcs.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>