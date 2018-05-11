<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
 <script language="javascript" src="${ctx }/scripts/validate.js"></script> 

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<head>
    <title><fmt:message key="sysManagerDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.systemManage"/> >> <fmt:message key="menu.sys.sysAccounts"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysManager" method="post" action="editSysManager.jhtml" onsubmit="return validateOthers(this)" id="sysManagerForm">
    
    <spring:bind path="sysManager.*">
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
    	<tr><th><fmt:message key="sys.company.code"/>:</th>
	    <td>
	        <form:hidden path="companyCode"/>
	    <span id="spnCompanyCode">${sysManager.companyCode }</span>    </td></tr>
    	<tr>
    		<th class="required"><fmt:message key="sysDepartment.departmentName"/>:</th>
    		<td><form:hidden path="departmentId"/>
		    	<span id="spnDepartmentName">${sysDepartment.departmentName }</span>
			    <%-- <button type="button" name="search" onclick="selectDepartment(this.form)"><fmt:message key="button.select"/></button> --%>
			    <a href="sysTreeDepartmentSelect.jhtml?action=sysSelectDepartment&departmentId=${sysDepartment.departmentId }" id="btnSelectModule" name="view"><fmt:message key="button.select"/></a>
		    </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.userCode"/>: </th>
    		<td><c:if test="${param.strAction !='editSysManager'}">
		        <form:input path="userCode"/>
		        </c:if>
		        <c:if test="${param.strAction=='editSysManager'}">
		        <form:input path="userCode" readonly="true" cssClass="readonly"/>
		    </c:if></td>
    	</tr>
    	<tr><th class="required">
	        <fmt:message  key="sysUser.userName"/>:
		    </th>
		    <td>
		    <input type="text" name="userName" id="userName" value="${sysUser.userName}" />
		    </td></tr>
		    
		    <c:if test="${param.strAction=='addSysManager'}">
		    <tr><th class="required">
		        <fmt:message key="sysUser.password"/>
		    </th>
		    <td>
		      <input type="password" name="password" value="${sysUser.password }"/>&nbsp;<fmt:message key="sys.menuDefaultLimt"/><fmt:message key="sysUser.password"/>:<font color='red' size='3' ><b>${sysUser.password}</b></font>    </td></tr>
		    
		    <tr><th class="required">
		        <fmt:message  key="sysUser.repeatPassword"/>:
		    </th>
		    <td>
		        <input type="password" value="${sysUser.password}" name="repeatPassword" id="repeatPassword"/>    </td></tr>
		    </c:if>
		
    	<tr>
    		<th><fmt:message key="sysUser.email"/>:</th>
    		<td><form:input path="email" id="email"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="alCompany.phone"/>:</th>
    		<td><form:input path="tel" id="tel"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysUser.mobile"/>:</th>
    		<td><form:input path="mobile" id="mobile"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysDepartment.fax"/>:</th>
    		<td><form:input path="fax" id="fax"/></td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="sysManager.countryCode"/>:</th>
    		<td>
    			<select name="countryCode"><option value=""></option>
    			<c:forEach items="${alCountrys }" var="alCountry">
    				<option value="${alCountry.regionCode }" <c:if test="${alCountry.regionCode == param.address }">selected="selected" </c:if> >${alCountry.regionName }</option>
    			</c:forEach>
    			</select>
    		</td>
    	</tr> --%>
    	<tr>
    		<th><fmt:message key="sysUser.address"/>:</th>
    		<td><form:input path="address" id="address"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysModule.orderNo"/>:</th>
    		<td><form:input path="depOrder" id="depOrder"/></td>
    	</tr>
    	 <tr><th><fmt:message  key="sysUser.defCharacterCoding"/></th><td>
		   	<select name="defLang">
    			<c:forEach items="${alLangCodeList }" var="langCode">
    				<option value="${langCode.langCode }" <c:if test="${langCode.langCode == sysUser.defLang }">selected="selected" </c:if> >${langCode.langName }</option>
    			</c:forEach>
    			</select>    </td></tr>
    	 <tr>
    	 <tr>
    		<th class="required"><fmt:message key="label.no.login"/>:</th>
    		<td><win:list listCode="sysuser.suspendstatus" name="suspendStatus" value="${sysUser.suspendStatus }" defaultValue="0"/></td>
    	</tr>
    	<th><fmt:message  key="title.allowed.ip"/></th>
    	<td><table border="0" class="detailSub">
			<tr>
				<td colspan="3"><input type="checkbox" name="ipCheck" id="ipCheck"<c:if test="${sysUser.ipCheck=='1' }"> checked</c:if> value="1"/><LABEL for="ipCheck"><fmt:message key="title.check.login.ip"/></LABEL></td>
				</tr>
			<tr>
				<td rowspan="2">
				<select name="allowedIps" size="6" id="allowedIps" style="width:120px;">
				<c:forEach items="${sysUserIps}" var="sysUserIpVar">
					<option value="${sysUserIpVar.ipAddress}">${sysUserIpVar.ipAddress}</option>
				</c:forEach>
				</select>
				</td>
				<td>
				<button type="button" name="save" onclick="addNewIP(this.form)"><fmt:message key="operation.button.add"/></button>
				<input type="hidden" name="allowedIpStr"/>
				</td>
				<td><input type="text" name="newIP" id="newIP" /></td>
			</tr>
			<tr>
				<td><button type="button" name="cancel" onclick="removeIP(this.form)"><fmt:message key="operation.button.delete"/></button></td>
				<td>&nbsp;</td>
			</tr>
		</table>
   		</td>
   	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" id="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<%-- <c:if test="${not empty sysManager.userCode }">
    					<win:power powerCode="deleteSysManager">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysManager')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if> --%>
    				<c:if test="${param.modifyType == 'account'}">
    					<input type="hidden" name="freezeStatus" value="0" />
    					<button type="button" name="cancel" onclick="window.location='sysManagers.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
    				</c:if>
    				<c:if test="${empty param.modifyType}">
    					<input type="hidden" name="suspendStatus" id="suspendStatus" value="0"/>
    					<input type="hidden" name="freezeStatus" value="0" />
						<button type="button" class="button" name="cancel" onclick="window.location='sysManagerOrg.jhtml?companyCode=${sysManager.companyCode }&departmentId=${sysDepartment.departmentId }&needReload=1'" ><fmt:message key="operation.button.cancel"/></button>
					</c:if>
                </div>
    		</td>
    	</tr>
    </table>
    <input type="hidden" name="ipCheckValue" id="ipCheckValue" value="0"/>
    <input type="hidden" name="modifyType" value="${param.modifyType }" />
    </form:form>
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnSelectModule").colorbox({width:"25%", height:"60%"});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}
function validateOthers(theForm){
	if(theForm.departmentId.value==""){
		alert("请选择用户所属部门");
		return false;
	}
	if(theForm.userCode.value=="" || !isValidateUserCode(theForm.userCode.value) || theForm.userCode.value.length>20){
		alert("<fmt:message key="sysUser.userCode.required"/>");
		theForm.userCode.focus();
		return false;
	}
	if(document.getElementById("userName").value==""){
		alert("<fmt:message key="sysUser.userName.required"/>");
		document.getElementById("userName").focus();
		return false;
	}
	if(theForm.mobile.value==""){
		alert("请输入手机号");
   		theForm.mobile.focus();
   		return false;
	}
	
	if(theForm.ipCheck.checked){
		theForm.ipCheckValue.value = "1";
	}
	if(theForm.depOrder.value==""){
		alert("<fmt:message key="sysModule.depOrder.required"/>");
   		theForm.depOrder.focus();
   		return false;
	}
	if(theForm.depOrder.value!="" && !isUnsignedInteger(theForm.depOrder.value)){
   		alert("<fmt:message key="sysModule.depOrder.error"/>");
   		theForm.depOrder.focus();
   		return false;
   	}
   	var ipStr="";
   	for(var i=0;i<theForm.allowedIps.options.length;i++){
   		if(i>0){
   			ipStr+=",";
   		}
   		ipStr+=theForm.allowedIps.options[i].value;
   	}
   	theForm.allowedIpStr.value=ipStr;

	if(document.getElementById("strAction").value=='addSysManager'){
		if(document.getElementById("password").value==""){
			alert("<fmt:message key="sysUser.password.required"/>");
			document.getElementById("password").focus();
			return false;
		}
				
		if(theForm.repeatPassword.value==""){
			alert("<fmt:message key="sysUser.repeatPassword.required"/>");
			theForm.repeatPassword.focus();
			return false;
		}
		if(document.getElementById("password").value!=theForm.repeatPassword.value){
			alert("<fmt:message key="error.password.not.accord"/>");
			document.getElementById("password").focus();
			return false;
		}
	}

	showLoading();
	return true;
}



function addNewIP(theForm){
	if(theForm.newIP.value=="" || !isIP(theForm.newIP.value)){
		alert("<fmt:message key='sys.ipAddrees.null.requie' />");
		return;
	}
	var newOption=new Option(theForm.newIP.value,theForm.newIP.value);
	try{
        theForm.allowedIps.add(newOption);
    }catch(e){
        theForm.allowedIps.add(newOption, null);
    }
}

function removeIP(theForm){
	var selectedIndex=theForm.allowedIps.selectedIndex;
	if(selectedIndex>=0){
		theForm.allowedIps.remove(selectedIndex);
	}
}

</script>