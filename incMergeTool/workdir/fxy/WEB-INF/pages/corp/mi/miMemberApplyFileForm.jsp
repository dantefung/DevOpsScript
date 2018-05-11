<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="mi.file.manager.title"/></title>
    <meta name="heading" content="<fmt:message key="mi.file.manager.title"/>"/>
</head>

<div class="contentBody">
	<fmt:message key="mi.askFor.no"/>：<b>${param.applyCode }</b><br/>
	<fmt:message key="mi.lable.current.fileList"/>：<br/>
	<form id="miMemberApplyFileListTableForm" method="get" >
		<ec:table 
			tableId="miMemberApplyFileListTable"
			items="miMemberApplyFiles"
			var="miMemberApplyFileVar"
			action="miMemberApplyFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			rowsDisplayed="20" sortable="false" form="miMemberApplyFileListTableForm" showPagination="false">
			<ec:row>
				<ec:column property="fileName" title="mi.lable.file.explain">
					<img src="${ctx}/themes/${theme }/images/attach/${miMemberApplyFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${miMemberApplyFileVar.fileUrl}"/>" target="_blank">${miMemberApplyFileVar.fileName }</a>
				</ec:column>
				<ec:column property="originalName" title="mi.lable.former.fileName"/>
				<ec:column property="fileSize" title="mi.lable.file.size" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0">${miMemberApplyFileVar.fileSize}</fmt:formatNumber>
				</ec:column>
				<ec:column property="createrCode" title="mi.lable.uploader" />
				<ec:column property="createTime" title="mi.lable.updoad.time" />
			</ec:row>
		</ec:table>
	</form>
	<br/><br/>
    <form:form commandName="miMemberApplyFile" method="post" action="editMiMemberApplyFile.jhtml" onsubmit="return validateForm(this)" id="miMemberApplyFileForm" enctype="multipart/form-data">
    <spring:bind path="miMemberApplyFile.*">
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
	<%@ include file="/common/messages.jsp" %>
    <table class="detail" id="_table">
    	<tr>
    		<td  class="title"><fmt:message key="mi.file.manager.title"/><fmt:message key="mi.add.file"/></td>
    		<td><a href="javascript:AddRow();" name="attachment"><fmt:message key="mi.attachment.manager.add"/></a></td>
    	</tr>
    	<%-- <tr>
    		<th class="required"><fmt:message key="mi.lable.file.explain"/>:</th>
    		<td><form:input path="fileName" id="fileName" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.choose.upload.file"/>:</th>
    		<td><input type="file" name="newFile" id="newFile" size="60"/></td>
    	</tr> --%>
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
	    				<form:hidden path="fileId"/>
	    				<form:hidden path="applyCode"/>
	    				<input type="hidden" name="fileCnt" id="fileCnt" value="0"/>
	    				<input type="hidden" name="isCheckPower" id="isCheckPower" value="${param.isCheckPower }"/>
	    				<input type="hidden" name="strAction" value="addMiMemberApplyFile"/>
	    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
	    				<win:power powerCode="${param.strAction }">
	    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
	    				</win:power>
	    				<button type="button" name="cancel" onclick="history.go(-1);"><fmt:message key="operation.button.cancel"/></button>
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
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	/* if(theForm.fileName.value==""){
		alert("<fmt:message key='mi.file.explain.null.requie'/>");
		theForm.fileName.focus();
		return false;
	}
	if(theForm.newFile.value==""){
		alert("<fmt:message key='mi.choose.upload.file.indexof'/>");
		theForm.newFile.focus();
		return false;
	} */
	if(cntList.length > 0 ){
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
	}else{
		alert("<fmt:message key="mi.add.file.null.requrie"/>");
		return false;
	}
	showLoading();
	return true;
}
var cntList = new Array();
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
$(document).ready( function() {
	AddRow();
});
</script>