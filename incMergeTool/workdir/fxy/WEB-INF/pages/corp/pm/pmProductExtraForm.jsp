<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="menu.editPmProductExtra"/></title>
    <meta name="heading" content="<fmt:message key="menu.editPmProductExtra"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/xheditor-1.2.2/xheditor-1.2.2.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/xheditor-1.2.2/xheditor_lang/zh-cn.js"></script>

<div class="contentBody" style="width:98%;">
    <form:form commandName="pmProductExtra" method="post" action="editPmProductExtra.jhtml" onsubmit="return validateForm(this)" id="pmProductExtraForm">
    
    <spring:bind path="pmProductExtra.*">
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
    <table class="detail" width="100%">
    	<tr>
    		<td class="title"><fmt:message key="label.product.desc"/></td>
    	</tr>
    </table>

	<table width="100%" cellpadding="0" cellspacing=""><tr><td>
    <form:textarea path="productDesc" id="productDesc" rows="22" style="width: 100%"/>
    </td></tr></table>

    <table class="detail" width="100%">
    	<tr>
    		<td>
    			<div class="buttonBar">
    				<form:hidden path="productId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='pmProducts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$('#productDesc').xheditor({forcePtag:false,internalStyle:false,html5Upload:false,upImgUrl:'ajax/FileUploadForXhEditorAjax.jhtml',upImgExt:'jpg,jpeg,gif,png',upFlashUrl:'ajax/FileUploadForXhEditorAjax.jhtml',upFlashExt:"swf",upMediaUrl:"ajax/FileUploadForXhEditorAjax.jhtml",upMediaExt:"avi"});
});

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