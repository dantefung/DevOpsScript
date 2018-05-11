<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="stWarehouseUserList.title"/></title>
    <meta name="heading" content="<fmt:message key="stWarehouseUserList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="stWarehouseUsers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listStWarehouseUsers"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="stWarehouseUserFunctionForm" id="stWarehouseUserFunctionForm" action="editStWarehouseUser.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addStWarehouseUser">
				<a href="editStWarehouseUser.jhtml?strAction=addStWarehouseUser" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteStWarehouseUser">
				<a href="javascript:multiDeleteStWarehouseUser()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="stWarehouseUserListTableForm" method="get" >
		<ec:table 
			tableId="stWarehouseUserListTable"
			items="stWarehouseUsers"
			var="stWarehouseUserVar"
			action="stWarehouseUsers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stWarehouseUserListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkId" value="${stWarehouseUserVar.id}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="viewStWarehouseUser">
						<a href="viewStWarehouseUser.jhtml?strAction=viewStWarehouseUser&id=${stWarehouseUserVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
					<win:power powerCode="editStWarehouseUser">
						<a href="editStWarehouseUser.jhtml?strAction=editStWarehouseUser&id=${stWarehouseUserVar.id}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
				</ec:column>
				<ec:column property="id" title="stWarehouseUser.id" />
				<ec:column property="waId" title="stWarehouseUser.waId" />
				<ec:column property="userCode" title="stWarehouseUser.userCode" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteStWarehouseUser(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.stWarehouseUserFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteStWarehouseUser";
	
	showLoading();
	theForm.submit();
}
</script>