<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdWeekAwardList.title"/></title>
    <meta name="heading" content="<fmt:message key="bdWeekAwardList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdWeekAwards.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listBdWeekAwards"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="bdWeekAwardFunctionForm" id="bdWeekAwardFunctionForm" action="editBdWeekAward.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdWeekAward">
				<a href="editBdWeekAward.jhtml?strAction=addBdWeekAward" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdWeekAward">
				<a href="javascript:multiDeleteBdWeekAward()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdWeekAwardListTableForm" method="get" >
		<ec:table 
			tableId="bdWeekAwardListTable"
			items="bdWeekAwards"
			var="bdWeekAwardVar"
			action="bdWeekAwards.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdWeekAwardListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${bdWeekAwardVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewBdWeekAward">
						<a href="viewBdWeekAward.jhtml?strAction=viewBdWeekAward&id=${bdWeekAwardVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editBdWeekAward">
						<a href="editBdWeekAward.jhtml?strAction=editBdWeekAward&id=${bdWeekAwardVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="id" title="bdWeekAward.id" />
				<ec:column property="memberNo" title="bdWeekAward.memberNo" />
				<ec:column property="companyCode" title="bdWeekAward.companyCode" />
				<ec:column property="recommendNo" title="bdWeekAward.recommendNo" />
				<ec:column property="exitTime" title="bdWeekAward.exitTime" />
				<ec:column property="perSell" title="bdWeekAward.perSell" />
				<ec:column property="groupSell" title="bdWeekAward.groupSell" />
				<ec:column property="isRoot" title="bdWeekAward.isRoot" />
				<ec:column property="pass" title="bdWeekAward.pass" />
				<ec:column property="firstName" title="bdWeekAward.firstName" />
				<ec:column property="lastName" title="bdWeekAward.lastName" />
				<ec:column property="marketName" title="bdWeekAward.marketName" />
				<ec:column property="cardType" title="bdWeekAward.cardType" />
				<ec:column property="recommandLayer" title="bdWeekAward.recommandLayer" />
				<ec:column property="petName" title="bdWeekAward.petName" />
				<ec:column property="acGroupSell" title="bdWeekAward.acGroupSell" />
				<ec:column property="linkNo" title="bdWeekAward.linkNo" />
				<ec:column property="wweek" title="bdWeekAward.wweek" />
				<ec:column property="star" title="bdWeekAward.star" />
				<ec:column property="nextStar" title="bdWeekAward.nextStar" />
				<ec:column property="activeStatus" title="bdWeekAward.activeStatus" />
				<ec:column property="acPerSell" title="bdWeekAward.acPerSell" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdWeekAward(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdWeekAwardFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteBdWeekAward";
	
	showLoading();
	theForm.submit();
}
</script>