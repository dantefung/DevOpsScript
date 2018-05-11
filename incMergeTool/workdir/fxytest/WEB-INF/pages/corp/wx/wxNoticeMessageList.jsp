<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxNoticeMessageList.title"/></title>
    <meta name="heading" content="<fmt:message key="wxNoticeMessageList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="wxNoticeMessages.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxNoticeMessages"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxNoticeMessageFunctionForm" id="wxNoticeMessageFunctionForm" action="editWxNoticeMessage.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxNoticeMessage">
				<a href="editWxNoticeMessage.jhtml?strAction=addWxNoticeMessage" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteWxNoticeMessage">
				<a href="javascript:multiDeleteWxNoticeMessage()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedMsgIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxNoticeMessageListTableForm" method="get" >
		<ec:table 
			tableId="wxNoticeMessageListTable"
			items="wxNoticeMessages"
			var="wxNoticeMessageVar"
			action="wxNoticeMessages.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxNoticeMessageListTableForm">
			<ec:row>
				<ec:column alias="chkMsgId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkMsgId" value="${wxNoticeMessageVar.msgId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxNoticeMessage">
						<a href="editWxNoticeMessage.jhtml?strAction=editWxNoticeMessage&msgId=${wxNoticeMessageVar.msgId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxNoticeMessage">
						<a href="viewWxNoticeMessage.jhtml?strAction=viewWxNoticeMessage&msgId=${wxNoticeMessageVar.msgId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="msgId" title="wxNoticeMessage.msgId" />
				<ec:column property="wxOpenId" title="wxNoticeMessage.wxOpenId" />
				<ec:column property="msgType" title="wxNoticeMessage.msgType" />
				<ec:column property="msgContent" title="wxNoticeMessage.msgContent" />
				<ec:column property="sendTime" title="wxNoticeMessage.sendTime" />
				<ec:column property="isSend" title="wxNoticeMessage.isSend" />
				<ec:column property="retryTimes" title="wxNoticeMessage.retryTimes" />
				<ec:column property="returnMsgId" title="wxNoticeMessage.returnMsgId" />
				<ec:column property="receiveResult" title="wxNoticeMessage.receiveResult" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxNoticeMessage(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMsgId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxNoticeMessageFunctionForm;
	theForm.selectedMsgIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxNoticeMessage";
	
	showLoading();
	theForm.submit();
}
</script>