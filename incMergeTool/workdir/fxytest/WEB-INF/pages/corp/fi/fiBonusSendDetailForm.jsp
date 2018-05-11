<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="fiBonusSendDetailDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="fiBonusSendDetailDetail.title"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusSendDetail" method="post" action="editFiBonusSendDetail.jhtml" onsubmit="return validateForm(this)" id="fiBonusSendDetailForm">
    
    <spring:bind path="fiBonusSendDetail.*">
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
    		<th><fmt:message key="fiBonusSendDetail.operNo"/>:</th>
    		<td><form:input path="operNo" id="operNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.money"/>:</th>
    		<td><form:input path="money" id="money"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.bnum"/>:</th>
    		<td><form:input path="bnum" id="bnum"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.openBank"/>:</th>
    		<td><form:input path="openBank" id="openBank"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="fiBonusSendDetail.bname"/>:</th>
    		<td><form:input path="bname" id="bname"/></td>
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
    				<c:if test="${not empty fiBonusSendDetail.id }">
    					<win:power powerCode="deleteFiBonusSendDetail">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusSendDetail')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusSendDetails.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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