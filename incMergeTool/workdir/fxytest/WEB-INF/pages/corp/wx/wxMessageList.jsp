<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="wxMessageList.title"/></title>
    <meta name="heading" content="<fmt:message key="wxMessageList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="wxMessages.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxMessages"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxMessageFunctionForm" id="wxMessageFunctionForm" action="editWxMessage.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxMessage">
				<a href="editWxMessage.jhtml?strAction=addWxMessage" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteWxMessage">
				<a href="javascript:multiDeleteWxMessage()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedMessageIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxMessageListTableForm" method="get" >
		<ec:table 
			tableId="wxMessageListTable"
			items="wxMessages"
			var="wxMessageVar"
			action="wxMessages.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxMessageListTableForm">
			<ec:row>
				<ec:column alias="chkMessageId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkMessageId" value="${wxMessageVar.messageId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxMessage">
						<a href="editWxMessage.jhtml?strAction=editWxMessage&messageId=${wxMessageVar.messageId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxMessage">
						<a href="viewWxMessage.jhtml?strAction=viewWxMessage&messageId=${wxMessageVar.messageId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="messageId" title="wxMessage.messageId" />
				<ec:column property="userCode" title="wxMessage.userCode" />
				<ec:column property="messageType" title="wxMessage.messageType" />
				<ec:column property="content" title="wxMessage.content" />
				<ec:column property="picurl" title="wxMessage.picurl" />
				<ec:column property="locationX" title="wxMessage.locationX" />
				<ec:column property="locationY" title="wxMessage.locationY" />
				<ec:column property="scale" title="wxMessage.scale" />
				<ec:column property="label" title="wxMessage.label" />
				<ec:column property="localePrecision" title="wxMessage.localePrecision" />
				<ec:column property="title" title="wxMessage.title" />
				<ec:column property="description" title="wxMessage.description" />
				<ec:column property="url" title="wxMessage.url" />
				<ec:column property="event" title="wxMessage.event" />
				<ec:column property="eventkey" title="wxMessage.eventkey" />
				<ec:column property="ticket" title="wxMessage.ticket" />
				<ec:column property="mediaId" title="wxMessage.mediaId" />
				<ec:column property="thumbMediaid" title="wxMessage.thumbMediaid" />
				<ec:column property="msgFormat" title="wxMessage.msgFormat" />
				<ec:column property="recognition" title="wxMessage.recognition" />
				<ec:column property="textMsgId" title="wxMessage.textMsgId" />
				<ec:column property="fromUserName" title="wxMessage.fromUserName" />
				<ec:column property="localUrl" title="wxMessage.localUrl" />
				<ec:column property="responseMsg" title="wxMessage.responseMsg" />
				<ec:column property="addTime" title="wxMessage.addTime" />
				<ec:column property="isCollection" title="wxMessage.isCollection" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxMessage(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMessageId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxMessageFunctionForm;
	theForm.selectedMessageIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxMessage";
	
	showLoading();
	theForm.submit();
}
</script>