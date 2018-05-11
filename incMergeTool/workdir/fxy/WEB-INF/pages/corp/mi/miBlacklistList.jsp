<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<c:if test="${param.strAction=='miVerifyMiBlacklist' }">
	    <title><fmt:message key="miBlacklistList.verify"/></title>
	    <meta name="heading" content="<fmt:message key="miBlacklistList.verify"/>"/>
   </c:if>
   <c:if test="${param.strAction =='miBlacklistList' }">
	    <title><fmt:message key="miBlacklistList.add"/></title>
	    <meta name="heading" content="<fmt:message key="miBlacklistList.add"/>"/>
   </c:if>
</head>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<div class="searchBar">
	<form method="get" action="miBlacklists.jhtml" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="poOrder.memberName"/></dt>
			<dd><input type="text" name="memberName" value="${param.memberName }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="mi.lable.cardNo"/></dt>
			<dd><input type="text" name="idNo" value="${param.idNo }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list listCode="memberblacklist_apply_status" defaultValue="" name="status" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.createTime"/></dt>
			<dd>
				<fmt:message key="from"/>&nbsp;<input type="text" name="createTime_startDate" id="createTime_startDate" value="${param.createTime_startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="createTime_endDate" id="createTime_endDate" value="${param.createTime_endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="icAnnounce.checkTime"/></dt>
			<dd><%-- <input type="text" name="checkTime" id="checkTime" value="${param.checkTime }" style="width:80px;" readonly="readonly"  onkeypress="getClear()" onkeyup="this.value=this.value.replace(/\D/g,'')"/> --%>
				<fmt:message key="from"/>&nbsp;<input type="text" name="checkTime_startDate" id="checkTime_startDate" value="${param.checkTime_startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="checkTime_endDate" id="checkTime_endDate" value="${param.checkTime_endDate }" style="width:80px;" readonly="readonly"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="${param.strAction }"/>
			</dd>
		</dl>
	</form>
</div>
<div class="contentBody">
		<form name="miBlacklistFunctionForm" id="miBlacklistFunctionForm" action="editMiBlacklist.jhtml" method="post" >
			<%@ include file="/common/messages.jsp" %>
			<div class="functionBar">
				<c:if test="${param.strAction=='miBlacklistList'}">
					<win:power powerCode="addMiBlacklist">
						<a href="editMiBlacklist.jhtml?strAction=miBlacklistList" name="add">
		                    <fmt:message key="miBlacklist.apply.add"/>
						</a>
						<span class="divider">&nbsp;</span>
					</win:power>
				</c:if>
				<c:if test="${param.strAction=='miVerifyMiBlacklist'}">
					<win:power powerCode="verifyMiBlacklist">
						<a href="javascript:checkBlacklist('miVerifyMiBlacklist')" name="check">
		                    <fmt:message key="operation.button.check"/>
						</a>
						<span class="divider">&nbsp;</span>
					</win:power>
					<win:power powerCode="concleMiBlacklist">
						<a href="javascript:checkBlacklist('concleMiBlacklist')" name="multiDelete">
		                    <fmt:message key="efubo.card.zf"/>
						</a>
						<span class="divider">&nbsp;</span>
					</win:power>
				</c:if>
			</div>
			<input type="hidden" name="selectedIds">
			<input type="hidden" name="strAction">
			<input type="hidden" name="_form_uniq_id" value="${form.token}" />
		</form>
	<form id="miBlacklistListTableForm" method="get" >
		<ec:table 
			tableId="miBlacklistListTable"
			items="miBlacklists"
			var="miBlacklistVar"
			action="miBlacklists.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miBlacklistListTableForm">
			<c:if test="${param.strAction=='miVerifyMiBlacklist'}">
				<ec:exportCsv fileName="company.csv"/>
				<ec:exportXls fileName="company.xls"/>
			</c:if>
			<ec:row>
				<ec:column alias="chkKeyId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkKeyId" value="${miBlacklistVar.id}" class="checkbox"/>
		  		</ec:column>
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false"> 
					<win:power powerCode="viewMiBlacklist">
						<a href="viewMiBlacklist.jhtml?strAction=viewMiBlacklist&id=${miBlacklistVar.id}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<c:if test="${param.strAction =='miBlacklistList' }"> 
						<win:power powerCode="addMiBlacklistFile">
							<a href="editMiBlacklistFile.jhtml?strAction=addMiBlacklistFile&id=${miBlacklistVar.id}" name="attachment"><fmt:message key="mi.attachment.manager"/></a>
						</win:power>
						<c:if test="${miBlacklistVar.status =='0' }"> 
							<win:power powerCode="deleteMiBlacklist">
								<a href="javascript:deleteBlacklist('deleteMiBlacklist','${miBlacklistVar.id }');" name="exit"><fmt:message key="operation.button.delete"/></a>
							</win:power>
						</c:if>
					</c:if>
		  		</ec:column>
				<ec:column property="member_no" title="miMember.memberNo" />
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="id_no" title="mi.lable.cardNo" />
				<ec:column property="status" title="fi.status" >
					<win:code listCode="memberblacklist_apply_status" value="${miBlacklistVar.status }"></win:code>
				</ec:column>
				<ec:column property="creator_code" title="pmProductSppm.createUser" />
				<ec:column property="create_time" title="pd.createTime" />
				<ec:column property="checker_code" title="pmProductSppm.checkUser" />
				<ec:column property="check_time" title="icAnnounce.checkTime" />
				 <c:if test="${param.strAction !='miVerifyMiBlacklist' }">
					<ec:column property="remark" title="busi.common.remark" />
				</c:if>
			</ec:row>
		</ec:table>
	</form>
	<form:form commandName="miBlacklist" name="miBlacklistForm"  method="post" action="editMiBlacklist.jhtml" onsubmit="return validateForm(this)" id="miBlacklistForm" >
		<input type="hidden" name="ids">
		<input type="hidden" name="strAction">
	</form:form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#createTime_startDate,#createTime_endDate" ).datepicker();
});
$(function() {
	$( "#checkTime_startDate,#checkTime_endDate" ).datepicker();
});
$(document).ready(function(){
	$("a[name='view']").colorbox({iframe:true, width:"80%", height:"80%",title:true});

});
function validateSearch(theForm) {
	showLoading();
	return true;
}

