<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="lang.acc.deduct.mgr"/></title>
    <meta name="heading" content="<fmt:message key="lang.acc.deduct.mgr"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="fiAcChange" method="post" action="editFiAcChange.jhtml" onsubmit="return validateForm(this)" id="fiAcChangeForm">
    
    <spring:bind path="fiAcChange.*">
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
    		<th class="required"><fmt:message key="miMember.memberNo"/>:</th>
    		<td>
    			<form:input path="memberNo" id="memberNo"/>&nbsp;
    			<button type="button" name="showNameBtn" onclick="showName(this.form.memberNo.value);"><fmt:message key="mi.get.memberName"/></button>
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
    		<th class="required"><fmt:message key="lang.reasonOfDeduction"/>:</th>
    		<td>
    			<select name="reason">
    				<c:forEach items="${moneytypeMap }" var="moneytypeVar">
    					<option value="${moneytypeVar.key }" <c:if test="${moneytypeVar.key==fiAcChange.reason }">selected="selected"</c:if>>${moneytypeVar.value }</option>
    				</c:forEach>
    			</select>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="busi.finance.amount"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="poSell.notes"/>:</th>
    		<td><form:textarea cols="60" rows="3" path="memo" id="memo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea cols="60" rows="3" path="remark" id="remark"/></td>
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
    				<c:if test="${not empty fiAcChange.id }">
    					<win:power powerCode="deleteFiAcChange">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiAcChange')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiAcChanges.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
		document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";//会员不存在
	}
		
	});
}
</script>