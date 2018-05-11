<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.pd.pdWarehousesManage"/></title>
    <meta name="heading" content="<fmt:message key="menu.pd.pdWarehousesManage"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="stWarehouses.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dd><fmt:message key="label.company"/></dd>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>	
		<dl>
			<dt><fmt:message key="busi.warehouse.warehouseno"/></dt>
			<dd><input type="text" name="warehouseCode" value="${param.warehouseCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pdWarehouse.warehouseName"/></dt>
			<dd><input type="text" name="warehouseName" value="${param.warehouseName }"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listStWarehouses"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="stWarehouseFunctionForm" id="stWarehouseFunctionForm" action="editStWarehouse.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addStWarehouse">
				<a href="editStWarehouse.jhtml?strAction=addStWarehouse" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteStWarehouse">
				<a href="javascript:multiDeleteStWarehouse()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedWaIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="stWarehouseListTableForm" method="get" >
		<ec:table 
			tableId="stWarehouseListTable"
			items="stWarehouses"
			var="stWarehouseVar"
			action="stWarehouses.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="stWarehouseListTableForm">
			<ec:row>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" width="70">
					<nobr>
						<win:power powerCode="viewStWarehouse">
							<a href="viewStWarehouse.jhtml?strAction=viewStWarehouse&waId=${stWarehouseVar.waId}" name="view"><fmt:message key="button.view"/></a>
						</win:power>
						<win:power powerCode="editStWarehouse">
							<a href="editStWarehouse.jhtml?strAction=editStWarehouse&waId=${stWarehouseVar.waId}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
						<win:power powerCode="editStWarehouseUser">
							<a href="editStWarehouseUser.jhtml?strAction=editStWarehouseUser&waId=${stWarehouseVar.waId}" name="user">管理用户权限</a>
						</win:power>
					</nobr>
				</ec:column>
				<ec:column property="companyCode" title="label.company" />
				<ec:column property="warehouseCode" title="仓库编号" />
				<ec:column property="warehouseName" title="仓库名称" />
				<ec:column property="address" title="所在地址" />
				<ec:column property="phone" title="联系电话" />
				<ec:column property="creatorCode" title="创建人" />
				<ec:column property="createTime" title="创建时间" />
				<ec:column property="isActive" title="是否使用">
					<win:code listCode="yesno" value="${stWarehouseVar.isActive }"/>
				</ec:column>
				<ec:column property="isPickup" title="允许自提">
					<win:code listCode="yesno" value="${stWarehouseVar.isPickup }"/>
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

$(function() {
	$("a[name='user']",".eXtremeTable").button({
        icons: {
            primary: "ui-icon-user"
        },
        text: false
    });
});

function multiDeleteStWarehouse(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkWaId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.stWarehouseFunctionForm;
	theForm.selectedWaIds.value=selectedValues;
	theForm.strAction.value="multiDeleteStWarehouse";
	
	showLoading();
	theForm.submit();
}
</script>