function checkBlacklist(strAction){
	if(strAction=="concleMiBlacklist"){
		if(confirm("<fmt:message key='mi.miblacklist.cancle.sure'/>")){
			<win:power powerCode="concleMiBlacklist">
				var selectedValues=getCheck(document.getElementsByName("chkKeyId"));
				window.location = "/corp/miBlacklistCancleForm.jhtml?strAction=miVerifyMiBlacklist&ids="+selectedValues;
				
			</win:power>
		}
	}else if(strAction=="miVerifyMiBlacklist"){
		if(confirm("<fmt:message key='mi.miblacklist.check.sure'/>")){
			<win:power powerCode="verifyMiBlacklist">
				var selectedValues=getCheck(document.getElementsByName("chkKeyId"));
				document.miBlacklistForm.strAction.value = strAction;
				document.miBlacklistForm.ids.value = selectedValues;
				document.miBlacklistForm.submit();
			</win:power>
		}
	}
}
function deleteBlacklist(strAction,id){
	if(confirm("<fmt:message key='mi.miblacklist.delete.sure'/>")){
		<win:power powerCode="deleteMiBlacklist">
			document.miBlacklistForm.strAction.value = strAction;
			document.miBlacklistForm.ids.value = id;
			document.miBlacklistForm.submit();
		</win:power>
	}
	
}
function multiDeleteMiBlacklist(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkKeyId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miBlacklistFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiBlacklist";
	
	showLoading();
	theForm.submit();
}
function getCheck(objectsArray){
	var checkValue = new Array();
	var i = 0;
	for ( var j=0;j< objectsArray.length;j++) {
		if (objectsArray[j].checked) {
			checkValue[i] = objectsArray[j].value;
			i++;
			
		}
	}
	return checkValue.join();
}
</script>