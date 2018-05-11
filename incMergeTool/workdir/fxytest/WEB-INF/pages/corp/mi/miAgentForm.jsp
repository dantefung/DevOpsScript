<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="报单中心管理"/></title>
    <meta name="heading" content="<fmt:message key="报单中心管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miAgent" method="post" action="editMiAgent.jhtml" onsubmit="return validateForm(this)" id="miAgentForm" name="miAgentForm" enctype="multipart/form-data">
    
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
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required">会员编号:</th>
    		<td><form:input path="userCode" id="userCode"/></td>
    	</tr>
    	<tr>
    		<th>合同起始日期:</th>
    		<td>
    			<form:input type="text" path="startDate" size="12" />
    		</td>
    	</tr>
    	<tr>
    		<th>合同截止日期:</th>
    		<td>
				 <form:input type="text" path="endDate" size="12" />
    		</td>
    	</tr>
    	<tr>
    		<th class="required">手机号码:</th>
    		<td>
				 <form:input type="text" path="mobile"/>
    		</td>
    	</tr>
    	<tr>
    		<th>电子邮箱:</th>
    		<td>
				 <form:input type="text" path="email"/>
    		</td>
    	</tr>
    	
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
    	</tr>
    	<tr>
    		<th class="required">状态:</th>
    		<td><win:list name="status" listCode="mi_agent_status" defaultValue="0" value="${miAgent.status }"/> </td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="agentId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty miAgent.agentId && miAgent.status==0}">
    					<win:power powerCode="deleteMiAgent">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiAgent')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miAgents.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

$(document).ready(function(){
    getMemberInfo(document.miAgentForm.userCode);
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.userCode.value==""){
		alert("请输入会员编号");
		theForm.userCode.focus();
		return false;
	}

	if(theForm.mobile.value==""){
		alert("请输入手机号码");
		theForm.mobile.focus();
		return false;
	}

	showLoading();
	return true;
}

function getMemberInfo(obj){
	if(obj.value==""){
		$("#totalPv").html("");
		return;
	}
	MiMemberAjax.getPlMemberOrderData(obj.value, function(data){
		if(data==null){
			$("#totalPv").html("");
		}else{
			$("#totalPv").html(data.totalPv);
		}
	});
}
</script>