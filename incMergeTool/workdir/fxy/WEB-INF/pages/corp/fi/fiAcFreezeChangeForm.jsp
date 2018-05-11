<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="冻结会员账户金额"/></title>
    <meta name="heading" content="<fmt:message key="冻结会员账户金额"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="fiAcFreezeChange" method="post" action="editFiAcFreezeChange.jhtml" onsubmit="return validateForm(this)" id="fiAcFreezeChangeForm">
    
    <spring:bind path="fiAcFreezeChange.*">
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
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			<form:input path="userCode" id="userCode"/>&nbsp;
    			<button type="button" name="showNameBtn" onclick="showName(this.form.userCode.value);"><fmt:message key="mi.get.memberName"/></button>
    			<span id="memberName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="title.accout.type"/>:</th>
    		<td>
    			<form:select path="acType">
    				<c:forEach items="${accountTypes }" var="accountTypeVar">
    					<c:if test="${accountTypeVar.key!='D2'}">
    						<form:option value="${accountTypeVar.key }"><fmt:message key="${accountTypeVar.value }"/></form:option>
    					</c:if>
    				</c:forEach>
    			</form:select>
    		</td>
    	</tr>
    	<tr>
    		<th class="required">冻结金额:</th>
    		<td>
    			<form:input path="freezeMoney" id="freezeMoney"/>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"></th>
    		<td>
    			1.冻结金额为0时代表不冻结任意金额；
    			<br/>2.当此冻结单审批后，此冻结金额会替换之前的冻结金额；
    			<br/>3.摘要内容会员可以看到，备注内容只可公司后台查看；
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea cols="60" rows="3" path="remark" id="remark"/></td>
    	</tr>
    	<tr>
    		<th>摘要:</th>
    		<td><form:textarea cols="60" rows="3" path="memo" id="memo"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiAcFreezeChange.id }">
    					<win:power powerCode="deleteFiAcFreezeChange">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiAcFreezeChange')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiAcFreezeChanges.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.userCode.value==""){
		alert("请输入会员编号");
		theForm.userCode.focus();
		return false;
	}
	if(!isUnsignedNumeric(theForm.freezeMoney.value)){
		alert("请输入正确的冻结金额");
		theForm.freezeMoney.focus();
		return false;
	}
	
	showLoading();
	return true;
}

$(function() {
	$("button[name='showNameBtn']",".detail").button({
        icons: {
            primary: "ui-icon-user"
        }
    });
});

function showName(val) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById("memberName").innerHTML = data.lastName;
	} else {
		document.getElementById("memberName").innerHTML = "会员不存在";
	}
		
	});
}
</script>