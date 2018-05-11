<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="商品分类管理"/></title>
    <meta name="heading" content="<fmt:message key="商品分类管理"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="pmProductType" method="post" action="editPmProductType.jhtml" onsubmit="return validateForm(this)" id="pmProductTypeForm">
    
    <spring:bind path="pmProductType.*">
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
    		<th class="required">上级分类:</th>
    		 <form:hidden path="parentTypeId"/>
    		<td><fmt:message key="${parentPmProductType.typeName }"/></td>
    	</tr>
    	<tr>
    		<th class="required">分类名称:</th>
    		<td><form:input path="typeName" id="typeName"/></td>
    	</tr>
     
    	<tr>
    		<th>描述:</th>
    		<td><form:input path="descText" id="descText" size="60"/></td>
    	</tr>
    	<tr>
    		<th>排序号(从小至大):</th>
    		<td><form:input path="sortNo" id="sortNo"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="typeId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty pmProductType.typeId }">
    					<win:power powerCode="deletePmProductType">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PmProductType')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="history.go(-1);"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.typeName.value==""){
		alert("请输入分类名称");
		theForm.typeName.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>