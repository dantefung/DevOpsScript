<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miCardChangeLogList.title"/></title>
    <meta name="heading" content="<fmt:message key="miCardChangeLogList.title"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miCardChangeLogs.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
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
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMemberUpgradeNote.oldCard"/></dt>
			<dd><win:list listCode="member.card.type" name="beforeChange" value="${param.beforeChange }"  defaultValue="" style="width:135px;" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMemberUpgradeNote.newCard"/></dt>
			<dd><win:list listCode="member.card.type" name="afterChange" value="${param.afterChange }"  defaultValue="" style="width:135px;" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="sysDataLog.operatorTime"/></dt>
			<dd><fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.card.changType"/></dt>
			<dd><win:list listCode="mi_cardtype_change_list" name="changeType" value="${param.changeType }"  defaultValue="0" style="width:135px;" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<!-- <input type="hidden" name="strAction" value="listMiCardChangeLogs"/> -->
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miCardChangeLogFunctionForm" id="miCardChangeLogFunctionForm" action="editMiCardChangeLog.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiCardChangeLog">
				<a href="editMiCardChangeLog.jhtml" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiCardChangeLog">
				<a href="javascript:multiDeleteMiCardChangeLog()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedLogIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miCardChangeLogListTableForm" method="get" >
		<ec:table 
			tableId="miCardChangeLogListTable"
			items="miCardChangeLogs"
			var="miCardChangeLogVar"
			action="miCardChangeLogs.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miCardChangeLogListTableForm">
			<ec:exportXls fileName="miCardChangeLog.xls"/>
			<ec:row>

				<%-- <ec:column alias="chkLogId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkLogId" value="${miCardChangeLogVar.logId}" class="checkbox"/>
		  		</ec:column> --%>
		  		<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" viewsAllowed="html">
		  			<win:power powerCode="addMiCardChangeFile">
						<a href="editMiCardChangeFile.jhtml?strAction=addMiCardChangeFile&uniqueNo=${miCardChangeLogVar.unique_no}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
					</win:power>
		  		</ec:column>
				<%-- <win:power powerCode="editMiCardChangeLog">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
						<a href="editMiCardChangeLog.jhtml?strAction=editMiCardChangeLog&logId=${miCardChangeLogVar.logId}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power> --%>
				<%-- <ec:column property="uniqueNo" title="miCardChangeLog.uniqueNo" /> --%>
				<ec:column property="member_no" title="miMember.memberNo">
					<nobr>
						${miCardChangeLogVar.member_no }
						<c:if test="${miCardChangeLogVar.attach_count>0 }">
						<span class="ui-icon ui-icon-attachment" style="display:inline-block;vertical-align: text-bottom;"></span>
						</c:if>
					</nobr>
				</ec:column>
				<ec:column property="user_name" title="poOrder.memberName" />
				<ec:column property="before_change" title="miMemberUpgradeNote.oldCard" >
					<win:code listCode="member.card.type" value="${miCardChangeLogVar.before_change }"/>
				</ec:column>
				<ec:column property="after_change" title="miMemberUpgradeNote.newCard" >
					<win:code listCode="member.card.type" value="${miCardChangeLogVar.after_change }"/>
				</ec:column>
				<ec:column property="create_time" title="sysDataLog.operatorTime" />
				<ec:column property="creator_code" title="sys.handle.no" />
				<ec:column property="change_type" title="mi.card.changType">
					<win:code listCode="mi_cardtype_change_list" value="${miCardChangeLogVar.change_type }"></win:code>
				</ec:column>
				<ec:column property="remark" title="busi.common.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteMiCardChangeLog(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkLogId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miCardChangeLogFunctionForm;
	theForm.selectedLogIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiCardChangeLog";
	
	showLoading();
	theForm.submit();
}
$(function() {
	$( "#startDate" ).datepicker();
	$( "#endDate" ).datepicker();
});
</script>