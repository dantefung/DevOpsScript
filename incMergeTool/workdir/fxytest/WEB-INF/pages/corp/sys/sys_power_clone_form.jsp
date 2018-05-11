<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysRoleDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.sys.cloneSysPower"/>"/>
</head>

<script language="javascript" src="scripts/validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlCompanyAjax.js"></script>

<form action="sysPowerClone.jhtml" method="post" name="formCloneByUser" id="formCloneByUser" onsubmit="return validateCloneByUser(this)">

<table width="100%" border="0" class="detail">
	<tr>
		<td colspan="2" class="title"><fmt:message key="title.copy.to.user"/></td>
		</tr>
	<tr>
		<td align="right"><fmt:message key="notice.select.user"/>:</td>
		<td><table border="0" cellspacing="0" class="inSideTable">
			<tr>
				<td><fmt:message key="notice.select.from.user"/>:</td>
				<td><fmt:message key="notice.copy.from.company"/>:</td>
				<td>&nbsp;</td>
				<td><fmt:message key="info.select.copy.to.user"/>:</td>
			</tr>
			<tr>
				<td><input type="text" name="fromUserKeyword" id="fromUserKeyword" style="width:196px;" onkeyup="filterUser(this,this.form.fromUser,event)"/></td>
				<td><fmt:message key="info.select.copy.company"/></td>
				<td>&nbsp;</td>
				<td><input type="text" name="toUserKeyword" id="toUserKeyword" style="width:196px;" onkeyup="filterUser(this,this.form.toUser,event)"/></td>
			</tr>
			<tr>
				<td valign="top"><select name="fromUser" size="10" id="fromUser" style="width:200px;height:140px;" onchange="changeFromUser(this.value, this.form.fromUserCompany)">
				</select></td>
				<td valign="top"><select name="fromUserCompany" size="10" multiple="multiple" id="fromUserCompany1" style="width:200px;height:140px;"></select>				</td>
				<td>=&gt;</td>
				<td valign="top"><select name="toUser" size="10" multiple="multiple" id="toUser" style="width:200px;height:140px;">
				</select></td>
			</tr>

		</table></td>
	</tr>
	<tr>
		<td class="command" align="right"><fmt:message key="sysOperationLog.moduleName" />:</td>
		<td class="command"><button type="submit" name="save" ><fmt:message key="button.copy"/></button>
			<input name="doType" type="hidden" id="doType" value="byUser" /></td>
	</tr>
</table>
</form>
<br />
<form action="sysPowerClone.jhtml" method="post" name="formCloneByCompany" id="formCloneByCompany" onsubmit="return validateCloneByCompany(this)">
	<table width="100%" border="0" class="detail">
		<tr>
			<td colspan="2" class="title"><fmt:message key="title.copy.to.company"/></td>
		</tr>
		<tr>
			<td align="right"><fmt:message key="notice.select.user"/>:</td>
			<td><table border="0" cellspacing="0" class="inSideTable">
				<tr>
					<td><fmt:message key="notice.select.from.user"/>:</td>
					<td><fmt:message key="notice.copy.from.company"/>:</td>
					<td>&nbsp;</td>
					<td><fmt:message key="please.select.copy.to.company"/>:</td>
				</tr>
				<tr>
					<td><input type="text" name="fromUserKeyword" id="fromUserKeyword" style="width:196px;" onkeyup="filterUser(this,this.form.fromUser,event)"/></td>
					<td><fmt:message key="info.select.copy.company"/></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td valign="top"><select name="fromUser" size="10" id="fromUser" style="width:200px;height:140px;" onchange="changeFromUser(this.value, this.form.fromUserCompany)">
					</select></td>
					<td valign="top"><select name="fromUserCompany" size="10" id="fromUserCompany2" style="width:200px;height:140px;"></select>
					</td>
					<td>=&gt;</td>
					<td valign="top"><select name="toUserCompany" size="10" multiple="multiple" id="toUserCompany" style="width:200px;height:140px;">
						<c:forEach items="${alCompanys}" var="toCompany">
							<option value="${toCompany.companyCode}">[${toCompany.companyCode}]${toCompany.companyName}</option>
						</c:forEach>
					</select></td>
				</tr>
			</table></td>
		</tr>
		<tr>
			<td class="command" align="right"><fmt:message key="sysOperationLog.moduleName" />:</td>
			<td class="command">
				<button type="submit" name="save" ><fmt:message key="button.copy"/></button>
				<input name="doType" type="hidden" id="doType" value="byCompany" /></td>
		</tr>
	</table>
</form>

<script>
var myUsers=[<c:forEach items="${sysManagers}" var="fromSysManager" varStatus="sysManagerStatus"><c:if test="${sysManagerStatus.index>0}">,</c:if>{key:"${fromSysManager.user_code}",label:"${fromSysManager.user_name}(${fromSysManager.user_code})"}</c:forEach>];
window.onload=function(){
	reloadUserSelect(document.formCloneByUser.fromUser,"");
	reloadUserSelect(document.formCloneByUser.toUser,"");
	reloadUserSelect(document.formCloneByCompany.fromUser,"");
}

function reloadUserSelect(obj, searchText){
	obj.options.length=0;
	for(var i=0;i<myUsers.length;i++){
		if(searchText=="" || myUsers[i].label.indexOf(searchText)!=-1){
			var varItem = new Option(myUsers[i].label,myUsers[i].key);      
        	obj.options.add(varItem);
		}
	}
}

function filterUser(obj, listObj, e){
	var _key;
	if (e == null) { // ie
		_key = event.keyCode;
	} else { // firefox
		_key = e.which;
	}

	if(_key != 13){
		reloadUserSelect(listObj,obj.value);
	}
}
var _targetObj = null;
function changeFromUser(userCode, targetObj){
	_targetObj = targetObj;
	dwr.util.removeAllOptions(targetObj.id);
	AlCompanyAjax.getMyAlCompanysToMap(userCode,{
	  	callback: getDataFromServerCallBack
	  });
	
}

function getDataFromServerCallBack(dataFromServer) {
	dwr.util.addOptions(_targetObj.id, dataFromServer);
}
function validateCloneByUser(theForm){
	if(theForm.fromUser.value==""){
		alert("<fmt:message key="notice.select.from.user"/>");
		return false;
	}
	
	if(theForm.fromUserCompany.value==""){
		alert("<fmt:message key="info.select.copy.company"/>");
		return false;
	}
	
	if(theForm.toUser.value==""){
		alert("<fmt:message key="info.select.copy.to.user"/>");
		return false;
	}
	
	if(!confirm("<fmt:message key="confirm.clone.power"/>")){
		return false;
	}
	showLoading();
	return true;
}

function validateCloneByCompany(theForm){
	if(theForm.fromUser.value==""){
		alert("<fmt:message key="notice.select.from.user"/>");
		return false;
	}
	
	if(theForm.fromUserCompany.value==""){
		alert("<fmt:message key="info.select.copy.company"/>");
		return false;
	}
	
	if(theForm.toUserCompany.value==""){
		alert("<fmt:message key="please.select.copy.to.company"/>");
		return false;
	}
	
	if(!confirm("<fmt:message key="confirm.clone.power"/>")){
		return false;
	}
	showLoading();
	return true;
}
</script>