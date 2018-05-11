<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemPowerManage.powerManage"/>"/>

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
<form action="sysPowerFrm.jhtml" method="post" name="myPowerForm">
	<input type="hidden" name="strAction" value="sysMyPowerManager"/>
	<input type="hidden" name="masterUserCode" value="${param.masterUserCode }"/>
	<input type="hidden" name="selectedModule" value=""/>
	<input type="hidden" name="selectedSalveUserCode" value=""/>
	
	<table width="100%" height="100%" border="0" class="detail">
		<tr>
			<td height="20">
			<fmt:message key="please.select.company"/>:
				<select name="companyCode" onChange="changeCompany(this.form)">
					<c:forEach items="${alCompanys}" var="alCompanyVar">
						<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName}</option>
					</c:forEach>
				</select>		</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td height="20">1.
					<fmt:message key="sys.power.myMan.title"/>:
					<button onclick="window.frmManTree.expandAll(true);" type="button" name="expand">展开</button>
					<button onclick="window.frmManTree.expandAll(false);" type="button" name="close">折叠</button>
			</td>
			<td>2.
					<fmt:message key="sys.power.myMod.title"/>:
					<button onclick="window.frmModTree.expandAll(true);" type="button" name="expand">展开</button>
					<button onclick="window.frmModTree.expandAll(false);" type="button" name="close">折叠</button>
			</td>
			<td>3.
					<fmt:message key="sys.power.myMansMan.title"/>:
					<button onclick="window.frmMansManTree.expandAll(true);" type="button" name="expand">展开</button>
					<button onclick="window.frmMansManTree.expandAll(false);" type="button" name="close">折叠</button>
			</td>
		</tr>
		<tr>
			<td width="30%" height="500">
				<iframe src="/corp/sysMyManTree.jhtml?companyCode=${companyCode }&masterUserCode=${param.masterUserCode }" name="frmManTree" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0" width="100%" height="100%" class="frmStyle" ></iframe>		</td>
			<td width="40%"  height="500">
				<iframe src="/corp/sysMyModTree.jhtml?companyCode=${companyCode }&slaveUserCode=${param.masterUserCode }" name="frmModTree" frameborder="0" scrolling="yes" marginwidth="0" width="100%" height="100%" class="frmStyle"></iframe>		</td>
			<td width="30%"  height="500">
				<iframe src="/corp/sysMyMansManTree.jhtml?companyCode=${companyCode }&slaveUserCode=${param.masterUserCode }" name="frmMansManTree" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0" width="100%" height="100%" class="frmStyle"></iframe>		</td>
		</tr>
		<tr>
			<td height="20" colspan="3">
				<table width="100%" class="detail">
					<tr>
					<td class="command" align="center">
						<win:power powerCode="sysMyPowerManager">
							<button type="button" name="save"  onClick="saveMyPower(this.form)"><fmt:message key="button.save"/></button>
						</win:power>
					</td>
					</tr>
				</table></td>
		</tr>
	</table>
</form>
<script type="text/javascript">
$(function() {
	$("button[name='expand']",".detail").button({
        icons: {
            primary: "ui-icon-add"
        },
        text: false
    });
	
	$("button[name='close']",".detail").button({
        icons: {
            primary: "ui-icon-close"
        },
        text: false
    });
});
function saveMyPower(theForm){
	if(theForm.masterUserCode.value==""){
		alert("<fmt:message key="sysPower.please.operation.userCode"/>");
		return;
	}
	
	var selectedModule=window.frmModTree.getChecks();
	theForm.selectedModule.value=selectedModule;
	
	var selectedSalveUserCode=window.frmMansManTree.getChecks();
	theForm.selectedSalveUserCode.value=selectedSalveUserCode;
	theForm.submit();	
}

function changeCompany(theForm){
	window.frmManTree.location="/corp/sysMyManTree.jhtml?companyCode="+theForm.companyCode.value;
	window.frmModTree.location="/corp/sysMyModTree.jhtml?companyCode="+theForm.companyCode.value;
	window.frmMansManTree.location="/corp/sysMyMansManTree.jhtml?companyCode="+theForm.companyCode.value;
}
</script>
</body>
</html>
