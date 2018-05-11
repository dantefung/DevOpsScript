<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>会员荣衔记录查询</title>
    <meta name="heading" content="会员荣衔记录查询"/>
</head>

<div class="searchBar">
	<form method="get" action="bdWeekAwardHiss.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>周期</dt>
			<dd>
				<input type="text" name="wweek" value="${param.wweek }" />
			</dd>
		</dl>
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
				<input type="hidden" name="strAction" value="listBdWeekAwardHiss"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<%@ include file="/common/messages.jsp" %>

	<form id="bdWeekAwardHisListTableForm" method="get" >
		<ec:table 
			tableId="bdWeekAwardHisListTable"
			items="bdWeekAwardHiss"
			var="bdWeekAwardHisVar"
			action="bdWeekAwardHiss.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdWeekAwardHisListTableForm">
			<ec:row>
				<ec:column property="w_week" title="周期" />
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="card_type" title="bdCalculatingSubDetail.cardType">
					<win:code listCode="member.card.type" value="${bdWeekAwardHisVar.card_type }"/>
				</ec:column>
				<ec:column property="star" title="荣衔">
					<win:code listCode="member_awards" value="${bdWeekAwardHisVar.star }"/>
				</ec:column>
				<ec:column property="next_star" title="下周荣衔">
					<win:code listCode="member_awards" value="${bdWeekAwardHisVar.next_star }"/>
				</ec:column>
				<ec:column property="per_sell" title="本周个人消费" />
				<ec:column property="ac_per_sell" title="累积个人消费" />
				<ec:column property="group_sell" title="本周部门消费" />
				<ec:column property="ac_group_sell" title="累积部门消费" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdWeekAwardHis(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdWeekAwardHisFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdWeekAwardHis";
	
	showLoading();
	theForm.submit();
}
</script>