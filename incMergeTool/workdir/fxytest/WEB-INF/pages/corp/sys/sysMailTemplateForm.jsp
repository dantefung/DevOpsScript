<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="邮件模板管理"/></title>
    <meta name="heading" content="<fmt:message key="邮件模板管理"/>"/>
</head>

<script language="javascript" src="${ctx }/scripts/validate.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<div class="contentBody">
    <form:form commandName="sysMailTemplate" method="post" action="editSysMailTemplate.jhtml"  id="sysMailTemplateForm">
    
    <spring:bind path="sysMailTemplate.*">
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
    		<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
    		<td><c:if test="${empty sysMailTemplate.templateId}">
			    	<form:select path="companyCode" id="companyCode"  >
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==sysMailTemplate.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </form:select>
		        </c:if>
		        <c:if test="${not empty sysMailTemplate.templateId}">
		        	${sysMailTemplate.companyCode}<form:hidden path="companyCode"/>
		        </c:if></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alCharacterValue.langCode"/>:</th>
    		<td><select id="characterCode" name="characterCode">
					<option value=""><fmt:message key="sys.choose.language"/></option>
					<c:forEach items="${alCharacterCodings }" var="al">
						<option value="${al.langCode }" <c:if test="${al.langCode==sysMailTemplate.characterCode}">selected="selected"</c:if>>${al.langName }</option>
					</c:forEach>
				</select> </td>
    	</tr>
    	<%-- <tr>
    		<th><fmt:message key="bdReconsumMoneyReport.countryAndArea"/>:</th>
    		<td><c:if test="${empty sysMailTemplate.templateId}">
		            <form:select path="countryCode" id="countryCode" >
		                <option value=""></option>
		                <c:forEach items="${alCountrys}" var="alCountryVar">
		                    <option value="${alCountryVar.countryCode }">${alCountryVar.countryCode } - ${alCountryVar.countryName }</option>
		                </c:forEach>
		            </form:select>
		        </c:if></td>
    	</tr> --%>
    	<tr>
    		<th class="required"><fmt:message key="sysDataLog.changeType"/>:</th>
		    <td>
		    	<c:if test="${empty sysMailTemplate.templateId}">
			    	<spring:bind path="sysMailTemplate.typeId">
			        	<win:list name="${status.expression}" listCode="email_type" value="${status.value}" defaultValue="" showBlankLine="true"/>
			    	</spring:bind>
		    	</c:if>
		    	<c:if test="${not empty sysMailTemplate.templateId}">
		    		<win:code listCode="email_type" value="${sysMailTemplate.typeId}"/>
		    		<form:hidden path="typeId"/>
		    	</c:if>
		    </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mail.sender.email"/>:</th>
    		<td><form:input path="fromEmail" id="fromEmail"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mail.sender.name"/>:</th>
    		<td><form:input path="fromName" id="fromName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mail.sender.secredtSend"/>:</th>
    		<td><form:input path="secretSend" id="secretSend"/></td>
    	</tr>
 	    <tr>
    		<th><fmt:message key="mail.cc.secredtSend"/>:</th>
    		<td><form:input path="ccEmail" id="ccEmail"/></td>
    	</tr>
    	<tr>
    		<th class="required">邮件标题:</th>
    		<td><form:input path="mailTitle" id="mailTitle" size="80"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.text.content"/>:</th>
    		<td><form:textarea path="textContent" id="textContent" cols="100" rows="16"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="label.html.content"/>:</th>
    		<td>
    			<form:textarea path="htmlContent" id="htmlContent" cols="100" rows="16"/>
    			<a  href="#"  id="click" name="view"><fmt:message key="button.preview"/></a>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="templateId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="button" name="save" onclick="validateForm()"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysMailTemplate.templateId }">
    					<win:power powerCode="deleteSysMailTemplate">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysMailTemplate')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysMailTemplates.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
<form name="_frm" id="_frm" action="/corp/sysMailTemplateContentView.jhtml" method="get">
	<input type="hidden" name="content" id="content">
</form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        }
    });
});

$("#click").click(function(){
	$.colorbox({html:document.getElementById("htmlContent").value, width:"60%"});
});

function validateForm() {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
    validateTheForm(document.getElementById("sysMailTemplateForm"));
}
function validateTheForm(theForm){
	if(theForm.companyCode.value==""){
		alert("<fmt:message key="please.select.company"/>");
		return ;
	}
	if(theForm.characterCode.value==""){
		alert("<fmt:message key="socket.empty.language.err"/>");
		return ;
	}
	if(theForm.typeId.value==""){
		alert("<fmt:message key="alCharacterType.please.select.type"/>");
		return ;
	}
	if(theForm.fromEmail.value=="" || !isEmail(theForm.fromEmail.value)){
		alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="mail.sender.email"/></fmt:param></fmt:message>");
		theForm.fromEmail.focus();
		return ;
	}
	if(theForm.ccEmail.value!="" ){
		if(!isEmail(theForm.ccEmail.value)){
			alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="mail.sender.email"/></fmt:param></fmt:message>");
			theForm.ccEmail.focus();
			return ;
		}
	}
	if(theForm.fromName.value==""){
		alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="mail.sender.name"/></fmt:param></fmt:message>");
		theForm.fromName.focus();
		return ;
	}
	if(theForm.mailTitle.value==""){
		alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="poMemberOrderFlowType.moftTitle"/></fmt:param></fmt:message>");
		theForm.mailTitle.focus();
		return ;
	}
	if(theForm.textContent.value==""){
		alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="label.text.content"/></fmt:param></fmt:message>");
		theForm.textContent.focus();
		return ;
	}
	if(theForm.htmlContent.value==""){
		alert("<fmt:message key="isNotNull"><fmt:param><fmt:message key="label.html.content"/></fmt:param></fmt:message>");
		theForm.htmlContent.focus();
		return ;
	}
	theForm.submit()
}

</script>