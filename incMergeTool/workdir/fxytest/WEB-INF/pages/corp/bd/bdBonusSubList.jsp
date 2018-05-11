<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="rt.award.search"/></title>
    <meta name="heading" content="<fmt:message key="rt.award.search"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdBonusSubs.jhtml?needReload=1" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="miMember.memberNo"/></dd>
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="bdCalculatingSubDetail.bounsType"/></dd>
			<dd>
				<win:list name="bonusType" listCode="bdbonussub.bonustype" defaultValue="" value="${param.bonusType }" showBlankLine="true"></win:list>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="produce.date.interval"/></dd>
			<dd>
				<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime }" size="14" class="readonly" readonly/>
				-
				<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime }" size="14" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dd>状态</dd>
			<dd>
				<win:list name="status" listCode="bonus_sub_status" defaultValue="" value="${param.status }" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listBdBonusSubs"/>
			</dd>
		</dl>
	
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="8"><fmt:message key="poOrder.amtCount"/>：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<fmt:formatNumber pattern="###,##0.00">${bdBonusSubSum.sum_send_money }</fmt:formatNumber>
			</b>
		</td>
		<td class="footer" align="right" colspan="5"></td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="bdBonusSubFunctionForm" id="bdBonusSubFunctionForm" action="editBdBonusSub.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdBonusSub">
				<a href="editBdBonusSub.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdBonusSub">
				<a href="javascript:multiDeleteBdBonusSub()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdBonusSubListTableForm" method="get" >
		<ec:table 
			tableId="bdBonusSubListTable"
			items="bdBonusSubs"
			var="bdBonusSubVar"
			action="bdBonusSubs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdBonusSubListTableForm" footer="${footTotalVar }">
			<ec:row>
				<ec:column property="w_month" title="printReturnList.month" />
				<ec:column property="w_week" title="周" />
				<ec:column property="w_day" title="日期">
					${fn:substring(bdBonusSubVar.w_day,0,10) }
				</ec:column>
				<ec:column property="member_no" title="miMember.memberNo" />
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="bonus_type" title="bdCalculatingSubDetail.bounsType" >
					<win:code listCode="bdbonussub.bonustype" value="${bdBonusSubVar.bonus_type }"></win:code>
				</ec:column>
				<ec:column property="bonus_pv" title="奖金" styleClass="numberColumn">
					<fmt:formatNumber value="${bdBonusSubVar.bonus_pv}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="fd_money" title="需封顶奖金" styleClass="numberColumn">
					<fmt:formatNumber value="${bdBonusSubVar.fd_money}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="send_money" title="实得奖金" styleClass="numberColumn">
					<fmt:formatNumber value="${bdBonusSubVar.send_money}" type="number" pattern="###,###,##0.00"/>
				</ec:column>
				<ec:column property="notes" title="poSell.notes" />
				<ec:column property="create_time" title="产生时间" />
				<ec:column property="status" title="状态" styleClass="centerColumn">
					<win:code listCode="bonus_sub_status" value="${bdBonusSubVar.status }"/>
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdBonusSub(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdBonusSubFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdBonusSub";
	
	showLoading();
	theForm.submit();
}

$(function() {
	$( "#startCreateTime,#endCreateTime" ).datepicker();
});
</script>