<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.sys.sysAccounts"/>"/>
</head>
<form:form commandName="sysUser" method="post" action="sysPowerSimple.jhtml" onsubmit="return validateOthers(this)" id="sysPowerForm" name="sysPowerForm">
<input type="hidden" name="userCode" value="${param.userCode }"/>
<input type="hidden" name="strAction" value="sysPowerSimple"/>

<table width="100%" height="100%" border="0">
	<tr>
		<td height="20">
		<fmt:message key="give.power.to">
			<fmt:param value="${param.userCode}"></fmt:param>
		</fmt:message>. 
		<fmt:message key="please.select.company"/>:
			<select name="companyCode" onChange="changeCompany(this.form)">
				<c:forEach items="${alCompanys}" var="alCompanyVar">
					<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName}</option>
				</c:forEach>
			</select>		</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
<ec:table 
	tableId="sysModuleListTable"
	items="sysModules"
	var="sysModule"
	form="sysPowerForm"
	width="100%"
	sortable="false" autoIncludeParameters="false" imagePath="/wecs/images/extremetable/*.gif" showPagination="false" showStatusBar="false">
	<ec:row>
		<ec:column alias="moduleId" headerCell="selectAll" style="width:5px;">
			<input type="checkbox" name="moduleId" value="${sysModule.module_id}" class="checkbox" <c:if test="${not empty sysModule.slave_power_id}"> checked</c:if>/>
		</ec:column>
		<ec:column property="module_name" title="sysModule.moduleName" >
			<c:forEach begin="1" end="${sysModule.tree_level-1}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
			<c:if test="${sysModule.tree_level==1}"><font color="#990000"></c:if>
			<fmt:message key="${sysModule.module_name}"/>
			<c:if test="${sysModule.tree_level==1}"></font></c:if>
		</ec:column>
	</ec:row>
</ec:table>	

<table width="100%">
    <tr>
		<td align="center">
			<win:power powerCode="sysPowerSimple">
				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.submit"/></button>
			</win:power>
	
			<button type="button" name="cancel" onclick="toback()"><fmt:message key="operation.button.return"/></button>
		</td>
	</tr>

</table>

</form:form>

<script type="text/javascript">
function validateOthers(theForm){
	showLoading();
	return true;
}

function toback(){
    this.location='<c:url value="/corp/sysManagers.jhtml"/>?needReload=1';
}

function changeCompany(theForm){
	window.location="/corp/sysPowerSimple.jhtml?userCode=${param.userCode}&companyCode="+theForm.companyCode.value;
}
</script>

<v:javascript formName="sysRole" cdata="false" dynamicJavascript="true" staticJavascript="false"/>
<script type="text/javascript"  src="<c:url value="/scripts/validator.jsp"/>"></script>