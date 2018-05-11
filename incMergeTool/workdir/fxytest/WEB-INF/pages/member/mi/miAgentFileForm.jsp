<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="申请为报单中心"/></title>
    <meta name="heading" content="<fmt:message key="申请为报单中心"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<ul class="nav nav-tabs">
	<win:power powerCode="memberAgentView">
		<li role="presentation">
			<a href="viewMiAgentsInMap.jhtml">报单中心查询</a>
		</li>
	</win:power>
	<win:power powerCode="memberMiAgents">
		<li role="presentation" class="active">
			<a href="miAgents.jhtml">我的申请</a>
		</li>
	</win:power>
</ul>

<br/>

	
<form:form commandName="miAgent" method="post" action="editMiAgentFile.jhtml" onsubmit="return validateForm(this)" id="miAgentForm" name="miAgentForm" enctype="multipart/form-data">

   <spring:bind path="miAgent.*">
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
   <table class="detail">
   	<tr>
   		<th>申请区域:</th>
   		<td>
   			${regionName }
   		</td>
   	</tr>
   	<tr>
   		<th>当前身份证扫描件(正面):</th>
   		<td>
   			<c:if test="${empty miAgent.idPhotoFront }">无</c:if>
   			<c:if test="${not empty miAgent.idPhotoFront }"><a href="${miAgent.idPhotoFront }" target="_blank">查看</a></c:if>
   		</td>
   	</tr>
   	<tr>
   		<th>新的身份证扫描件(正面):<br/>（JPG格式）</th>
   		<td>
   			<input type="file" name="newIdPhotoFront" id="newIdPhotoFront"/>
   		</td>
   	</tr>
   	<tr>
   		<th>身份证扫描件(反面):</th>
   		<td>
   			<c:if test="${empty miAgent.idPhotoBack }">无</c:if>
   			<c:if test="${not empty miAgent.idPhotoBack }"><a href="${miAgent.idPhotoBack }" target="_blank">查看</a></c:if>
   		</td>
   	</tr>
   	<tr>
   		<th>新的身份证扫描件(反面):<br/>（JPG格式）</th>
   		<td>
   			<input type="file" name="newIdPhotoBack" id="newIdPhotoBack"/>
   		</td>
   	</tr>
   	<tr>
   		<th>营业执照号码:</th>
   		<td>
   			<form:input path="blCode" id="blCode"/>
   		</td>
   	</tr>
   	<tr>
   		<th>当前营业执照文件:</th>
   		<td>
   			<c:if test="${empty miAgent.blFile }">无</c:if>
   			<c:if test="${not empty miAgent.blFile }"><a href="${miAgent.blFile }" target="_blank">查看</a></c:if>
   		</td>
   	</tr>
   	<tr>
   		<th>新的营业执照文件:<br/>（JPG格式）</th>
   		<td>
   			<input type="file" name="newBlFile" id="newBlFile"/>
   		</td>
   	</tr>
   	
   	<tr>
   		<td colspan="2">
   			<div class="buttonBar">
   				<form:hidden path="agentId"/>
   				<input type="hidden" name="strAction" value="memberAddMiAgent"/>
   				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
   				<button type="submit" name="save" class="btn btn-success col-md-5"  onclick="bCancel=false"><fmt:message key="button.save"/></button>
   				<a href="miAgents.jhtml" class="btn btn-default col-md-5 col-md-offset-2">返回</a>
              </div>
   		</td>
   	</tr>
   </table>
   
</form:form>

<script type="text/javascript">
$(document).ready(function(){
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(!confirm("确认提交？")){
		return false;
	}

	showLoading();
	return true;
}

</script>