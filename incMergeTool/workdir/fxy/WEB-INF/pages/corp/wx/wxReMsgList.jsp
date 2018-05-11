<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>自动回复信息管理</title>
    <meta name="heading" content="自动回复信息管理"/>
</head>

<div class="searchBar">
	<form method="get" action="wxReMsgs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>消息类型</dt>
			<dd><win:list name="msgType" listCode="wx_reply_msg_type" defaultValue="" value="${param.msgType }" showBlankLine="true"/> </dd>
		</dl>
		<dl>
			<dt>关键字</dt>
			<dd><input type="text" name="keyword" value="${param.keyword }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listWxReMsgs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="wxReMsgFunctionForm" id="wxReMsgFunctionForm" action="editWxReMsg.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxReMsg">
				<a href="editWxReMsg.jhtml?strAction=addWxReMsg" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedMsgIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxReMsgListTableForm" method="get" >
		<ec:table 
			tableId="wxReMsgListTable"
			items="wxReMsgs"
			var="wxReMsgVar"
			action="wxReMsgs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxReMsgListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxReMsg">
						<a href="editWxReMsg.jhtml?strAction=editWxReMsg&msgId=${wxReMsgVar.msgId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewWxReMsg">
						<a href="viewWxReMsg.jhtml?strAction=viewWxReMsg&msgId=${wxReMsgVar.msgId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="msgType" title="消息类型">
					<win:code listCode="wx_reply_msg_type" value="${wxReMsgVar.msgType }"/>
				</ec:column>
				<ec:column property="interDesc" title="内部说明" />
				<ec:column property="creatorCode" title="创建人" />
				<ec:column property="createTime" title="创建时间" />
				<ec:column property="editorCode" title="最后编辑人" />
				<ec:column property="editTime" title="最后编辑时间" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxReMsg(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMsgId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxReMsgFunctionForm;
	theForm.selectedMsgIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxReMsg";
	
	showLoading();
	theForm.submit();
}
</script>