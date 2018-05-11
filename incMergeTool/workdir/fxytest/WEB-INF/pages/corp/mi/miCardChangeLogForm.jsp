<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMember.changeCardType"/></title>
    <meta name="heading" content="<fmt:message key="miMember.changeCardType"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="miCardChangeLog" method="post" action="editMiCardChangeLog.jhtml" onsubmit="return validateForm(this)" id="miCardChangeLogForm">
    
    <spring:bind path="miCardChangeLog.*">
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
    <span class="form-tips"></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo" onchange="showName(this.value)"/>
    		</td>
    	</tr>
    	<tr id="member_info_id" style="display: none;">
    		<th></th>
    		<td>
    			<span id="memberName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.cardType"/>:</th>
    		<td><win:list listCode="member.card.type" name="afterChange" value="${param.afterChange }"  defaultValue="0" style="width:135px;" showBlankLine="true"/></td>
    	</tr>
    	<tr>
    		<th ><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" cols="40" rows="5"/></td>
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
    				<c:if test="${not empty miCardChangeLog.logId }">
    					<win:power powerCode="deleteMiCardChangeLog">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiCardChangeLog')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miCardChangeLogs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(isEmpty(theForm.memberNo.value)){
		alert("<fmt:message key="memberNo.required"/>");
		theForm.memberNo.focus();
		return false;
	}else if(isEmpty(theForm.afterChange.value)){
		alert("<fmt:message key="mi.cardType.change.null.requied"/>");
		theForm.afterChange.select();
		return false;
	}else if(isEmpty(theForm.remark.value)){
		alert("<fmt:message key="ic.remark.null.requie"/>");
		theForm.remark.select();
		return false;
	}
	
	showLoading();
	return true;
}
function showName(val) {
	if(isEmpty(val)){
		$id("member_info_id").style.display="none";
		return;
	}
	MiMemberAjax.getMiMemberInfo2(val,null, function(data) {
		if (data != null) {
			$id("member_info_id").style.display="";
			document.getElementById("memberName").innerHTML = "<fmt:message key="poOrder.memberName"/>:"+ data.lastName +"<br/><fmt:message key="po.current.cardType"/>:"+data.cardType;
		} else{
			$id("member_info_id").style.display="";
			document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";
		}
	});
}
function $id(tagId){
	return document.getElementById(tagId);
}
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
</script>