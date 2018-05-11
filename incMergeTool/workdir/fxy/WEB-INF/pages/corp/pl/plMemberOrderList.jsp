<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="会员资料达标查询"/></title>
    <meta name="heading" content="<fmt:message key="会员资料达标查询"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="plMemberOrders.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt>是否报单中心</dt>
			<dd>
				<win:list name="isAgent" listCode="yesno" defaultValue="" value="${param.isAgent }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt>
				达标日期
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>当前是否达标</dt>
			<dd>
				<win:list name="status" listCode="yesno" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt>曾经是否达标</dt>
			<dd>
				<win:list name="hasPass" listCode="yesno" defaultValue="" value="${param.hasPass }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listPlMemberOrders"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="plMemberOrderListTableForm" method="get" >
		<ec:table 
			tableId="plMemberOrderListTable"
			items="plMemberOrders"
			var="plMemberOrderVar"
			action="plMemberOrders.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="plMemberOrderListTableForm">
			<ec:exportXls fileName="plMemberOrder.xls"/>
			<ec:row>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="isAgent" title="报单中心" styleClass="centerColumn">
					<win:code listCode="yesno" value="${plMemberOrderVar.is_agent }"/>
				</ec:column>
				<%-- <ec:column property="poPv" title="plMemberOrder.poPv" />
				<ec:column property="poAmt" title="plMemberOrder.poAmt" />
				<ec:column property="prPv" title="plMemberOrder.prPv" />
				<ec:column property="prAmt" title="plMemberOrder.prAmt" /> --%>
				<ec:column property="total_pv" title="累积消费PV" styleClass="numberColumn"/>
				<ec:column property="group_pv" title="推荐团队业绩PV" styleClass="numberColumn" />
				<%-- <ec:column property="avaluePv" title="plMemberOrder.avaluePv" /> --%>
				<ec:column property="Status" title="当前是否达标" styleClass="centerColumn">
					<win:code listCode="yesno" value="${plMemberOrderVar.status }"/>
				</ec:column>
				<ec:column property="hasPass" title="曾经是否达标" styleClass="centerColumn">
					<win:code listCode="yesno" value="${plMemberOrderVar.has_pass }"/>
				</ec:column>
				<ec:column property="pass_time2" title="达标时间"/>
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
</script>