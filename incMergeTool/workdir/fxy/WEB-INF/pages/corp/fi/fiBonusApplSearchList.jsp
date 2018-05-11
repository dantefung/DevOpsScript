<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>收益领取申请查询</title>
    <meta name="heading" content="收益领取申请查询"/>
</head>

<div class="searchBar">
	<form action="fiBonusApplsSearch.jhtml" method="get" name="fiBonusApplSearchSearchForm" id="fiBonusApplSearchSearchForm" onsubmit="return validateSearch(this)">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="operation.button.search"/></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusApplsSearch"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="fiBonusApplListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusApplListTable"
			items="fiBonusAppls"
			var="fiBonusApplVar"
			action="fiBonusApplsSearch.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm">
			<ec:row>
				<ec:column property="bonus_type" 	title="收益类型" styleClass="centerColumn" width="100">
					<win:code listCode="bonus.type" value="${fiBonusApplVar.bonus_type }"/>
				</ec:column>
	   			<ec:column property="user_code" 	title="用户编号" />
	   			<ec:column property="b_name" 		title="银行户名" />
	   			<ec:column property="b_num" 		title="开户银行" />
	   			<ec:column property="open_bank" 	title="银行账号" />
	   			<ec:column property="amount" 		title="申请金额" />
	   			<ec:column property="fees" 		title="手续费" />
	   			<ec:column property="send_amt" 		title="实发金额" />
	   			<ec:column property="create_time" 	title="申请时间" />
	   			<ec:column property="status" 		title="申请状态" >
	   				<win:code listCode="fibonusappl.status" value="${fiBonusApplVar.status}"/>
	   			</ec:column>
	   			<ec:column property="oper_no" 		title="发放计划编号" />
	   			<ec:column property="false_reason" 	title="失败原因" />
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
