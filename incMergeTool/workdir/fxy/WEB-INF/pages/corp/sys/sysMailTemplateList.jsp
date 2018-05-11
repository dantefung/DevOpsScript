<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysMailTemplateList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.sys.listSysMailTemplates"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysMailTemplates.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys }">
		<dl>
			<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
			<dd>
				<select name="companyCode">
					<option value=""></option>
					<c:forEach items="${alCompanys}" var="alCompanyVar">
						<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="sysDataLog.changeType"/></dt>
			<dd><win:list name="typeId" listCode="email_type" value="${param.typeId}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysMailTemplates"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysMailTemplateFunctionForm" id="sysMailTemplateFunctionForm" action="editSysMailTemplate.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysMailTemplate">
				<a href="editSysMailTemplate.jhtml?strAction=addSysMailTemplate" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedTemplateIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysMailTemplateListTableForm" method="get" >
		<ec:table 
			tableId="sysMailTemplateListTable"
			items="sysMailTemplates"
			var="sysMailTemplateVar"
			action="sysMailTemplates.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysMailTemplateListTableForm">
			<ec:row>
				<ec:column alias="chkTemplateId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkTemplateId" value="${sysMailTemplateVar.templateId}" class="checkbox"/>
		  		</ec:column>
	  			<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
		  			<win:power powerCode="viewSysMailTemplate">
						<a href="viewSysMailTemplate.jhtml?strAction=viewSysMailTemplate&templateId=${sysMailTemplateVar.templateId}" name="view">查看</a>
		  			</win:power>
		  			<win:power powerCode="editSysMailTemplate">
						<a href="editSysMailTemplate.jhtml?strAction=editSysMailTemplate&templateId=${sysMailTemplateVar.templateId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				<ec:column property="typeId" title="sysDataLog.changeType" >
					<win:code listCode="email_type" value="${sysMailTemplateVar.typeId}"/>
				</ec:column>
				<ec:column property="fromEmail" title="mail.sender.email" />
				<ec:column property="fromName" title="mail.sender.name" />
				<ec:column property="mailTitle" title="邮件标题" />
				<ec:column property="editorCode" title="sys.sysfile.edit.person" >
					${sysMailTemplateVar.editorCode} - ${sysMailTemplateVar.editorName}
				</ec:column>
				<ec:column property="editTime" title="sys.sysfile.edit.time" format="yyyy-MM-dd HH:mm:ss"/>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysMailTemplate(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkTemplateId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysMailTemplateFunctionForm;
	theForm.selectedTemplateIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysMailTemplate";
	
	showLoading();
	theForm.submit();
}
</script>