<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>邮件队列</title>
    <meta name="heading" content="邮件队列"/>
</head>

<div class="searchBar">
	<form method="get" action="sysMailQueues.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="sysDataLog.changeType"/></dt>
			<dd><win:list name="mailTypeId" listCode="email_type" value="${param.mailTypeId}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>接收人编号</dt>
			<dd><input type="text" name="toUserCode" value="${param.toUserCode }" size="14"/></dd>
		</dl>
		<dl>
			<dt>接收邮箱</dt>
			<dd><input type="text" name="toEmail" value="${param.toEmail }"/></dd>
		</dl>
		<dl>
			<dt>是否发送</dt>
			<dd><win:list name="isSent" listCode="yesno" defaultValue="" value="${param.isSent }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>创建时间</dt>
			<dd><input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/> - <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysMailQueues"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysMailQueueFunctionForm" id="sysMailQueueFunctionForm" action="editSysMailQueue.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>

		<input type="hidden" name="selectedQueueIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysMailQueueListTableForm" method="get" >
		<ec:table 
			tableId="sysMailQueueListTable"
			items="sysMailQueues"
			var="sysMailQueueVar"
			action="sysMailQueues.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysMailQueueListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editSysMailQueue">
						<a href="editSysMailQueue.jhtml?strAction=editSysMailQueue&queueId=${sysMailQueueVar.queueId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewSysMailQueue">
						<a href="viewSysMailQueue.jhtml?strAction=viewSysMailQueue&rcptId=${sysMailQueueVar.rcpt_id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				<ec:column property="company_code" title="公司" styleClass="centerColumn"/>
				<ec:column property="mail_type_id" title="sysDataLog.changeType">
					<win:code listCode="email_type" value="${sysMailQueueVar.mail_type_id}"/>
				</ec:column>
				<ec:column property="from_email" title="sysMailQueue.fromEmail" />
				<ec:column property="from_name" title="sysMailQueue.fromName" />
				<ec:column property="mail_title" title="邮件标题" />
				<ec:column property="create_time" title="创建时间">
					${sysMailQueueVar.creator_code } - ${sysMailQueueVar.create_time}
				</ec:column>
				<ec:column property="to_user_code" title="接收人">
					${sysMailQueueVar.to_user_code } - ${sysMailQueueVar.to_name}
				</ec:column>
				<ec:column property="to_email" title="接收邮箱" />
				<ec:column property="is_sent" title="是否发送" styleClass="centerColumn">
					<win:code listCode="yesno" value="${sysMailQueueVar.is_sent}"/>
				</ec:column>
				<ec:column property="sent_date" title="发送时间" styleClass="centerColumn"/>
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

function multiDeleteSysMailQueue(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkQueueId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysMailQueueFunctionForm;
	theForm.selectedQueueIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysMailQueue";
	
	showLoading();
	theForm.submit();
}
</script>