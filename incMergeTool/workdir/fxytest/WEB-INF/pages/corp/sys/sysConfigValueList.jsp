<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysConfigValueList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysConfigValueList.title"/>"/>
</head>

<form method="post" name="sysConfigValueForm" id="sysConfigValueForm" action="/corp/editSysConfigValue.jhtml" >

<div class="contentBody">
		<ec:table 
			items="sysConfigValues"
			var="sysConfigValueVar"
			action="sysConfigValues.jhtml"
			showPagination="false"
			width="100%" sortable="false"
		    form="sysConfigValueListTableForm">
			<ec:row>
				<ec:column property="company_code" title="alCompany.companyCode" />
				<ec:column property="company_name" title="sysConfigValue.configValue" />
				<ec:column property="config_value" title="sysConfigValue.configValue">
					<input type="hidden" name="companyCode" value="${sysConfigValueVar.company_code}"/>
					<input type="hidden" name="valueId1" value="${sysConfigValueVar.value_id}"/>
	         		<input type="text" name="configValue" value="${sysConfigValueVar.config_value}" size="60"/>
				</ec:column>
			</ec:row>
		</ec:table>
		<c:if test="${not empty param.keyId}">
		<table width="100%" class="detail" border="0">
			<tr>
				<td class="command" align="center">
					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
					<input type="hidden" name="strAction" value="${param.strAction }"/>
					<input type="hidden" name="keyId" value="${param.keyId }"/>
				</td>
			</tr>
		</table>
	</c:if>
</div>
<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysConfigValue(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkValueId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysConfigValueFunctionForm;
	theForm.selectedValueIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysConfigValue";
	
	showLoading();
	theForm.submit();
}
function validateOthers(theForm){
	showLoading();
	return true;
}
</script>