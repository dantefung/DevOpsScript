<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
	<title><fmt:message key="mi.agent.register.title"/></title>
	<meta name="heading" content="<fmt:message key="mi.agent.register.title"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<div class="contentBody">
    <form:form commandName="miMember" method="post" action="agentRegisterStep1.jhtml" onsubmit="return validateForm(this)" name="miMemberForm" id="miMemberForm">
	    <input type="hidden" id="newAgentRegisterKey" name="newAgentRegisterKey" value="${newAgentRegisterKey}"/>
	    <spring:bind path="miMember.*">
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
	    		<td colspan="2" class="title">&nbsp;&nbsp;<fmt:message key="mi.mustred"/></td>
	    	</tr>
	    	<tr>
	    		<th  class="required">&nbsp;<fmt:message key="miMember.memberNo"/>:</th>
	    		<td>
	    			<input type="text" name="memberNo" id="memberNo" value="${memberNo }" onchange="getAgentMember(this.value, 'memberNo_show');"/>
	    			<span id="memberNo_show"></span>
	    		</td>
	    	</tr>
	    	<%-- <tr>
	    		<th class="required"><font color="red">*</font><fmt:message key="mi.store.type.lable"/>:</th>
	    		<td>
	    		<select name="storeType">
	    				<c:forEach items="${storeTypeList }" var="ttype">
	    					<c:if test="${ttype.key < 4 }">
								<option value="${ttype.key }" <c:if test="${ttype.key==storeType  }">selected="selected"</c:if>><fmt:message key="${ttype.value }"/></option>
							</c:if>
	    				</c:forEach>
	    			</select>
	    		</td>
	    	</tr> --%>
	    	<tr>
	    		<th class="required"><fmt:message key="mi.recommendNo"/>:</th>
	    		<td>
	    			<input type="text" name="agentRecommendNo" id="agentRecommendNo" value="${agentRecommendNo }" onchange="getAgentMember(this.value, 'agentRecommendNo_show');"/>
	    			<span id="agentRecommendNo_show"></span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<th class="required"><fmt:message key="服务点编号"/>:</th>
	    		<td>
	    			<input type="text" name="agentLinkNo" id="agentLinkNo" value="${agentLinkNo }" onchange="getAgentMember(this.value, 'agentLinkNo_show');"/>
	    			<span id="agentLinkNo_show"></span>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2">
	    			<div class="buttonBar">
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<input type="hidden" value="${strAction }" name="strAction" />
	    				<button type="submit" name="next" onclick="bCancel=false" class="btn btn-success"><fmt:message key="button.next"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>

<script type="text/javascript">
$(function() {
	$("button[name='next']").button({
        icons: {
            primary: "ui-icon-next"
        }
    });
	var  agentMemberNo = '${agentRecommendNo}';
	if(!isEmpty(agentMemberNo)){
		getAgentMember(agentMemberNo);
	}
});
function validateForm(theForm) {
	
	if(bCancel){
		showLoading();
		return true;
	}
	if (isEmpty(theForm.memberNo.value)) {
		alert("<fmt:message key='请输入会员编号'/>！");
		theForm.memberNo.focus();
		return false;
	}
    if (isEmpty(theForm.agentRecommendNo.value)) {
		alert("<fmt:message key='prompt.command.null.require'/>！");
		theForm.agentRecommendNo.focus();
		return false;
	}
    if (isEmpty(theForm.agentLinkNo.value)) {
		alert("<fmt:message key='服务点编号不能为空'/>！");
		theForm.agentLinkNo.focus();
		return false;
	}
    var confirmMsg = "<fmt:message key='mi.register.agent.enter.confirm.msg'/>!.\n"
    				+"\n<fmt:message key='miMember.memberNo'/>: "+theForm.memberNo.value
    				+"\n<fmt:message key='mi.recommendNo'/>: "+theForm.agentRecommendNo.value
    				+"\n<fmt:message key='服务点编号'/>: "+theForm.agentLinkNo.value;
    if(confirm(confirmMsg)){
    	showLoading();
    	return true;
    }
    return false;
}
function getAgentMember(agentMemberNo, showId){
	MiMemberAjax.getMiMemberInfo(agentMemberNo, function(data) {
		if (data != null) {
			document.getElementById(showId).innerHTML = data.lastName;
		} else {
			document.getElementById(showId).innerHTML = "<fmt:message key='prompt.member.inexitance'/>";
		}
			
	});
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
</script>