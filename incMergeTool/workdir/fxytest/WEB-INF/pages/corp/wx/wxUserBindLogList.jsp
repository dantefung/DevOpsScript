<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxUserBindLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="wxUserBindLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="wxUserBindLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxUserBindLogs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxUserBindLogFunctionForm" id="wxUserBindLogFunctionForm" action="editWxUserBindLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxUserBindLog">
				<a href="editWxUserBindLog.jhtml?strAction=addWxUserBindLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteWxUserBindLog">
				<a href="javascript:multiDeleteWxUserBindLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxUserBindLogListTableForm" method="get" >
		<ec:table 
			tableId="wxUserBindLogListTable"
			items="wxUserBindLogs"
			var="wxUserBindLogVar"
			action="wxUserBindLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxUserBindLogListTableForm">
			<ec:row>
				<ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${wxUserBindLogVar.logId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxUserBindLog">
						<a href="editWxUserBindLog.jhtml?strAction=editWxUserBindLog&logId=${wxUserBindLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxUserBindLog">
						<a href="viewWxUserBindLog.jhtml?strAction=viewWxUserBindLog&logId=${wxUserBindLogVar.logId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="logId" title="wxUserBindLog.logId" />
				<ec:column property="wxOpenid" title="wxUserBindLog.wxOpenid" />
				<ec:column property="oldUserCode" title="wxUserBindLog.oldUserCode" />
				<ec:column property="newUserCode" title="wxUserBindLog.newUserCode" />
				<ec:column property="changeTime" title="wxUserBindLog.changeTime" />
				<ec:column property="changeType" title="wxUserBindLog.changeType" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxUserBindLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxUserBindLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxUserBindLog";
	
	showLoading();
	theForm.submit();
}
</script>