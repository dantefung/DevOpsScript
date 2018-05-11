<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="汽车奖励名单"/></title>
    <meta name="heading" content="<fmt:message key="汽车奖励名单"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdPromCards.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>
	
	<form id="bdMonthCalcHisListTableForm" method="get" >
		<ec:table 
			tableId="bdMonthCalcHisListTable"
			items="bdMonthCalcHiss"
			var="bdMonthCalcHisVar"
			action="bdPromCards.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdMonthCalcHisListTableForm">
			<ec:row>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="card_type" title="会员级别">
					<win:code listCode="member.card.type" value="${bdMonthCalcHisVar.card_type }"/>
				</ec:column>
				<ec:column property="bonus_money" title="收益金额" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0.00">${bdMonthCalcHisVar.bonus_money}</fmt:formatNumber>
				</ec:column>
				<ec:column property="create_date" title="达到日期" />
				<ec:column property="num_level1" title="第一层人数" styleClass="numberColumn" />
				<ec:column property="num_level2" title="第二层人数" styleClass="numberColumn" />
				<ec:column property="num_level3" title="第三层人数" styleClass="numberColumn" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	<c:if test="${param.strAction=='listBdMonthCalcHissComm' }">
	if(theForm.memberNo.value=="" && theForm.userName.value==""){
		alert("请输入会员编号或者姓名进行查询");
		return false;
	}
	</c:if>
	showLoading();
	return true;
}

</script>