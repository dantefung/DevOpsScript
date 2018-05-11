<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxSponsorLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="wxSponsorLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="wxSponsorLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxSponsorLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxSponsorLogFunctionForm" id="wxSponsorLogFunctionForm" action="editWxSponsorLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxSponsorLog">
				<a href="editWxSponsorLog.jhtml?strAction=addWxSponsorLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteWxSponsorLog">
				<a href="javascript:multiDeleteWxSponsorLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxSponsorLogListTableForm" method="get" >
		<ec:table 
			tableId="wxSponsorLogListTable"
			items="wxSponsorLogs"
			var="wxSponsorLogVar"
			action="wxSponsorLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxSponsorLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${wxSponsorLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxSponsorLog">
						<a href="editWxSponsorLog.jhtml?strAction=editWxSponsorLog&logId=${wxSponsorLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxSponsorLog">
						<a href="viewWxSponsorLog.jhtml?strAction=viewWxSponsorLog&logId=${wxSponsorLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="logId" title="wxSponsorLog.logId" />
				<ec:column property="wxOpenid" title="wxSponsorLog.wxOpenid" />
				<ec:column property="oldSponsorId" title="wxSponsorLog.oldSponsorId" />
				<ec:column property="newSponsorId" title="wxSponsorLog.newSponsorId" />
				<ec:column property="changeTime" title="wxSponsorLog.changeTime" />
				<ec:column property="sourceUrl" title="wxSponsorLog.sourceUrl" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxSponsorLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxSponsorLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxSponsorLog";
	
	showLoading();
	theForm.submit();
}
</script>