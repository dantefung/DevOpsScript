<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>微信参数设置</title>
    <meta name="heading" content="微信参数设置"/>
</head>

<div class="contentBody">
    <form:form commandName="sysConfigKey" method="post" action="setWxConfig.jhtml" onsubmit="return validateForm(this)" id="sysConfigKeyForm">
    <%@ include file="/common/messages.jsp" %>
    <spring:bind path="wxUser.*">
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
    	<c:forEach items="${sysConfigKeys }" var="varSysConfigKey">
    		<tr>
	    		<td class="title">&nbsp;</td>
	    	</tr>
	    	<tr>
	    		<td>${varSysConfigKey.keyDesc }</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<select name="defaultValue">
	    				<c:forEach items="${wxReMsgs }" var="varWxReMsg">
	    					<option value="${varWxReMsg.msgId}"<c:if test="${varSysConfigKey.defaultValue==varWxReMsg.msgId }"> selected</c:if>>${varWxReMsg.interDesc}</option>
	    				</c:forEach>
	    			</select>
	    			<input type="hidden" name="keyId" value="${varSysConfigKey.keyId }"/>
	    		</td>
	    	</tr>
    	</c:forEach>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="setWxConfig"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
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
	showLoading();
	return true;
}
</script>