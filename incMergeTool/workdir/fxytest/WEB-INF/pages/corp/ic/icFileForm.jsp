<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="文件管理"/></title>
    <meta name="heading" content="<fmt:message key="文件管理"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="icFile" method="post" action="editIcFile.jhtml" onsubmit="return validateForm(this)" id="icFileForm" enctype="multipart/form-data">
    
    <spring:bind path="icFile.*">
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
    		<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
    		<td><select name="companyCode">
			    		<option value=""></option>
			    		<c:forEach items="${alCompanys}" var="alCompanyVar">
			    			<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==icFile.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			    	</select>
			</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="role.power.lable"/>:</th>
    		<td>
	    		<c:forEach items="${sysRoles}" var="sysRoleVar">
	    			<c:set var="isChecked" value="false"/>
	    			
		    		<c:forEach items="${icFilePows}" var="icFilePowVar">
		    			<c:if test="${sysRoleVar.roleId==icFilePowVar.roleId}">
		    				<c:set var="isChecked" value="true"/>
		    			</c:if>		    			
		    		</c:forEach>
		    		
	    			<input type="checkbox" <c:if test="${isDisable }">disabled ="true"</c:if>  name ="roleId" id="roleId_${sysRoleVar.roleId }" value="${sysRoleVar.roleId }" <c:if test="${isChecked}">checked</c:if>   />
	    			<label for="roleId_${sysRoleVar.roleId }"><fmt:message key="${sysRoleVar.roleName}"/></label> 
	    		</c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icFile.fileName"/>:</th>
    		<td><form:input path="fileName" id="fileName"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icFile.fileDesc"/>:</th>
    		<td><form:textarea path="fileDesc" id="fileDesc" rows="5" cols="50"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="icFile.fileSize"/>:</th>
    		<td><form:input path="fileSize" id="fileSize"/></td>
    	</tr>
     
    	<tr>
    		<th><fmt:message key="icFile.linkType"/>:</th>
    		<td> 
			 <input type="radio" name="linkType" id="linkType0" value="0" checked onclick="show()" /><label for="linkType0"><fmt:message key="ic.lable.internal.documents"/></label>
			<input type="radio" name="linkType" id="linkType1" value="1" onclick="hide()" /><label for="linkType1"><fmt:message key="ic.lable.external.documents"/></label>
			</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="icFile.linkUrl"/>:</th>
    		<td>
    		 <div id ="yes"   style="display:block;"><input name="imgFile" id="imgFile" type="file" />  </div>
    		 <div id ="no" style="display:none;" ><form:input path="linkUrl" id="linkUrl" size="60"/> </div>
    		</td>
    	</tr>
    	 
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="fileId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" name="downloadedTimes" value="${icFile.downloadedTimes }"/> 
    				
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty icFile.fileId }">
    					<win:power powerCode="deleteIcFile">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'IcFile')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='icFiles.jhtml?strAction=listIcFile&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	
	if(theForm.companyCode.value==""){
 		alert("<fmt:message key='ic.companyNo.null.requie'/>");
 		theForm.companyCode.focus();
 		return false;
 	}
 	var roleId = document.getElementsByName("roleId");
     var checked = false;
	
     for (i = 0; i < roleId.length; i++)
     {
         if (roleId[i].checked == true)
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
	if(theForm.fileName.value==""){
 		alert("<fmt:message key='ic.filename.null.requie'/>");
 		theForm.fileName.focus();
 		return false;
 	}
	 
	 var oRadio = document.getElementsByName("linkType");
  
		 for(var i=0;i<oRadio.length;i++)
	     {
			 
			 if(oRadio[i].checked==true){
		          if(oRadio[i].value == 0)
		          {    
		        	  if(theForm.imgFile.value==""){
		  		 		alert("<fmt:message key='ic.choose.filename.null.requie'/>");
		  		 		theForm.imgFile.focus();
		  		 		return false;
		  		 	}
		          }
		          else if(oRadio[i].value == 1){
		        	  if(theForm.linkUrl.value==""){
		  		 		alert("<fmt:message key='ic.choose.fileurl.null.requie'/>");
		  		 		theForm.linkUrl.focus();
		  		 		return false;
		  		 	}
		          }
		          break;
			 }
		  
	     } 
 
	
	//其它验证
	showLoading();
	return true;
}

function show(){

	document.getElementById("yes").style.display = "block";
	document.getElementById("no").style.display = "none";
}
function hide(){
	document.getElementById("yes").style.display = "none";
	document.getElementById("no").style.display = "block";
}
</script>