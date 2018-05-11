<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icAnnouncePermitList.title"/></title>
    <meta name="heading" content="<fmt:message key="icAnnouncePermitList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icAnnouncePermits.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="poOrder.searchCondition"/></dd>
			<dd><input type="text"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listIcAnnouncePermits"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="icAnnouncePermitFunctionForm" id="icAnnouncePermitFunctionForm" action="editIcAnnouncePermit.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addIcAnnouncePermit">
				<a href="editIcAnnouncePermit.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteIcAnnouncePermit">
				<a href="javascript:multiDeleteIcAnnouncePermit()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedPermitIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icAnnouncePermitListTableForm" method="get" >
		<ec:table 
			tableId="icAnnouncePermitListTable"
			items="icAnnouncePermits"
			var="icAnnouncePermitVar"
			action="icAnnouncePermits.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icAnnouncePermitListTableForm">
			<ec:row>
				<ec:column alias="chkPermitId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkPermitId" value="${icAnnouncePermitVar.permitId}" class="checkbox"/>
		  		</ec:column>
				<win:power powerCode="editIcAnnouncePermit">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editIcAnnouncePermit.jhtml?strAction=editIcAnnouncePermit&permitId=${icAnnouncePermitVar.permitId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="permitId" title="icAnnouncePermit.permitId" />
				<ec:column property="announceId" title="icAnnouncePermit.announceId" />
				<ec:column property="userType" title="icAnnouncePermit.userType" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteIcAnnouncePermit(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkPermitId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icAnnouncePermitFunctionForm;
	theForm.selectedPermitIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcAnnouncePermit";
	
	showLoading();
	theForm.submit();
}
</script>