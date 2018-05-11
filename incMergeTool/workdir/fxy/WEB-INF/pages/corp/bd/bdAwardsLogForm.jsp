<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>会员荣衔操作记录</title>
    <meta name="heading" content="会员荣衔操作记录"/>
</head>

<div class="contentBody">
    <form:form commandName="bdAwardsLog" method="post" action="editBdAwardsLog.jhtml" onsubmit="return validateForm(this)" id="bdAwardsLogForm">
    
    <spring:bind path="bdAwardsLog.*">
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
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th class="required">操作内容:</th>
    		<td><form:textarea path="content" id="content" cols="60" rows="6"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="logId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty bdAwardsLog.logId }">
    					<win:power powerCode="deleteBdAwardsLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'BdAwardsLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='bdAwardsLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.memberNo.value==""){
		alert("请输入会员编号");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.content.value==""){
		alert("请输入操作内容");
		theForm.content.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>