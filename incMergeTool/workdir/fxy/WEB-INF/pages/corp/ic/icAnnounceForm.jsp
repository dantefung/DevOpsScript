<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="icAnnounceDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="icAnnounceDetail.title"/>"/>
</head>

<script type="text/javascript" src="${ctx}/scripts/xheditor-1.2.2/xheditor-1.2.2.min.js"></script>
<script type="text/javascript" src="${ctx}/scripts/xheditor-1.2.2/xheditor_lang/zh-cn.js"></script>

<div class="contentBody">
    <form:form commandName="icAnnounce" method="post" action="editIcAnnounce.jhtml" onsubmit="return validateForm(this)" id="icAnnounceForm">
    
    <spring:bind path="icAnnounce.*">
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
    	<c:if test="${not empty alCompanys }">
	    	<tr>
	    		<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
	    		<td><select name="companyCode" <c:if test="${isDisable }">disabled ="true"</c:if> > 
				    		<c:forEach items="${alCompanys}" var="alCompanyVar">
				    			<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==icAnnounce.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
				    		</c:forEach>
				    	</select>
	    		</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required"><fmt:message key="menu.am.browserAmAnnounceF"/>:</th>
    		<td>
	    		<c:forEach items="${userTypes}" var="sysRoleVar">
	    			<c:set var="isChecked" value="false"/>
	    			
		    		<c:forEach items="${icAnnouncePermitList}" var="icAnnouncePermit">
		    			<c:if test="${icAnnouncePermit.userType==sysRoleVar.key}">
		    				<c:set var="isChecked" value="true"/>
		    			</c:if>		    			
		    		</c:forEach>
		    		
	    			<input type="checkbox" <c:if test="${isDisable }">disabled ="true"</c:if>  name ="userType" id="userType_${sysRoleVar.key }" value="${sysRoleVar.key }" <c:if test="${isChecked}">checked</c:if>   />
	    			<label for="userType_${sysRoleVar.key }"><fmt:message key="${sysRoleVar.value}"/></label> 
	    		</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icAnnounce.title"/>:</th>
    		<td><form:input path="title" id="title" style="width: 99.3%" disabled ="${isDisable }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icAnnounce.content"/>:</th>
    		<td><form:textarea path="content" id="content" rows="15" cols="100" style="width: 100%"  disabled ="${isDisable }"/></td>
    	</tr>
        
    	<tr>
    		<th class="required"><fmt:message key="icAnnounce.activeDate"/>:</th>
    		<td><form:input path="activeDate" id="activeDate"   readonly="true" disabled ="${isDisable }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icAnnounce.expireDate"/>:</th>
    		<td><form:input path="expireDate" id="expireDate"     readonly="true" disabled ="${isDisable }"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icAnnounce.isTop"/>:</th> 
    		<td><win:list listCode="yesno" name="isTop"	id="isTop" value="${icAnnounce.isTop }" defaultValue="0"    />
    		 </td>
    	</tr>

    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="announceId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${param.strAction !='icAnnounceSearch' }">
	    				<win:power powerCode="${param.strAction }">
	    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="${keywordString }"/></button>
	    				</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='icAnnounces.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){		
	$('#content').xheditor({forcePtag:false,internalStyle:false,html5Upload:false,upImgUrl:'ajax/FileUploadForXhEditorAjax.jhtml',upImgExt:'jpg,jpeg,gif,png',upFlashUrl:'ajax/FileUploadForXhEditorAjax.jhtml',upFlashExt:"swf",upMediaUrl:"ajax/FileUploadForXhEditorAjax.jhtml",upMediaExt:"avi"});	
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	 
	 var len = theForm.userType.length;
	 
     var checked = false;
	
     for (i = 0; i < len; i++)
     {
         if (theForm.userType[i].checked == true)
         {
             checked = true;
             break;
         }
     }
     if (!checked)
     {
         alert("<fmt:message key='ic.choose.power.null.requie'/>");
         return false;
     } 

	if(theForm.title.value==""){
		alert("<fmt:message key='ic.title.info.null.requie'/>");
		theForm.title.focus();
		return false;
	}
	if(theForm.content.value==""){
		alert("<fmt:message key='ic.full.notice.null.requie'/>");
		theForm.content.focus();
		return false;
	}
	if(theForm.activeDate.value==""){
		alert("<fmt:message key='ic.takeEffect.time.null.requie'/>");
		theForm.activeDate.focus();
		return false;
	}
	if(theForm.expireDate.value==""){
		alert("<fmt:message key='ic.loseEffectiveness.time.null.requie'/>");
		theForm.expireDate.focus();
		return false;
	}
	//其它验证
	showLoading();
	return true;
}
$(function() {
	var mydate = new Date();
	 
	$( "#activeDate,#expireDate" ).datepicker({
	    minDate:(new Date())
	     });
});
</script>