<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="pmProductPic.manager"/></title>
    <meta name="heading" content="<fmt:message key="pmProductPic.manager"/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>
<div class="contentBody">
    <form:form commandName="pmProductPic" method="post" action="editPmProductPic.jhtml" onsubmit="return validateForm(this)" id="pmProductPicForm" enctype="multipart/form-data">
    
    <spring:bind path="pmProductPic.*">
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
    	<c:if test="${not empty pmProductPic.picId }">
    		<tr>
	    		<th>&nbsp;</th>
	    		<td><img src="${pmProductPic.fileUrl}" width="100" height="100" border="0"/></td>
	    	</tr>
    	</c:if>
    	<c:if test="${empty pmProductPic.picId }">
	    	<tr>
	    		<th class="required"><fmt:message key="pmProductPic.select.picture"/>:</th>
	    		<td><input type="file" name="newFile" id="newFile" size="52"/></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="pmProductPic.picTitle"/>:</th>
    		<td><form:input path="picTitle" id="picTitle" size="60"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="sysListValue.orderNo"/>:</th>
    		<td><form:input path="orderNo" id="orderNo"/></td>
    	</tr>
    	<tr>
    		<th></th>
    		<td>
    			<form:checkbox path="isTitlePic" value="1" label="是否列表图片? (用于商品列表)"/><br/>
    			<form:checkbox path="isSmallTitlePic" value="1" label="是否列表缩略图片? (用于购物车、订单明细等)"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="picId"/> 
    				<form:hidden path="productId" id="productId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty pmProductPic.picId }">
    					<win:power powerCode="deletePmProductPic">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PmProductPic')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='pmProductPics.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	<c:if test="${empty pmProductPic.picId }">
	if(theForm.newFile.value==""){
		alert("<fmt:message key='pmProductPic.select.picture'/>");
		theForm.newFile.focus();
		return false;
	}
	</c:if>
	if(theForm.orderNo.value!="" && !isInteger(theForm.orderNo.value)){
		alert("<fmt:message key='sysModule.orderNo.error'/>");
		theForm.orderNo.focus();
		return false;
	}
	
	showLoading();
	return true;
}
</script>