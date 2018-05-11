<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="sysManagerList.title"/></title>
    <meta name="heading" content="<fmt:message key="title.manager.list"/>, <fmt:message key="sysDepartment.current.selected"/>: <b>${alCompany.companyName } - <fmt:message key="${sysDepartment.departmentName }"/></b>"/>
</head>

<c:if test="${not empty param.departmentId && param.departmentId!=0}">
	<div class="contentBody">
		<form name="sysManagerFunctionForm" id="sysManagerFunctionForm" action="editSysManager.jhtml" method="post" >
			<%@ include file="/common/messages.jsp" %>
			
			<div class="functionBar">
				<c:if test="${hasPermit==true}">
					<win:power powerCode="addSysManager">
						<a name="add" href="<c:url value="editSysManager.jhtml"/>?strAction=addSysManager&companyCode=${param.companyCode }&departmentId=${param.departmentId }">
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
		
		<ec:table 
			tableId="sysManagerListTable"
			items="sysManagers"
			var="sysManager"
			action="${pageContext.request.contextPath}/corp/sysManagerOrg.jhtml"
			width="100%"
			retrieveRowsCallback="limit"
			autoIncludeParameters="true"
			rowsDisplayed="20" sortable="false" imagePath="/wecs/images/extremetable/*.gif">
			<ec:row>
				<ec:column property="1" title="title.operation" sortable="false" styleClass="centerColumn" style="white-space: nowrap;width:5px;">
					<nobr>
						<win:power powerCode="editSysManager">
							<a href="editSysManager.jhtml?strAction=editSysManager&userCode=${sysManager.user_code}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
						&nbsp;
						<win:power powerCode="sysModifyPwd">
							<a href="editSysManagerPwd.jhtml?strAction=sysModifyPwd&modifyType=other&departmentId=${sysManager.department_id}&userCode=${sysManager.user_code}" name="password"><fmt:message key="title.change.password"/></a>
						</win:power>
					</nobr>
				</ec:column>
				<ec:column property="user_code" title="sysUser.userCode" />
				<ec:column property="user_name" title="sysUser.userName" />
				<ec:column property="email" title="sysUser.email" />
				<ec:column property="tel" title="alCompany.phone" />
				<ec:column property="mobile" title="sysUser.mobile" />
				<ec:column property="suspend_status" title="label.no.login" styleClass="centerColumn">
					<win:code listCode="sysuser.suspendstatus" value="${sysManager.suspend_status}"/>
				</ec:column>
			</ec:row>
		
		</ec:table>	

	</div>
</c:if>