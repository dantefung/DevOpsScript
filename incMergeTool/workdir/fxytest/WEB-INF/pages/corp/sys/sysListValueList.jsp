<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>列表值编辑</title>
    <meta name="heading" content="列表值编辑"/>
</head>

<div class="contentBody">
	 <form name="sysListValueFunctionForm" id="sysListValueFunctionForm" action="editSysListValue.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<c:if test="${param.keyId != null}">
			<win:power powerCode="addSysListValue">
				<a href="editSysListValue.jhtml?keyId=${param.keyId }&strAction=addSysListValue" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			</c:if>
			<%-- <win:power powerCode="multiDeleteSysListValue">
				<a href="javascript:multiDeleteSysListValue()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power> --%>
		</div>
		<input type="hidden" name="selectedValueIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form> 
	
		<ec:table 
			items="sysListValues"
			var="sysListValueVar"
			action="sysListValues.jhtml"
			width="100%" method="get"
			showPagination="false" sortable="false"
		    form="sysListValueListTableForm">
			<ec:row>
				<ec:column property="keyId" title="title.operation" styleClass="centerColumn" style="width:5px;" >
				<nobr>
	 			<c:if test="${sysListKey.isReadOnly!=1}">
				<a href="/corp/editSysListValue.jhtml?strAction=editSysListValue&keyId=${sysListValueVar.keyId }&valueId=${sysListValueVar.valueId}" name="edit"><fmt:message key="button.edit"/></a>
				</c:if>
				&nbsp;
				</nobr>
				</ec:column>
				<ec:column property="valueCode" title="sysListValue.valueCode" />
				<ec:column property="valueTitle" title="sysListValue.valueTitle">
					<fmt:message key="${sysListValueVar.valueTitle }"/>
				</ec:column>
				<ec:column property="exCompanyCode" title="sysListValue.exCompanyCode" />
				<ec:column property="orderNo" title="sysListValue.orderNo" />
			</ec:row>
		</ec:table>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteSysListValue(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkValueId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysListValueFunctionForm;
	theForm.selectedValueIds.value=selectedValues;
	theForm.strAction.value="multiDeleteSysListValue";
	
	showLoading();
	theForm.submit();
}
</script>