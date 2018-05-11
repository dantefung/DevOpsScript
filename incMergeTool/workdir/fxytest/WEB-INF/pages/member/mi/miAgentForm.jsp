<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="apply.as.oc"/></title>
    <meta name="heading" content="<fmt:message key="apply.as.oc"/>"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<p><strong>【<fmt:message key="mi.send.notice"/>】</strong><br/>
${fn:replace(icOnePage.pageText, vEnter, '<br>')}
</p>
	
<c:if test="${hasError!=true }">
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
	<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
	
    <form:form commandName="miAgent" method="post" action="editMiAgent.jhtml" onsubmit="return validateForm(this)" id="miAgentForm" name="miAgentForm" enctype="multipart/form-data">
    <hr/>
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="lang.apply.area"/>:</th>
    		<td>
    			<span class="redFont">${regionName }</span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.delivery.moblie"/>:</th>
    		<td>
				 <form:input type="text" path="mobile" cssClass="form-control"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.email"/>:</th>
    		<td>
				 <form:input type="text" path="email" cssClass="form-control"/>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" id="remark" cols="40" rows="6" cssClass="form-control"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="agentId"/>
    				<form:hidden path="regionCode"/>
    				<input type="hidden" name="strAction" value="memberAddMiAgent"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" class="btn btn-success" style="width:100px;" onclick="bCancel=false"><fmt:message key="button.save"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>

</c:if>

<script type="text/javascript">
$(document).ready(function(){
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.mobile.value==""){
		alert("<fmt:message key='pls.input.mp.no'/>");//请输入手机号码
		theForm.mobile.focus();
		return false;
	}
	
	if(!confirm("<fmt:message key='confirm.to.sumbit.this.app'/>"+"？")){//确认提交此申请
		return false;
	}

	showLoading();
	return true;
}

</script>