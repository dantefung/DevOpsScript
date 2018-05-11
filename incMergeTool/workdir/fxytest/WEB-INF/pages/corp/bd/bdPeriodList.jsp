<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="bdPeriodList.title"/></title>
    <meta name="heading" content="<fmt:message key="bdPeriodList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="bdPeriods.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listBdPeriods"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="bdPeriodFunctionForm" id="bdPeriodFunctionForm" action="editBdPeriod.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdPeriod">
				<a href="editBdPeriod.jhtml?strAction=addBdPeriod" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdPeriod">
				<a href="javascript:multiDeleteBdPeriod()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedWids">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdPeriodListTableForm" method="get" >
		<ec:table 
			tableId="bdPeriodListTable"
			items="bdPeriods"
			var="bdPeriodVar"
			action="bdPeriods.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdPeriodListTableForm">
			<ec:row>
				<ec:column alias="chkWid" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkWid" value="${bdPeriodVar.wid}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewBdPeriod">
						<a href="viewBdPeriod.jhtml?strAction=viewBdPeriod&wid=${bdPeriodVar.wid}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editBdPeriod">
						<a href="editBdPeriod.jhtml?strAction=editBdPeriod&wid=${bdPeriodVar.wid}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="wid" title="bdPeriod.wid" />
				<ec:column property="wyear" title="bdPeriod.wyear" />
				<ec:column property="wmonth" title="bdPeriod.wmonth" />
				<ec:column property="wweek" title="bdPeriod.wweek" />
				<ec:column property="startTime" title="bdPeriod.startTime" />
				<ec:column property="endTime" title="bdPeriod.endTime" />
				<ec:column property="calcStatus" title="bdPeriod.calcStatus" />
				<ec:column property="confirmStatus" title="bdPeriod.confirmStatus" />
				<ec:column property="sendStatus" title="bdPeriod.sendStatus" />
				<ec:column property="calcDate" title="bdPeriod.calcDate" />
				<ec:column property="confirmDate" title="bdPeriod.confirmDate" />
				<ec:column property="sendDate" title="bdPeriod.sendDate" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteBdPeriod(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkWid"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.bdPeriodFunctionForm;
	theForm.selectedWids.value=selectedValues;
	theForm.strAction.value="multiDeleteBdPeriod";
	
	showLoading();
	theForm.submit();
}
</script>