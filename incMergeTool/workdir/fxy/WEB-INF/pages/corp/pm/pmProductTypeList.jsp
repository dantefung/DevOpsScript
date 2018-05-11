<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="商品分类列表"/></title>
    <meta name="heading" content="<fmt:message key="商品分类列表"/>"/>
</head>

<c:if test="${not empty successMessages}">
	<script>
	window.parent.frmPmProductTypeTree.location.reload();
	</script>
</c:if>

<div class="contentBody">
	<form name="pmProductTypeFunctionForm" id="pmProductTypeFunctionForm" action="editPmProductType.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<c:if test="${empty parentPmProductType || parentPmProductType.typeLevel<2 }">
				<win:power powerCode="addPmProductType">
					<a href="editPmProductType.jhtml?strAction=addPmProductType&parentTypeId=${param.parentTypeId}" name="add">
	                    <fmt:message key="operation.button.add"/>
					</a>
					<span class="divider">&nbsp;</span>
				</win:power>
			</c:if>
			<c:if test="${not empty parentPmProductType && parentPmProductType.typeLevel>=2 }">
				<font color="#ff0000">此目录下不允许继续增加子目录</font>
			</c:if>
			
		</div>
		<input type="hidden" name="selectedTypeIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductTypeListTableForm" method="get" >
		<ec:table 
			tableId="pmProductTypeListTable"
			items="pmProductTypes"
			var="pmProductTypeVar"
			action="pmProductTypes.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="pmProductTypeListTableForm">
			<ec:row>
				 
				<win:power powerCode="editPmProductType">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPmProductType.jhtml?strAction=editPmProductType&typeId=${pmProductTypeVar.typeId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				 
				<ec:column property="typeName" title="分类名称">
					<fmt:message key="${pmProductTypeVar.typeName }"/>
				</ec:column>
				<ec:column property="descText" title="label.product.desc" />
				<ec:column property="sortNo" title="sysModule.orderNo" />
				<ec:column property="createTime" title="pd.createTime">
					${pmProductTypeVar.creatorCode } - ${pmProductTypeVar.createTime }
				</ec:column>
				<ec:column property="editTime" title="poCounterOrder.editTime">
					${pmProductTypeVar.editorCode } - ${pmProductTypeVar.editTime }
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

function multiDeletePmProductType(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkTypeId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmProductTypeFunctionForm;
	theForm.selectedTypeIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmProductType";
	
	showLoading();
	theForm.submit();
}
</script>