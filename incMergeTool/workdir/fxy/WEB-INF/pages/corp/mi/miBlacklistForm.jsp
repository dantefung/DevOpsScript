<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miBlacklist.apply.add"/></title>
    <meta name="heading" content="<fmt:message key="miBlacklist.apply.add"/>"/>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<div class="contentBody">
    <form:form commandName="miBlacklist" method="post" action="editMiBlacklist.jhtml" onsubmit="return validateForm(this)" id="miBlacklistForm" enctype="multipart/form-data">
    
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
    		<th><fmt:message key="miMember.memberNo"/>:</th>
    		<td><form:input path="memberNo" id="memberNo"/>
    			<input type="button" name="showNameBtn" value="<fmt:message key="mi.get.memberName"/>" onclick="showName(this.form.memberNo.value);"/>
    			<span id="memberName"></span>
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="mi.lable.cardNo"/>:</th>
    		<td><form:input path="idNo" id="idNo"/></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="busi.common.remark"/>:</th>
    		<td><form:textarea path="remark" id="remark" rows="8" cols="100"/></td>
    	</tr>
    	<tr >
    		<td class="title"><fmt:message key="mi.upload.file"/>:</td>
    		<td><a href="javascript:AddRow();" name="attachment"><fmt:message key="mi.attachment.manager.add"/></a></td>
    	</tr>
    	<tr>
    		<th>&nbsp;</th>
    		<td>
    			<fmt:message key="mi.uploadFile.layout"/>:
    			<c:forEach items="${allowedUploadFileTypes }" var="fileTypeVar">${fileTypeVar} </c:forEach>
    		</td>
    	</tr>
   	</table>
   	<table class="detail">
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" name="fileCnt" id="fileCnt" value="0"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<%-- <c:if test="${not empty miBlacklist.id }">
    					<win:power powerCode="deleteMiBlacklist">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiBlacklist')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if> --%>
    				<button type="button" name="cancel" onclick="window.location='miBlacklists.jhtml?strAction=miBlacklistList&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
var cntList = new Array();
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(isEmpty(theForm.memberNo.value)){
		alert("<fmt:message key="memberNo.required"/>");
		theForm.memberNo.focus();
		return false;
	}else if(isEmpty(theForm.idNo.value)){
		alert("<fmt:message key="me.inputcardnumber"/>");
		theForm.idNo.focus();
		return false;
	}else if(isEmpty(theForm.remark.value)){
		alert("<fmt:message key="ic.remark.null.requie"/>");
		theForm.remark.focus();
		return false;
	}else if(cntList.length > 0 ){
		for(var i=0 ;i<cntList.length;i++){
			var addFileName = $id("fileName_"+cntList[i]);
			var addFile = $id("newFile_"+cntList[i]);
			if(isEmpty(addFileName.value)){
				alert("<fmt:message key="mi.file.explain.null.requie"/>");
				addFileName.focus();
				return false;
			}
			if(isEmpty(addFile.value)){
				alert("<fmt:message key="mi.upload.file.null.requeir"/>");
				addFile.select();
				return false;
			}
		}
	}
	showLoading();
	return true;
}
function showName(val) {
	MiMemberAjax.getMiMemberInfo(val, function(data) {
	if (data != null) {
		document.getElementById("memberName").innerHTML = data.fullName;
	} else {
		document.getElementById("memberName").innerHTML = "<fmt:message key='miMember.notFound'/>";
	}
		
	});
}
var cnt = 0;
function AddRow() {
	var fileCnt = $id("fileCnt").value;
	$id("fileCnt").value=(parseInt(fileCnt)+1);
	cnt++;
	var tb = document.getElementById("_table");
	 //添加一行 
	 var newTr = tb.insertRow(-1);
	 newTr.setAttribute("id","tr_" + cnt);
	
	 //添加两列 
	// var newTd0 = newTr.insertCell(); 
	// var newTd1 = newTr.insertCell(); 
	 var newTd0 = document.createElement("th");
	 var newTd1 = document.createElement("td");
	 newTr.appendChild(newTd0);
	 newTr.appendChild(newTd1);
	 
	 //设置列内容和属性 
	 newTd0.innerHTML = '<fmt:message key="mi.lable.file.explain"/>:'; 
	 newTd1.innerHTML= '<input name="fileName_'+cnt+'" id="fileName_'+cnt+'"  size="60"/>'; 

	 //添加一行 
	 var newTr_2 = tb.insertRow(-1);
	 newTr_2.setAttribute("id","_tr" + cnt);
	 //添加两列 
	 var newTd0_2 = document.createElement("th");
	 var newTd1_2 = document.createElement("td");
	 newTr_2.appendChild(newTd0_2);
	 newTr_2.appendChild(newTd1_2);
	 //设置列内容和属性 
	 newTd0_2.innerHTML = '<fmt:message key="mi.choose.upload.file"/>:'; 
	 newTd1_2.innerHTML= '<input type="file" name="newFile_'+cnt+'" id="newFile_'+cnt+'"  size="60"/><a href="javascript:DelRow('+cnt+');" name="attachment"><fmt:message key="operation.button.delete"/></a>';
	 
	 //记录添加行,
	 cntList.push(cnt);
} 

function DelRow(cnt){
	 var fileCnt = $id("fileCnt").value;
	 $id("fileCnt").value = (parseInt(fileCnt)-1);
	 var tb = document.getElementById("_table");
	 if(tb.hasChildNodes){
	 	var obj = $id("tr_"+cnt);
	 	var obj_2 = $id("_tr"+cnt);
	 	
	 	obj.parentNode.removeChild(obj);
	 	obj_2.parentNode.removeChild(obj_2);
	 	
	 	//删除添加行
	 	var len = cntList.length;
	    for(var i=0;i<len;i++){        
	        if(cntList[i] == cnt){            
	        	cntList.splice(i,1);//splice（）方法的应用       
	        }    
		 }
	 }
}

function $id(tagId){
	return document.getElementById(tagId);
}
</script>