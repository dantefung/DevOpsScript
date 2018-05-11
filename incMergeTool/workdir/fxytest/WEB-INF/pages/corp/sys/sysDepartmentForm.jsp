<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<c:set var="tmpHeading">
		${alCompany.companyName }
		<c:if test="${not empty parentSysDepartment}"> - <fmt:message key="${parentSysDepartment.departmentName }"/></c:if>
	</c:set>
    <title><fmt:message key="sysDepartmentDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysDepartment.departmentTreeTitle"/>, <fmt:message key="sysDepartment.current.selected"/>: <b>${tmpHeading }</b>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysDepartment" method="post" action="editSysDepartment.jhtml" onsubmit="return validateForm(this)" id="sysDepartmentForm">
    
    <spring:bind path="sysDepartment.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr><th>
        <fmt:message key="label.company"/>
	    </th>
	    <td>
	    	<form:hidden path="companyCode"/>${sysDepartment.companyCode }
	    </td></tr>
	    
	    <tr><th>
	        <fmt:message key="sysDepartment.parentDepartmentName"/>
	    </th>
	    <td>
	        <form:hidden path="parentId"/>${parentSysDepartment.departmentName }
	    </td></tr>
	
	    <tr><th class="required">
	        <fmt:message  key="sysDepartment.departmentName"/>
	    </th>
	    <td>
	        <form:input path="departmentName" id="departmentName"/>
	    </td></tr>
	
	    <tr><th>
	        <fmt:message  key="sysDepartment.fullName"/>
	    </th>
	    <td>
	        <form:input path="fullName" id="fullName"/>
	    </td></tr>
	
	    <tr><th>
	        <fmt:message  key="alCompany.phone"/>
	    </th>
	    <td>
	        <form:input path="tel" id="tel"/>
	    </td></tr>
	
	    <tr><th>
	        <fmt:message  key="sysDepartment.fax"/>
	    </th>
	    <td>
	        <form:input path="fax" id="fax"/>
	    </td></tr>
	
	    <tr><th>
	        <fmt:message  key="sysModule.orderNo"/>
	    </th>
	    <td>
	        <form:input path="orderNo" id="orderNo" size="6"/>
	    </td></tr>
	    
	    <tr>
		    <th><fmt:message key="login.userType.console"/></th>
		    <td><form:input path="allowedUser" id="allowedUser" size="50"/></td>
		</tr>
		<tr>
		    <th><fmt:message key="fiBankbookJournal.notes"/></th>
		    <td><fmt:message key="common.department.seprate.desc"/></td>
		</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="departmentId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysDepartment.departmentId }">
    					<win:power powerCode="deleteSysDepartment">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysDepartment')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysDepartments.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.departmentName.value==""){
		alert("<fmt:message key='sys.departmentName.null.requie'/>");
		theForm.departmentName.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>