<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>微信通知模板管理</title>
    <meta name="heading" content="微信通知模板管理"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
	<form name="wxNoticeTemplateFunctionForm" id="wxNoticeTemplateFunctionForm" action="editWxNoticeTemplate.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addWxNoticeTemplate">
				<a href="editWxNoticeTemplate.jhtml?strAction=addWxNoticeTemplate" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="wxNoticeTemplateListTableForm" method="get" >
		<ec:table 
			tableId="wxNoticeTemplateListTable"
			items="wxNoticeTemplates"
			var="wxNoticeTemplateVar"
			action="wxNoticeTemplates.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="wxNoticeTemplateListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editWxNoticeTemplate">
						<a href="editWxNoticeTemplate.jhtml?strAction=editWxNoticeTemplate&id=${wxNoticeTemplateVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="noticeType" title="通知类型" />
				<ec:column property="noticeTitle" title="通知标题" />
				<ec:column property="templateId" title="微信模板ID" />
				<ec:column property="templatePattern" title="样式">
					${fn:replace(wxNoticeTemplateVar.templatePattern, vEnter, '<br>')}
				</ec:column>
				<ec:column property="templateSample" title="示例">
					${fn:replace(wxNoticeTemplateVar.templateSample, vEnter, '<br>')}
				</ec:column>
				<ec:column property="remark" title="备注">
					${fn:replace(wxNoticeTemplateVar.remark, vEnter, '<br>')}
				</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteWxNoticeTemplate(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.wxNoticeTemplateFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteWxNoticeTemplate";
	
	showLoading();
	theForm.submit();
}
</script>