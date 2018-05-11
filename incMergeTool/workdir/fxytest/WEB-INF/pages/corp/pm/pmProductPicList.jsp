<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductPic.manager"/></title>
    <meta name="heading" content="<fmt:message key="pmProductPic.manager"/>"/>
</head>

<div class="contentBody">
	<form name="pmProductPicFunctionForm" id="pmProductPicFunctionForm" action="editPmProductPic.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addPmProductPic">
				<a href="editPmProductPic.jhtml?strAction=addPmProductPic&productId=${param.productId }" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<a href="pmProducts.jhtml?needReload=1" name="cancel">
                <fmt:message key="operation.button.cancel"/>
			</a>
		</div>
		<input type="hidden" name="selectedPicIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="pmProductPicListTableForm" method="get" >
		<ec:table 
			tableId="pmProductPicListTable"
			items="pmProductPics"
			var="pmProductPicVar"
			action="pmProductPics.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			rowsDisplayed="20" sortable="false" form="pmProductPicListTableForm" showPagination="false">
			<ec:row>
				<win:power powerCode="editPmProductPic">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editPmProductPic.jhtml?strAction=editPmProductPic&picId=${pmProductPicVar.picId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="fileUrl" title=" ">
					<img src="${pmProductPicVar.fileUrl}" height="100" border="0"/>
				</ec:column>
				<ec:column property="picTitle" title="pmProductPic.picTitle" />
				<ec:column property="originalName" title="mi.lable.former.fileName" />
				<ec:column property="isTitlePic" title="是否列表图片" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pmProductPicVar.isTitlePic }"/>
				</ec:column>
				<ec:column property="isSmallTitlePic" title="是否列表缩图" styleClass="centerColumn">
					<win:code listCode="yesno" value="${pmProductPicVar.isSmallTitlePic }"/>
				</ec:column>
				<ec:column property="fileSize" title="mi.lable.file.size" styleClass="numberColumn"/>
				<ec:column property="createrCode" title="创建人" />
				<ec:column property="createTime" title="创建时间" />
				<ec:column property="orderNo" title="sysListValue.orderNo" styleClass="numberColumn"/>
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$("a[name='cancel']",".functionBar").button({
        icons: {
            primary: "ui-icon-cancel"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeletePmProductPic(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPicId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.pmProductPicFunctionForm;
	theForm.selectedPicIds.value=selectedValues;
	theForm.strAction.value="multiDeletePmProductPic";
	
	showLoading();
	theForm.submit();
}
</script>