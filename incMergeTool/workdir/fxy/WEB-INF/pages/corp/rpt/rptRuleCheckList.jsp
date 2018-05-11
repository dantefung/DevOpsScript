<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="rptRuleCheckList.title"/></title>
    <meta name="heading" content="<fmt:message key="rptRuleCheckList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="rptRuleChecks.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listRptRuleChecks"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="rptRuleCheckFunctionForm" id="rptRuleCheckFunctionForm" action="editRptRuleCheck.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addRptRuleCheck">
				<a href="editRptRuleCheck.jhtml?strAction=addRptRuleCheck" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteRptRuleCheck">
				<a href="javascript:multiDeleteRptRuleCheck()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedCheckIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="rptRuleCheckListTableForm" method="get" >
		<ec:table 
			tableId="rptRuleCheckListTable"
			items="rptRuleChecks"
			var="rptRuleCheckVar"
			action="rptRuleChecks.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="rptRuleCheckListTableForm">
			<ec:row>
				<ec:column alias="chkCheckId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkCheckId" value="${rptRuleCheckVar.checkId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editRptRuleCheck">
						<a href="editRptRuleCheck.jhtml?strAction=editRptRuleCheck&checkId=${rptRuleCheckVar.checkId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewRptRuleCheck">
						<a href="viewRptRuleCheck.jhtml?strAction=viewRptRuleCheck&checkId=${rptRuleCheckVar.checkId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="checkId" title="rptRuleCheck.checkId" />
				<ec:column property="memberNo" title="rptRuleCheck.memberNo" />
				<ec:column property="c1" title="rptRuleCheck.c1" />
				<ec:column property="c2" title="rptRuleCheck.c2" />
				<ec:column property="c3" title="rptRuleCheck.c3" />
				<ec:column property="c4" title="rptRuleCheck.c4" />
				<ec:column property="c5" title="rptRuleCheck.c5" />
				<ec:column property="c6" title="rptRuleCheck.c6" />
				<ec:column property="c7" title="rptRuleCheck.c7" />
				<ec:column property="c8" title="rptRuleCheck.c8" />
				<ec:column property="c9" title="rptRuleCheck.c9" />
				<ec:column property="c10" title="rptRuleCheck.c10" />
				<ec:column property="c11" title="rptRuleCheck.c11" />
				<ec:column property="c12" title="rptRuleCheck.c12" />
				<ec:column property="c13" title="rptRuleCheck.c13" />
				<ec:column property="c14" title="rptRuleCheck.c14" />
				<ec:column property="c15" title="rptRuleCheck.c15" />
				<ec:column property="c16" title="rptRuleCheck.c16" />
				<ec:column property="c17" title="rptRuleCheck.c17" />
				<ec:column property="c18" title="rptRuleCheck.c18" />
				<ec:column property="c19" title="rptRuleCheck.c19" />
				<ec:column property="c20" title="rptRuleCheck.c20" />
				<ec:column property="c21" title="rptRuleCheck.c21" />
				<ec:column property="c22" title="rptRuleCheck.c22" />
				<ec:column property="c23" title="rptRuleCheck.c23" />
				<ec:column property="c24" title="rptRuleCheck.c24" />
				<ec:column property="c25" title="rptRuleCheck.c25" />
				<ec:column property="c26" title="rptRuleCheck.c26" />
				<ec:column property="c27" title="rptRuleCheck.c27" />
				<ec:column property="c28" title="rptRuleCheck.c28" />
				<ec:column property="c29" title="rptRuleCheck.c29" />
				<ec:column property="c30" title="rptRuleCheck.c30" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteRptRuleCheck(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkCheckId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.rptRuleCheckFunctionForm;
	theForm.selectedCheckIds.value=selectedValues;
	theForm.strAction.value="multiDeleteRptRuleCheck";
	
	showLoading();
	theForm.submit();
}
</script>