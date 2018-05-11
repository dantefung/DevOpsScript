<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>会员荣衔操作记录</title>
    <meta name="heading" content="会员荣衔操作记录"/>
</head>

<div class="searchBar">
	<form method="get" action="bdAwardsLogs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt>
				创建时间
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>操作内容</dt>
			<dd>
				<input type="text" name="content" value="${param.content }" />
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listBdAwardsLogs"/>
			</dd>
		</dl>
	</form>
</div>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
	<form name="bdAwardsLogFunctionForm" id="bdAwardsLogFunctionForm" action="editBdAwardsLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addBdAwardsLog">
				<a href="editBdAwardsLog.jhtml?strAction=addBdAwardsLog" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteBdAwardsLog">
				<a href="javascript:multiDeleteBdAwardsLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="bdAwardsLogListTableForm" method="get" >
		<ec:table 
			tableId="bdAwardsLogListTable"
			items="bdAwardsLogs"
			var="bdAwardsLogVar"
			action="bdAwardsLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="bdAwardsLogListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editBdAwardsLog">
						<a href="editBdAwardsLog.jhtml?strAction=editBdAwardsLog&logId=${bdAwardsLogVar.log_id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="content" title="操作内容">
					${fn:replace(bdAwardsLogVar.content, vEnter, '<br>')}
				</ec:column>
				<ec:column property="create_time" title="操作时间">
					${bdAwardsLogVar.creator} - ${bdAwardsLogVar.create_time}
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