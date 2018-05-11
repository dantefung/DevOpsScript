<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sysSmsTemplateDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="menu.sys.listSysSmsTemplates"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="sysSmsTemplate" method="post" action="editSysSmsTemplate.jhtml" onsubmit="return validateForm(this)" id="sysSmsTemplateForm">
    
    <spring:bind path="sysSmsTemplate.*">
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
    		<td><c:if test="${empty sysSmsTemplate.templateId}">
			    	<form:select path="companyCode" id="companyCode"  >
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==sysSmsTemplate.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </form:select>
		        </c:if>
		        <c:if test="${not empty sysSmsTemplate.templateId}">
		        	${sysSmsTemplate.companyCode}<form:hidden path="companyCode"/>
		        </c:if></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="alCharacterValue.langCode"/>:</th>
    		<td><select id="characterCode" name="characterCode">
					<option value=""><fmt:message key="sys.choose.language"/></option>
					<c:forEach items="${alCharacterCodings }" var="al">
						<option value="${al.langCode }" <c:if test="${al.langCode==sysSmsTemplate.characterCode}">selected="selected"</c:if>>${al.langName }</option>
					</c:forEach>
				</select> </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="sysDataLog.changeType"/>:</th>
		    <td><c:if test="${empty sysSmsTemplate.templateId}">
			    	<spring:bind path="sysSmsTemplate.typeId">
			        	<win:list name="typeId" listCode="sms_type" value="${status.value}" defaultValue="" showBlankLine="true"/>
			    	</spring:bind>
		    	</c:if>
		    	<c:if test="${not empty sysSmsTemplate.templateId}">
		    		<win:code  listCode="sms_type" value="${sysSmsTemplate.typeId}"/>
		    		<form:hidden path="typeId"/>
		    	</c:if></td>
    	</tr>
    	<tr>
    		<th>内容:</th>
    		<td><form:textarea path="content" id="content" cols="100" rows="8"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="templateId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty sysSmsTemplate.templateId }">
    					<win:power powerCode="deleteSysSmsTemplate">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'SysSmsTemplate')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='sysSmsTemplates.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.companyCode.value==""){
		alert("<fmt:message key="mi.input.select"/><fmt:message key="bdReconsumMoneyReport.company"/>");
		theForm.companyCode.focus();
		return false;
	}
	if(theForm.characterCode.value==""){
		alert("<fmt:message key="mi.input.select"/><fmt:message key="alCharacterValue.langCode"/>");
		theForm.characterCode.focus();
		return false;
	} 
	if('${sysSmsTemplate.templateId}'==""){
		if(theForm.typeId.value==""){
			alert("<fmt:message key="mi.input.select"/><fmt:message key="sysDataLog.changeType"/>");
			theForm.typeId.focus();
			return false;
		}
	}
	if(theForm.content.value==""){
		alert("<fmt:message key="label.pleaseFillIn"/><fmt:message key="amAnnounce.content"/>");
		theForm.content.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>