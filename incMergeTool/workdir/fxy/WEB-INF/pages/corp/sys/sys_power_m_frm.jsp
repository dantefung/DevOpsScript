<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.sys.sysPowerMFrm"/>"/>

<!-- 样式删除 -->
<style type="text/css">
html {
	height:100%;
	width:100%;
}
body{
	overflow:hidden;
}

.frmStyle{
	 border :1px solid Silver;
}
</style>
</head>
<body>

<form action="sysPowerModuleFrm.jhtml" method="post" name="myPowerForm">
<input type="hidden" name="strAction" value="sysPowerMFrm"/>
<input type="hidden" name="selectedUserCode" value=""/>
<input type="hidden" name="moduleId" value=""/>

<table width="100%" height="100%" border="0">
	<tr>
		<td height="20" colspan="2">
			<fmt:message key="please.select.company"/>:
			<select name="companyCode" onChange="changeCompany(this.form)">
				<c:forEach items="${alCompanys}" var="alCompanyVar">
					<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName}</option>
				</c:forEach>
			</select>		</td>
	</tr>
	<tr>
		<td height="20">1.<fmt:message key="sys.power.m.myMod.title"/>:</td>
		<td>2.<fmt:message key="sys.power.m.myMan.title"/>:</td>
	</tr>
	<tr>
		<td width="50%" height="500">
			<iframe src="/corp/sysMyModMTree.jhtml?companyCode=${companyCode }&moduleId=${param.moduleId }" name="frmModTree" frameborder="0" scrolling="auto" marginwidth="0" width="100%" height="100%" class="frmStyle"></iframe>		</td>
		<td width="50%" height="500">
			<iframe src="/corp/sysMyManMTree.jhtml?companyCode=${companyCode }&moduleId=${param.moduleId }" name="frmManMTree" frameborder="0" scrolling="auto" marginwidth="0" marginheight="0" width="100%" height="100%" class="frmStyle"></iframe>		</td>
	</tr>
	<tr>
		<td height="20" colspan="2">
			<table width="100%" class="detail">
				<tr>
				<td class="command" align="center">
					<win:power powerCode="sysPowerMFrm">
						<button type="button" name="save"  onClick="saveMyPower(this.form)"><fmt:message key="button.save"/></button>
					</win:power>
				</td>
				</tr>
			</table></td>
	</tr>
</table>
</form>

<script type="text/javascript">
function saveMyPower(theForm){
	var selectNode_id=window.frmModTree.valideSelectNode();
	if(selectNode_id == null){
		alert("<fmt:message key="sysPower.please.operation.userCode"/>");
		return;
	}
	//var sourceId = selectedModule.sourceIndex.substr(selectedModule.sourceIndex.indexOf(window.frmModTree.tree.divider) + window.frmModTree.tree.divider.length);
	//theForm.moduleId.value=sourceId;
	theForm.moduleId.value=selectNode_id;
	theForm.selectedUserCode.value=window.frmManMTree.getChecks();
	theForm.submit();	
}

function changeCompany(theForm){
	window.frmModTree.location="/corp/sysMyModMTree.jhtml?companyCode="+theForm.companyCode.value;
	window.frmManMTree.location="/corp/sysTreeMyManM.jhtml?companyCode="+theForm.companyCode.value;
}
</script>
</body>
