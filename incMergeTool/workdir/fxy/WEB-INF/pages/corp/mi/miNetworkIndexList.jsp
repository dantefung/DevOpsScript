<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miNetworkIndexList.title"/></title>
    <meta name="heading" content="<fmt:message key="miNetworkIndexList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miNetworkIndexs.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listMiNetworkIndexs"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miNetworkIndexFunctionForm" id="miNetworkIndexFunctionForm" action="editMiNetworkIndex.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiNetworkIndex">
				<a href="editMiNetworkIndex.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiNetworkIndex">
				<a href="javascript:multiDeleteMiNetworkIndex()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedMemberNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miNetworkIndexListTableForm" method="get" >
		<ec:table 
			tableId="miNetworkIndexListTable"
			items="miNetworkIndexs"
			var="miNetworkIndexVar"
			action="miNetworkIndexs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miNetworkIndexListTableForm">
			<ec:row>
				<ec:column alias="chkMemberNo" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkMemberNo" value="${miNetworkIndexVar.memberNo}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editMiNetworkIndex">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiNetworkIndex.jhtml?strAction=editMiNetworkIndex&memberNo=${miNetworkIndexVar.memberNo}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="memberNo" title="miNetworkIndex.memberNo" />
				<ec:column property="recommendIndex" title="miNetworkIndex.recommendIndex" />
				<ec:column property="recommendLayer" title="miNetworkIndex.recommendLayer" />
				<ec:column property="linkIndex" title="miNetworkIndex.linkIndex" />
				<ec:column property="linkLayer" title="miNetworkIndex.linkLayer" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiNetworkIndex(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkMemberNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miNetworkIndexFunctionForm;
	theForm.selectedMemberNos.value=selectedValues;
	theForm.strAction.value="multiDeleteMiNetworkIndex";
	
	showLoading();
	theForm.submit();
}
</script>