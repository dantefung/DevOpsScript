<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="apply.plate.agent"/></title>
    <meta name="heading" content="<fmt:message key="apply.plate.agent"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
	
<ul class="nav nav-tabs">
	<li role="presentation" class="active">
		<a href="editMiTradeAgent.jhtml?strAction=memberAddMiTradeAgent"><fmt:message key="apply.plate.agent"/></a>
	</li>
	<li role="presentation">
		<a href="miTradeAgents.jhtml"><fmt:message key="lang.old.appliction"/></a>
	</li>
</ul>

<br/>

<c:if test="${miMember.isAgent!=1 }">
	<h4 class="text-danger"><fmt:message key="member.miTradeAgentForm.msg1"/></h4>
</c:if>

<c:if test="${miMember.isAgent==1 }">
    <form:form commandName="miTradeAgent" method="post" action="editMiTradeAgent.jhtml" onsubmit="return validateForm(this)" id="miTradeAgentForm" name="miTradeAgentForm">
    
	    <spring:bind path="miTradeAgent.*">
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
	    	<tr>
	    		<th><fmt:message key="poOrder.memberName"/>:</th>
	    		<td>******${fn:substring(miMember.lastName, fn:length(miMember.lastName)-1, fn:length(miMember.lastName))}</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.amtOfInvestment"/>:</th>
	    		<td>
	    			<span class="redFont">
					<c:if test="${empty plMemberOrder }">0</c:if>
					<c:if test="${not empty plMemberOrder }">${plMemberOrder.totalPv }</c:if>
					</span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="miMember.cardNo"/>:</th>
	    		<td>${fn:substring(miMember.idNo, 0, 4)}************${fn:substring(miMember.idNo, fn:length(miMember.idNo)-2, fn:length(miMember.idNo))}</td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="lang.proxy.district"/>:</th>
	    		<td>${fullRegionName }</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="lang.plate.username"/>:</th>
	    		<td><form:input path="tradeUserName" cssClass="form-control input-sm"/> </td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="lang.plate.id"/>:</th>
	    		<td><form:input path="tradeId" cssClass="form-control input-sm"/></td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="lang.plate.realname"/>:</th>
	    		<td><form:input path="tradeTrueName" cssClass="form-control input-sm"/></td>
	    	</tr>
	    	<tr>
	    		<th><fmt:message key="busi.common.remark"/>:</th>
	    		<td><form:textarea path="remark" id="remark" cols="60" rows="4" cssClass="form-control input-sm"/></td>
	    	</tr>
	    	<tr>
	    		<th></th>
	    		<td>
	    			<div class="checkbox">
					  	<label>
					    	<input type="checkbox" name="isViewAndAgree" value="1"/>
							<fmt:message key="member.miTradeAgentForm.msg2"/>
					  </label>
					</div>
					<a href="#inline-content" name="viewAgreement"><fmt:message key="member.miTradeAgentForm.msg3"/></a>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<form:hidden path="applCode"/>
	    				<input type="hidden" name="strAction" value="memberAddMiTradeAgent"/>
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<button type="submit" name="save" class="btn btn-success" onclick="bCancel=false"><fmt:message key="member.tjsq"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
    
    <%
	request.setAttribute("vEnter", "\n");
	%>
	<div style="display:none">
		<div id="inline-content">
			<h4>${icOnePage.pageTitle }</h4>
			<pre class="agreement">${fn:replace(icOnePage.pageText, vEnter, '<br>')}</pre>
		</div>
	</div>
</c:if>

<script type="text/javascript">
$(function() {
	$("a[name='viewAgreement']").colorbox({inline:true, width:"500px"});
});

$(document).ready(function(){

});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//
	if(theForm.tradeUserName.value==""){
		alert("<fmt:message key='p.input.plate.username'/>");
		theForm.tradeUserName.focus();
		return false;
	}
	if(theForm.tradeId.value==""){
		alert("<fmt:message key='p.input.plate.id'/>");
		theForm.tradeId.focus();
		return false;
	}
	if(theForm.tradeTrueName.value==""){
		alert("<fmt:message key='p.input.plate.realname'/>");
		theForm.tradeTrueName.focus();
		return false;
	}
	if(!theForm.isViewAndAgree.checked){
		alert("<fmt:message key='member.miTradeAgentForm.msg4'/>");//您必须已阅读并且同意相关协议后才能继续操作
		return false;
	}
	if(!confirm("<fmt:message key='member.miTradeAgentForm.msg5'/>？")){//确认提交此申请
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
</script>
