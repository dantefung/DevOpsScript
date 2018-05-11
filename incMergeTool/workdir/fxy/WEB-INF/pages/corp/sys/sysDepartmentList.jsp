<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<c:set var="tmpHeading">
		${alCompany.companyName }
		<c:if test="${not empty parentSysDepartment}"> - <fmt:message key="${parentSysDepartment.departmentName }"/></c:if>
	</c:set>
	
    <title><fmt:message key="sysDepartmentList.title"/></title>
    <meta name="heading" content="<fmt:message key="sysDepartment.departmentTreeTitle"/>, <fmt:message key="sysDepartment.current.selected"/>: <b>${tmpHeading }</b>"/>
</head>

<c:if test="${not empty successMessages}">
	<script>
	window.parent.frmDepartmentTree.location.reload();
	</script>
</c:if>

<div class="contentBody">
	<form name="alRegionFunctionForm" id="alRegionFunctionForm" action="editAlRegion.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addSysDepartment">
				<a name="add" href="<c:url value='editSysDepartment.jhtml'/>?strAction=addSysDepartment&companyCode=${param.companyCode }&parentId=${param.parentId }">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			
		</div>
		<input type="hidden" name="selectedRegionIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<ec:table 
		tableId="sysDepartmentListTable"
		items="sysDepartments"
		var="sysDepartment"
		action="${pageContext.request.contextPath}/corp/sysDepartments.jhtml"
		width="100%"
		retrieveRowsCallback="limit"
		autoIncludeParameters="true"
		rowsDisplayed="20" sortable="false" imagePath="/wecs/images/extremetable/*.gif">
		<ec:row onclick="javascript:editSysDepartment('${sysDepartment.department_id}')">
			<ec:column property="department_id" title="title.operation" sortable="false" style="white-space: nowrap;width:5px;">
				<win:power powerCode="editSysDepartment">
					<c:if test="${fiPayAdvice.status!=2 && fiPayAdvice.status!=4}">
						<a href="editSysDepartment.jhtml?strAction=editSysDepartment&departmentId=${sysDepartment.department_id}">
						<img src="${ctx }/themes/default/images/icons/editIcon.gif" border="0" width="16" height="16"/></a>
					</c:if>
				</win:power>
				&nbsp;
			</ec:column>
			<ec:column property="parent_id" title="sysDepartment.parentDepartmentName" >
				${sysDepartment.parent_department_name }&nbsp;
			</ec:column>
			<ec:column property="department_name" title="sysDepartment.departmentName" />
			<ec:column property="full_name" title="sysDepartment.fullName" />
			<ec:column property="tel" title="alCompany.phone" />
			<ec:column property="fax" title="sysDepartment.fax" />
			<ec:column property="order_no" title="sysModule.orderNo" />
			<ec:column property="allowed_user" title="login.userType.console" />
		</ec:row>
	
	</ec:table>	

</div>