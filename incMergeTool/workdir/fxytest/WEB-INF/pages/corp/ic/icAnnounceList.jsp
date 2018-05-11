<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icAnnounceList.title"/></title>
    <meta name="heading" content="<fmt:message key="icAnnounceList.list"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="icAnnounces.jhtml" onsubmit="return validateSearch(this)">
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
			<dd><fmt:message key="icInformation.title"/></dd>
			<dd><input type="text" id ='title' name ="title" value ="${param.title }"/></dd>
			</dl>
		<dl>
			<dd><fmt:message key="fi.status"/></dd>
			<dd><win:list name="status" listCode="icannounce.status" defaultValue="" value="${param.status }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dd>
				<win:list name="timeRangeType" listCode="announce_query_time" defaultValue="0" value="${param.timeRangeType }" showBlankLine="true"/>
			</dd>
			<dd><input type="text" id ='startTime' name ="startTime" value ="${param.startTime}" size="12"/> - <input type="text" id ='endTime' name ="endTime" value ="${param.endTime}" size="12"/></dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="icAnnounceList"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">  

	<form name="icAnnounceFunctionForm" id="icAnnounceFunctionForm" action="editIcAnnounce.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<div class="functionBar">
			<win:power powerCode="addIcAnnounce">
				<a href="editIcAnnounce.jhtml?strAction=addIcAnnounce" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="addIcAnnounce">
				<a href="javascript:multiCheckIcAnnounce()" name="check">
					<fmt:message key="button.checked"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="addIcAnnounce">
				<a href="javascript:multiNoCheckIcAnnounce()" name="uncheck">
					<fmt:message key="function.menu.order.cancel.cn"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="addIcAnnounce">
				<a href="javascript:multiDeleteIcAnnounce()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedAnnounceIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="icAnnounceListTableForm" method="get" >
		<ec:table 
			tableId="icAnnounceListTable"
			items="icAnnounces"
			var="icAnnounceVar"
			action="icAnnounces.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="icAnnounceListTableForm">
			<ec:row>
				<ec:column alias="chkAnnounceId" headerCell="selectAll" style="width:5px;">  
					<input type="checkbox" name="chkAnnounceId" value="${icAnnounceVar.announceId}" class="checkbox"/>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<c:if test="${icAnnounceVar.status==0 }">
						<win:power powerCode="editIcAnnounce">
							<a href="editIcAnnounce.jhtml?strAction=editIcAnnounce&announceId=${icAnnounceVar.announceId}" name="edit"><fmt:message key="button.edit"/></a>	
						</win:power>
					</c:if>
					<win:power powerCode="icAnnounceView">
						<a href="icAnnounceView.jhtml?announceId=${icAnnounceVar.announceId}" name="view"><fmt:message key="function.menu.view"/></a>		
					</win:power>			
				</ec:column>			 
				
				<c:if test="${sessionScope.sessionLoginUser.companyCode=='AA' }">
					<ec:column property="companyCode" title="bdReconsumMoneyReport.company" />
				</c:if>
				<ec:column property="title" title="icAnnounce.title" />
				 
				<ec:column property="status" title="fi.status" >
					<win:code listCode="icannounce.status" value="${icAnnounceVar.status }"/>
				</ec:column>
				<ec:column property="activeDate" title="icAnnounce.activeDate" >
					<fmt:formatDate value="${icAnnounceVar.activeDate }" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="expireDate" title="icAnnounce.expireDate" >
					<fmt:formatDate value="${icAnnounceVar.expireDate }" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="isTop" title="icAnnounce.isTop" >
					<win:code listCode="yesno" value="${icAnnounceVar.isTop }"/>
				</ec:column>
				<ec:column property="creatorCode" title="pmProductSppm.createUser" />
				<ec:column property="createTime" title="pd.createTime" >
					<fmt:formatDate value="${icAnnounceVar.createTime }" pattern="yyyy-MM-dd"/>
				</ec:column>
				<ec:column property="checkerCode" title="pmProductSppm.checkUser" />
				<ec:column property="checkTime" title="icAnnounce.checkTime" >
					<fmt:formatDate value="${icAnnounceVar.checkTime }" pattern="yyyy-MM-dd"/>
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

function multiDeleteIcAnnounce(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAnnounceId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.icAnnounceFunctionForm;
	theForm.selectedAnnounceIds.value=selectedValues;
	theForm.strAction.value="multiDeleteIcAnnounce";
	
	showLoading();
	theForm.submit();
}
function multiCheckIcAnnounce(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAnnounceId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.check.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.check'/>.")){
		return;
	}
	var theForm=document.icAnnounceFunctionForm;
	theForm.selectedAnnounceIds.value=selectedValues;
	theForm.strAction.value="multiCheckIcAnnounce";
	
	showLoading();
	theForm.submit();
}
function multiNoCheckIcAnnounce(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkAnnounceId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.cencelCheck.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.cencelCheck'/>.")){
		return;
	}
	var theForm=document.icAnnounceFunctionForm;
	theForm.selectedAnnounceIds.value=selectedValues;
	theForm.strAction.value="multiNoCheckIcAnnounce";
	
	showLoading();
	theForm.submit();
}
$(function() {
	$( "#startTime,#endTime" ).datepicker();
});
</script>