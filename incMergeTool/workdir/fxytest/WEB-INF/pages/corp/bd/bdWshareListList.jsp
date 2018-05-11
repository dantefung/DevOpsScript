<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="分红收益查询"/></title>
    <meta name="heading" content="<fmt:message key="分红收益查询"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdWshareLists.jhtml" onsubmit="return validateSearch(this)">
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
				<input type="hidden" name="strAction" value="listBdWshareLists"/>
			</dd>
		</dl>
	</form>
</div>

<c:set var="footTotalVar">
	<tr>
		<td class="footer" align="right" colspan="3">总计：</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.total_per_sell }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
		<td class="footer" style="text-align: right;">
			<b>
				<c:if test="${not empty sumMap}">
					<fmt:formatNumber pattern="###,##0.00">${sumMap.total_bonus }</fmt:formatNumber>
				</c:if>
				<c:if test="${empty sumMap}">
					0.00
				</c:if>
			</b>
		</td>
	</tr>
</c:set>

<div class="contentBody">
	<form name="bdWshareListFunctionForm" id="bdWshareListFunctionForm" action="editBdWshareList.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdWshareList">
				<a href="editBdWshareList.jhtml?strAction=addBdWshareList" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdWshareList">
				<a href="javascript:multiDeleteBdWshareList()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedMemberNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdWshareListListTableForm" method="get" >
		<ec:table 
			tableId="bdWshareListListTable"
			items="bdWshareLists"
			var="bdWshareListVar"
			action="bdWshareLists.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdWshareListListTableForm" footer="${footTotalVar }">
			<ec:exportXls fileName="bdWshares.xls"></ec:exportXls>
			<ec:row>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="share_level" title="等级" styleClass="numberColumn"/>
				<ec:column property="per_sell" title="投资额" styleClass="numberColumn" cell="currency" format="###,##0.00" />
				<ec:column property="bonus" title="已发放分红" styleClass="numberColumn" cell="currency" format="###,##0.00"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdWshareList(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMemberNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdWshareListFunctionForm;
	theForm.selectedMemberNos.value=selectedValues;
	theForm.strAction.value="multiDeleteBdWshareList";
	
	showLoading();
	theForm.submit();
}
</script>