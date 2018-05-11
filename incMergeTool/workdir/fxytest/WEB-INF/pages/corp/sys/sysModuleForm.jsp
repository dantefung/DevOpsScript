<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="link.editSysModule"/></title>
    <meta name="heading" content="<fmt:message key="link.editSysModule"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="contentBody">
    <form:form commandName="sysModule" name="sysModuleForm" method="post" action="editSysModule.jhtml" onsubmit="return validateForm(this)" id="sysModuleForm">
    
    <spring:bind path="sysModule.*">
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
    	<tr>
    		<th class="required"><fmt:message key="sysModule.parent"/>:</th>
		    <td>
		        <span id="spnParentModuleName"><fmt:message key="${parentSysModule.moduleName }"/></span>
		        <a href="ajax/sys_select_module_ajax.jhtml" id="btnSelectModule" name="view" title="选择上级模块"><fmt:message key="button.select"/></a>
		    </td>
	    </tr>
	    <tr>
    		<th class="required"><fmt:message key="sys.user.type"/>:</th>
    		<td>
    			<win:code listCode="user_type" value="${sysModule.userType}"/>
    			<form:hidden path="userType"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.moduleCode"/>:</th>
    		<td><form:input path="moduleCode" id="moduleCode" size="40"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.moduleName"/>:</th>
    		<td><form:input path="moduleName" id="moduleName" size="40"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysModule.moduleDesc"/>:</th>
    		<td><form:input path="moduleDesc" id="moduleDesc" size="40"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.moduleType"/>:</th>
    		<td>
    			<spring:bind path="sysModule.moduleType">
		        	<win:list name="${status.expression}" listCode="module_type" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysModule.linkUrl"/>:</th>
    		<td><form:input path="linkUrl" id="linkUrl" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.url.other"/>:</th>
    		<td><form:input path="otherUrl1" id="otherUrl1" size="60"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="sys.url2.other"/>:</th>
    		<td><form:input path="otherUrl2" id="otherUrl2" size="60"/></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="sys.url3.other"/>:</th>
    		<td><form:input path="otherUrl3" id="otherUrl3" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.url4.other"/>:</th>
    		<td><form:input path="otherUrl4" id="otherUrl4" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.url5.other"/>:</th>
    		<td><form:input path="otherUrl5" id="otherUrl5" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sys.icon.name"/>:</th>
    		<td><form:input path="iconName" id="iconName"/> <fmt:message key="sys.fileName.icon.null.requie"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysListValue.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo" size="8"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysModule.isActive"/>:</th>
		    <td align="left">
		        <spring:bind path="sysModule.isActive">
		        	<win:list name="${status.expression}" listCode="yesno" value="${status.value}" defaultValue="1"/>
		    	</spring:bind>
		    </td>
		</tr>
    	<tr>
    		<th><fmt:message key="sysModule.isValidate"/>:</th>
    		<td>
    			<spring:bind path="sysModule.isValidate">
		        	<win:list name="${status.expression}" listCode="module_validate" value="${status.value}" defaultValue="1"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th>带分隔线:</th>
    		<td><win:list name="isSplit" listCode="yesno" defaultValue="0" value="${sysModule.isSplit }"/> </td>
    	</tr>
    	<tr>
	    	<th>
	        	<fmt:message key="sysCompanyPow.companyCode"/>:
		    </th>
		    <td align="left">
		    	<input type="checkbox" name="selectAll" id="selectAll" onclick="selectAllCompany(this.form)" class="checkbox"/>
		    	<label for="selectAll"><fmt:message key="button.selectAll"/></label>
		    	<br>
		    	<c:forEach items="${alCompanys}" var="alCompanyVar">
		    		<c:set var="isChecked" value="false"/>
		    		<c:forEach items="${sysModule.sysCompanyPows}" var="sysCompanyPowVar">
		    			<c:if test="${sysCompanyPowVar.companyCode==alCompanyVar.companyCode}">
		    				<c:set var="isChecked" value="true"/>
		    			</c:if>
		    		</c:forEach>
		    		<c:if test="${isChecked=='true'}">
		    		<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" checked="checked" class="checkbox" id="companyCode_${alCompanyVar.companyCode }"/>
		    		</c:if>
		    		<c:if test="${isChecked=='false'}">
		    		<input type="checkbox" name="companyCode" value="${alCompanyVar.companyCode }" class="checkbox" id="companyCode_${alCompanyVar.companyCode }"/>
		    		</c:if>    	
		    		<label for="companyCode_${alCompanyVar.companyCode }">${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</label>
		    		<br>
		    	</c:forEach>
		    </td>
	    </tr>
	    <tr>
		    <th>
		    	可用站点:
		    </th>
		    <td align="left">
		    	<c:forEach items="${systemSites}" var="systemSiteVar">
		    		<c:set var="isChecked" value="false"/>
		    		<c:forEach items="${sysModule.sysSitePows}" var="sysSitePowVar">
		    			<c:if test="${sysSitePowVar.siteId==systemSiteVar.key}">
		    				<c:set var="isChecked" value="true"/>
		    			</c:if>
		    		</c:forEach>
		    		<c:if test="${isChecked=='true'}">
		    		<input type="checkbox" name="siteId" value="${systemSiteVar.key }" checked="checked" class="checkbox" id="systemSite_${systemSiteVar.key }"/>
		    		</c:if>
		    		<c:if test="${isChecked=='false'}">
		    		<input type="checkbox" name="siteId" value="${systemSiteVar.key }" class="checkbox" id="systemSite_${systemSiteVar.key }"/>
		    		</c:if>    	
		    		<label for="systemSite_${systemSiteVar.key }"><fmt:message key="${systemSiteVar.value }"/></label>
		    		<br>
		    	</c:forEach>
		    </td>
	    </tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="moduleId"/>
					<form:hidden path="parentId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysModule.moduleId }">
    					<win:power powerCode="deleteSysModule">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysModule')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysModules.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	showLoading();
	return true;
}

function selectAllCompany(theForm){
	var companyCodes=document.getElementsByName("companyCode");
	if(companyCodes!=undefined && companyCodes.length>0){
		for(var i=0;i<companyCodes.length;i++){
			companyCodes[i].checked=theForm.selectAll.checked;
		}
	}
}
$(document).ready(function(){
	$("#btnSelectModule").colorbox({width:"80%", height:"80%"});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });

});
</script>