<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>会员荣衔实时查询</title>
    <meta name="heading" content="会员荣衔实时查询"/>
</head>

<div class="searchBar">
	<form method="get" action="bdAwardsRealTime.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="bdAwardsRealTime"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="bdAwardsLogFunctionForm" id="bdAwardsLogFunctionForm" action="editBdAwardsLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
	</form>
	
	<form id="bdAwardsLogListTableForm" method="get" >
		<ec:table 
			tableId="bdAwardsLogListTable"
			items="realTimeDatas"
			var="bdAwardsLogVar"
			action="bdAwardsRealTime.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdAwardsLogListTableForm" showPagination="false">
			<ec:row>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="pre_pv" title="个人累积荣衔积分">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.pre_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="group_pv" title="团队积分">
					<fmt:formatNumber pattern="###,##0.00">${bdAwardsLogVar.group_pv }</fmt:formatNumber>
				</ec:column>
				<ec:column property="new_num" title="荣衔">
					<win:code listCode="member_awards" value="${bdAwardsLogVar.new_num }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdAwardsLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdAwardsLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdAwardsLog";
	
	showLoading();
	theForm.submit();
}
</script>