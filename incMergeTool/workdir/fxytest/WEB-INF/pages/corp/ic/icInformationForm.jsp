<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<%
request.setAttribute("vEnter", "\n");
%>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="icInformation" method="post" action="editIcInformation.jhtml" onsubmit="return validateForm(this)" id="icInformationForm">
    
    <spring:bind path="icInformation.*">
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
    	
    	<!-- 新增或编辑页面 -->
    	
    	<c:if test="${param.strAction=='addIcInformation' || param.strAction=='editIcInformation' }">
    	<head>
         <title><fmt:message key="icInformation.addmessage"/></title>
         <meta name="heading" content="<fmt:message key="icInformation.addmessage"/>"/>
        </head>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.inforType"/>:</th>
    		<td><win:list listCode="infor.infortype" name="inforType"	id="inforType" showBlankLine="false" value="${icInformation.inforType}"
								  defaultValue="0" /> </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.title"/>:</th>
    		<td><form:input path="title" id="title" size="47"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fi.jshyba"/>:</th>
    		<td>
    		 	<input type="text" name='userCode' id='userCode' value="${icInformation.userCode}"/> 
		        <img src="<c:url value="${ctx}/themes/${theme }/images/l_1.gif"/>" id="person"  onclick="searchUser('agentAndMember')" style="cursor: pointer;"  /> 
		        <input type="text" name="userName"   id="userName" value="${icInformation.userName}"/>
				</td>
    	 
    	</tr>
    	 
    	<tr>
    		<th class="required"><fmt:message key="icInformation.content"/>:</th>
    		<td><form:textarea path="content" id="content" rows="10" cols="100"/> </td>
    	</tr>
    	</c:if>
    	
    	<!-- 指派页面 -->
    	
    	<c:if test="${param.strAction=='controlIcInformation' }">
    	<head>
         <title><fmt:message key="icInformation.control"/></title>
         <meta name="heading" content="<fmt:message key="icInformation.control"/>"/>
        </head>
    	<tr>
    		<th class="required"><fmt:message key="fiPayAdvice.userCode"/>:</th>
    		<td>
    		 	<input type="text" name='replyUser' id='replyUser' value="${icInformation.replyUser}"/> 
		        <img src="<c:url value="${ctx}/themes/${theme }/images/l_1.gif"/>" id="person"  onclick="searchUser('corpMember')" style="cursor: pointer;"  /> 
		        <input type="text" name="replyName"   id="replyName" value="${icInformation.replyName}"/>   
			</td>
    	
    	</tr>
    	</c:if>
    	
    	<!-- 回复页面 -->
    	<c:if test="${param.strAction=='replyIcInformation' }">
    	<head>
         <title><fmt:message key="icInformation.reply"/></title>
         <meta name="heading" content="<fmt:message key="icInformation.reply"/>"/>
        </head>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.inforType"/>:</th>
    		<td><win:code listCode="infor.infortype"  value="${icInformation.inforType}"/> </td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icInformation.title"/>:</th>
    		<td>${icInformation.title }</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="fiPayAdvice.userCode"/>:</th>
    		<td>
    		${icInformation.userCode } - ${icInformation.userName }
    		 </td>
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
    	
    	<%
    	    //获取指派selectedUniNo2s
    	    String selectedUniNo2s = request.getParameter("selectedUniNo2s");   
    	    request.setAttribute("selectedUniNo2s",selectedUniNo2s);
    	%>  	
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="uniNo"/>
    				<c:if test="${empty icInformation.uniNo}">
    				<input type="hidden" name="selectedUniNo2s" value="<%=request.getAttribute("selectedUniNo2s")%>"/>
    				</c:if>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    				<c:if test="${param.strAction=='addIcInformation'  }">
    					<button type="submit" name="save" onclick="bCancel=true;return confirmSubmit(this.form,'addIcInformation')"><fmt:message key="button.save"/></button>
    				</c:if>
    				<c:if test="${param.strAction=='editIcInformation' }">
    					<button type="submit" name="save" onclick="bCancel=true;return confirmSubmit(this.form,'editIcInformation')"><fmt:message key="button.save"/></button>
    				</c:if>
    				<c:if test="${param.strAction=='replyIcInformation' }">
    					<button type="submit" name="save" onclick="bCancel=true;return confirmSubmit(this.form,'replyIcInformation')"><fmt:message key="button.save"/></button>
    				</c:if>
    				</win:power>
    				<c:if test="${param.strAction=='controlIcInformation' }">
    					<button type="submit" name="save" onclick="bCancel=true;return confirmSubmit(this.form,'controlIcInformation')"><fmt:message key="button.save"/></button>
    				</c:if>
    				<c:if test="${not empty icInformation.uniNo }">
    					<win:power powerCode="deleteIcInformation">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'IcInformation')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='/corp/icInformations.jhtml?strAction=editIcInformation'"><fmt:message key="operation.button.cancel"/></button>
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
 		alert("<fmt:message key='ic.consulting.type.null.requie'/>");
 		theForm.inforType.focus();
 		return false;
 	}
	if(theForm.title.value==""){
 		alert("<fmt:message key='ic.title.null.requie'/>");
 		theForm.title.focus();
 		return false;
 	}
	if(theForm.userCode.value==""){
 		alert("<fmt:message key='ic.agentNo.null.requie'/>");
 		theForm.userCode.focus();
 		return false;
 	}
	if(theForm.content.value==""||theForm.content.value.length>500){
 		alert("'<fmt:message key='ic.content.length.null.requie'/>");
 		theForm.content.focus();
 		return false;
 	}
	if(theForm.replyContent.value==""||theForm.replyContent.value.length>500){
 		alert("'<fmt:message key='ic.content.reply.length.null.requie'/>");
 		theForm.replyContent.focus();
 		return false;
 	}
	 
	//其它验证
	showLoading();
	return true;
}

function searchUser(selectControl){
	if(selectControl=='agentAndMember')
  	{
	  var userCodeExample = $("#userCode").val(); 
  	}else{
  	  var userCodeExample = $("#replyUser").val();	
    }
	var ret = window.showModalDialog("<c:url value='/corp/sysUserSelect.jhtml'/>?strAction=companyUserSelect&selectControl="+selectControl+"&userCode="+userCodeExample);
  	if(selectControl=='agentAndMember')
  	{
  	  $("#userCode").val(ret.userCode);
  	  $("#userName").val(ret.userCode);
  	}
  	else if(selectControl=='corpMember')
  	{
  	  $("#replyUser").val(ret.userCode);
  	  $("#replyName").val(ret.userName);	 	 
  }
}
</script>