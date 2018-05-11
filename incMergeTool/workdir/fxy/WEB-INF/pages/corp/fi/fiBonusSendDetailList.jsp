<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusSendDetailList.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusSendDetailList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusSendDetails.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusSendDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusSendDetailFunctionForm" id="fiBonusSendDetailFunctionForm" action="editFiBonusSendDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusSendDetail">
				<a href="editFiBonusSendDetail.jhtml?strAction=addFiBonusSendDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiBonusSendDetail">
				<a href="javascript:multiDeleteFiBonusSendDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusSendDetailListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusSendDetailListTable"
			items="fiBonusSendDetails"
			var="fiBonusSendDetailVar"
			action="fiBonusSendDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusSendDetailListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${fiBonusSendDetailVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewFiBonusSendDetail">
						<a href="viewFiBonusSendDetail.jhtml?strAction=viewFiBonusSendDetail&id=${fiBonusSendDetailVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editFiBonusSendDetail">
						<a href="editFiBonusSendDetail.jhtml?strAction=editFiBonusSendDetail&id=${fiBonusSendDetailVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="id" title="fiBonusSendDetail.id" />
				<ec:column property="operNo" title="fiBonusSendDetail.operNo" />
				<ec:column property="memberNo" title="fiBonusSendDetail.memberNo" />
				<ec:column property="money" title="fiBonusSendDetail.money" />
				<ec:column property="bnum" title="fiBonusSendDetail.bnum" />
				<ec:column property="openBank" title="fiBonusSendDetail.openBank" />
				<ec:column property="bname" title="fiBonusSendDetail.bname" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusSendDetail(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusSendDetailFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusSendDetail";
	
	showLoading();
	theForm.submit();
}
</script>