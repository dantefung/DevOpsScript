<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.miblacklist.concle.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.miblacklist.concle.title"/>"/>
</head>
<div class="contentBody">
    <form:form commandName="miBlacklist" method="post" action="miBlacklistCancleForm.jhtml" onsubmit="return validateForm(this)" id="miBlacklistForm" enctype="multipart/form-data">
    
    <spring:bind path="miBlacklist.*">
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
    <table class="detail" id="_table">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="cancleRemark" id="cancleRemark" rows="8" cols="100"/></td>
    	</tr>
   	<table class="detail">
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" name="ids" value="${ids }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="mi.button.cancle.sure"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='miBlacklists.jhtml?strAction=${param.strAction}&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function isEmpty(str){
	if(/^\s*$/g.test(str)){
		return true;
	}
	return false;
}
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(isEmpty(theForm.cancleRemark.value)){
		alert("<fmt:message key="ic.remark.null.requie"/>");
		theForm.cancleRemark.focus();
		return false;
	}	showLoading();
	return true;
}
</script>