<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="alIpInfoList.title"/></title>
    <meta name="heading" content="<fmt:message key="alIpInfoList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alIpInfos.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>搜索条件1</dt>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listAlIpInfos"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alIpInfoFunctionForm" id="alIpInfoFunctionForm" action="editAlIpInfo.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlIpInfo">
				<a href="editAlIpInfo.jhtml?strAction=addAlIpInfo" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteAlIpInfo">
				<a href="javascript:multiDeleteAlIpInfo()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedInfoIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alIpInfoListTableForm" method="get" >
		<ec:table 
			tableId="alIpInfoListTable"
			items="alIpInfos"
			var="alIpInfoVar"
			action="alIpInfos.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="alIpInfoListTableForm">
			<ec:row>
				<ec:column alias="chkInfoId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkInfoId" value="${alIpInfoVar.infoId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editAlIpInfo">
						<a href="editAlIpInfo.jhtml?strAction=editAlIpInfo&infoId=${alIpInfoVar.infoId}" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					<win:power powerCode="viewAlIpInfo">
						<a href="viewAlIpInfo.jhtml?strAction=viewAlIpInfo&infoId=${alIpInfoVar.infoId}" name="view"><fmt:message key="button.view"/></a>
					</win:power>
				</ec:column>
				
				<ec:column property="infoId" title="alIpInfo.infoId" />
				<ec:column property="startIp" title="alIpInfo.startIp" />
				<ec:column property="endIp" title="alIpInfo.endIp" />
				<ec:column property="ipLocale" title="alIpInfo.ipLocale" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteAlIpInfo(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkInfoId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.alIpInfoFunctionForm;
	theForm.selectedInfoIds.value=selectedValues;
	theForm.strAction.value="multiDeleteAlIpInfo";
	
	showLoading();
	theForm.submit();
}
</script>