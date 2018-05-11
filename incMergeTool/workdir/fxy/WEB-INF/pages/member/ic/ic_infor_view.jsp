<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<%
request.setAttribute("vEnter", "\n");
%>

<head>
    <title><fmt:message key="icInformation.editItem"/></title>
    <meta name="heading" content="<fmt:message key="icInformation.editItem"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icInformation" method="post" action="ic_infor_view.jhtml" onsubmit="return validateForm(this)" id="icInformationForm">
    
    <spring:bind path="icInformation.*">
        <c:if test="${not empty status.errorMessages}">
        <div class="alert alert-danger alert-dismissible fade in error">
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
    	<c:if test="${param.strAction =='memberInforDetail'||param.strAction=='editMemberIcInfor' }">
    	<tr>
    		<th class="required"><fmt:message key="icInformation.inforType"/>:</th>
    		<td>
    			<win:list name="inforType" listCode="infor.infortype" defaultValue="" value="${icInformation.inforType }" styleClass="form-control"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.title"/>:</th>
    		<td><form:input path="title" id="title" cssClass="form-control" maxlength="50"/></td>
    	</tr>
    	 
    	<tr>
    		<th class="required"><fmt:message key="icInformation.content"/>:</th>
    		<td><form:textarea path="content" id="content" rows="10" cols="100" cssClass="form-control"/> </td>
    	</tr>
     </c:if>
     <c:if test="${param.strAction =='replyMemberIcInfor' }">
     
     	<tr>
    		<th class="required"><fmt:message key="icInformation.inforType"/>:</th>
    		<td><win:code listCode="infor.infortype"  value="${icInformation.inforType}"/> </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.title"/>:</th>
    		<td>${icInformation.title }</td>
    	</tr>
    	 
    	<tr>
    		<th class="required"><fmt:message key="icInformation.content"/>:</th>
    		<td>${fn:replace(icInformation.content, vEnter, '<br>')}</td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="amMessage.replyContent"/>:</th>
    		<td><form:textarea path="replyContent" id="replyContent" rows="10" cols="100"/> </td>
    	</tr>
     </c:if>
      
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="uniNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" class="btn btn-success" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty icInformation.uniNo }">
    					<win:power powerCode="deleteIcInformation">
    						<button type="submit" name="delete" class="btn btn-default" onclick="bCancel=true;return confirmDelete(this.form,'IcInformation')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" class="btn btn-default" onclick="window.location='ic_infor_list.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.inforType.value==""){
		alert("<fmt:message key='ic.consulting.type.null.requie'/>")
 	
 		theForm.inforType.focus();
 		return false;
 	}
	if(theForm.title.value==""){
		alert("<fmt:message key='ic.title.null.requie'/>")
 		theForm.title.focus();
 		return false;
 	}
	if(theForm.title.value.length>50){
		alert("标题长度不能超过50字符")
 		theForm.title.focus();
 		return false;
 	}
	if(theForm.content.value=="" || theForm.content.value.length>500){
		alert("<fmt:message key='ic.content.length.null.requie'/>")
 		theForm.content.focus();
 		return false;
 	}
	if(theForm.replyContent.value=="" || theForm.replyContent.value.length>500){
		alert("<fmt:message key='ic.content.reply.length.null.requie'/>")
 		theForm.replyContent.focus();
 		return false;
 	}
	 
	//其它验证
	showLoading();
	return true;
}
</script>