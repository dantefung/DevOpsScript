<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript" src="scripts/validate.js"></script>
<script type="text/javascript" src="<c:url value="/dwr/interface/alCompanyManager.js"/>"></script>
<script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
<script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
<head>
    <title><fmt:message key="sysDataLogDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="sysDataLogDetail.heading"/>"/>
</head>

<div class="contentBody">
	<form action="sysManagerPowerClear.jhtml" method="post" name="formCloneByUser" id="formCloneByUser" onsubmit="return validateCloneByCompany(this)">
	
	<table border="0" class="detail">
		<tr>
			<th><fmt:message key="mi.choose.delete.power"/>:</th>
			<td><fmt:message key="notice.copy.from.company"/>(${param.userCode }):
		  </td>
		</tr>
		<tr>
			<th>&nbsp;</th>
			<td>
				<select name="userCompany" size="10" multiple="multiple" id="userCompany" style="width:200px;height:140px;">
				<c:forEach items="${alCompanys }" var="alCompanyVar">
					<option value="${alCompanyVar.key }">${alCompanyVar.value }</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th class="command"><fmt:message key="sysOperationLog.moduleName" /></th>
			<td class="command">
				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="operation.button.delete"/></button>
				<button type="button" name="cancel" onclick="window.location='/corp/sysManagers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
				<input type="hidden" name="strAction" value="clearSysManagerPower"/>
				<input type="hidden" name="userCode" value="${param.userCode }"/>		</td>
		</tr>
	</table>
	</form>
</div>

<script>
function validateCloneByCompany(theForm){
	if(bCancel){
		showLoading();
		return true;
	}
	
	if(theForm.userCompany.value==""){
		alert("<fmt:message key='mi.member.need.clear.power'/>.");
		return false;
	}
	
	if(!confirm("<fmt:message key='mi.clear.power.member'/>?")){
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
</script>