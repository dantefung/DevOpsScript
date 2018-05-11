<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsTemplateList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.sys.listSysSmsTemplates"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="sysSmsTemplates.jhtml" onsubmit="return validateSearch(this)">
		<%-- <dl>
			<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
			<dd><select name="companyCode">
				<option value=""></option>
				<c:forEach items="${alCompanys}" var="alCompanyVar">
					<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
				</c:forEach>
			</select></dd>
		</dl> --%>
		<dl>
			<dt><fmt:message key="sysDataLog.changeType"/></dt>
			<dd><win:list name="typeId" listCode="sms_type" value="${param.typeId}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listSysSmsTemplates"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysSmsTemplateFunctionForm" id="sysSmsTemplateFunctionForm" action="editSysSmsTemplate.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysSmsTemplate">
				<a href="editSysSmsTemplate.jhtml?strAction=addSysSmsTemplate" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedTemplateIds">
		<input type="hidden" name="strAction" value="">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysSmsTemplateListTableForm" method="get" >
		<ec:table 
			tableId="sysSmsTemplateListTable"
			items="sysSmsTemplates"
			var="sysSmsTemplateVar"
			action="sysSmsTemplates.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysSmsTemplateListTableForm">
			<ec:row>
				<ec:column alias="chkTemplateId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkTemplateId" value="${sysSmsTemplateVar.templateId}" class="checkbox"/>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewSysSmsTemplate">
						<a href="viewSysSmsTemplate.jhtml?strAction=viewSysSmsTemplate&templateId=${sysSmsTemplateVar.templateId}" name="view">查看</a>
		  			</win:power>
		  			<win:power powerCode="editSysSmsTemplate">
						<a href="editSysSmsTemplate.jhtml?strAction=editSysSmsTemplate&templateId=${sysSmsTemplateVar.templateId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				<ec:column property="typeId" title="sysDataLog.changeType" >
					<win:code listCode="sms_type" value="${sysSmsTemplateVar.typeId}"/>
				</ec:column>
				<ec:column property="creatorCode" title="fiBankbookTemp.createrCode" />
				<ec:column property="creatorName" title="fiShopAcTemp.createrName" />
				<ec:column property="editorCode" title="sys.sysfile.edit.person" >
					${sysSmsTemplateVar.editorCode} - ${sysSmsTemplateVar.editorName}
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

function multiDeleteSysSmsTemplate(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkTemplateId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysSmsTemplateFunctionForm;
	theForm.selectedTemplateIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysSmsTemplate";
	
	showLoading();
	theForm.submit();
}
</script>