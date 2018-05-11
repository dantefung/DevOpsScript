<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysManagerList.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.sys.sysAccounts"/>"/>
</head>
<div class="searchBar">
	<form method="get" action="sysManagers.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd><fmt:message key="sys.company.code"/></dd>
			<dd>
				<select  name="companyCode"><option value=""></option>
					<c:forEach items="${alCompanyList }" var="company">
						<option value="${company.companyCode }" <c:if test="${param.companyCode==company.companyCode}"> selected="selected"</c:if>>${company.companyName }</option>
					</c:forEach>
				</select>
			</dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysUser.userCode"/></dd>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="sysUser.userName"/></dd>
			<dd><input type="text" name="userName" value="${param.userName }"/></dd>
		</dl>
		<dl>
			<dd><fmt:message key="mi.lable.limit.status"/></dd>
			<dd><win:list name="state" listCode="sysuser.suspendstatus" value="${param.state}" defaultValue="" showBlankLine="true"/>
			</dd>
		</dl>
		<dl>
			<dd></dd>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="searchs" value="1"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="sysManagerFunctionForm" id="sysManagerFunctionForm" action="editSysManager.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<c:if test="${not empty param.searchs  }">
			<win:power powerCode="addSysManager">
				<a href="editSysManager.jhtml?strAction=addSysManager&modifyType=account&companyCode=${param.companyCode }&departmentId=${param.departmentId }" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			</c:if>
			<%-- <win:power powerCode="multiDeleteSysManager">
				<a href="javascript:multiDeleteSysManager()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power> --%>
		</div>
		<input type="hidden" name="selectedUserCodes">
		<input type="hidden" name="strAction" value="${param.strAction }">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="sysManagerListTableForm" method="get" >
		<ec:table 
			tableId="sysManagerListTable"
			items="sysManagers"
			var="sysManagerVar"
			action="sysManagers.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="sysManagerListTableForm">
			<ec:row>
		  		<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<win:power powerCode="editSysManager">
							<a href="editSysManager.jhtml?strAction=editSysManager&userCode=${sysManagerVar.user_code}&modifyType=account" name="edit"><fmt:message key="button.edit"/></a>
					</win:power>
					&nbsp;
					<win:power powerCode="sysModifyPwd">
						<a href="javascript:changePassword('${sysManagerVar.user_code}')" name="password"><fmt:message key="title.change.password"/></a>
					</win:power>
					&nbsp;
					<win:power powerCode="sysPowerSimple">
						<a href="sysPowerSimple.jhtml?userCode=${sysManagerVar.user_code}" name="lock"><fmt:message key="member.status.limit1"/></a>
					</win:power>
					<win:power powerCode="clearSysManagerPower">
					<a href="sysManagerPowerClear.jhtml?userCode=${sysManagerVar.user_code}" name="unlock"><fmt:message key="menu.sys.clearSysManagerPower"/></a>
					</win:power>
				</ec:column>
				<ec:column property="company_code" title="sys.company.code" />
				<ec:column property="user_code" title="sysUser.userCode" />
				<ec:column property="user_name" title="sysUser.userName" />
				<ec:column property="email" title="sysUser.email" />
				<ec:column property="tel" title="alCompany.phone" />
				<ec:column property="mobile" title="sysUser.mobile" />
				<ec:column property="dep_order" title="sysModule.orderNo" />
				<ec:column property="suspend_status" title="mi.lable.limit.status" >
					<win:code listCode="sysuser.suspendstatus" value="${sysManagerVar.suspend_status }" />
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

function multiDeleteSysManager(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkUserCode"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.sysManagerFunctionForm;
	theForm.selectedUserCodes.value=selectedValues;
	theForm.strAction.value="multiDeleteSysManager";
	
	showLoading();
	theForm.submit();
}
function changePassword(userCode){
	<win:power powerCode="sysModifyPwd">
		window.location="/corp/editSysManagerPwd.jhtml?strAction=sysModifyPwd&modifyType=account&userCode="+userCode;
	</win:power>
}
</script>