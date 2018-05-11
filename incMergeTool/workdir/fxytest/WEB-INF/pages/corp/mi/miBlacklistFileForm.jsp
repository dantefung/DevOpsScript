<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miBlacklistFileDetail.title"/></title>
    <meta name="heading" content="<fmt:message key="miBlacklistFileDetail.title"/>"/>
</head>

<div class="contentBody">
	<fmt:message key="mi.askFor.no"/>：<b>${param.adjustCode }</b><br/>
	<fmt:message key="mi.lable.current.fileList"/>：<br/>
	<form id="miBlacklistFileListTableForm" method="get" >
		<ec:table 
			tableId="miBlacklistFileListTable"
			items="miBlacklistFiles"
			var="miBlacklistFileVar"
			action="miBlacklistFiles.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miBlacklistFileListTableForm">
			<ec:row>
				<ec:column property="fileName" title="mi.lable.file.explain">
					<img src="${ctx}/themes/${theme }/images/attach/${miBlacklistFileVar.suffixName}.gif" border="0" width="16" height="16"/>
					<a href="<c:url value="${miBlacklistFileVar.fileUrl}"/>">${miBlacklistFileVar.fileName }</a>
				</ec:column>
				<ec:column property="originalName" title="mi.lable.former.fileName"/>
				<ec:column property="fileSize" title="mi.lable.file.size" styleClass="numberColumn">
					<fmt:formatNumber pattern="###,##0">${miBlacklistFileVar.fileSize}</fmt:formatNumber>
				</ec:column>
				<ec:column property="createrCode" title="mi.lable.uploader" />
				<ec:column property="createTime" title="mi.lable.updoad.time" />
			</ec:row>
		</ec:table>
	</form>
	<br/><br/>
    <form:form commandName="miBlacklistFile" method="post" action="editMiBlacklistFile.jhtml" onsubmit="return validateForm(this)" id="miBlacklistFileForm" enctype="multipart/form-data">
    
    <spring:bind path="miBlacklistFile.*">
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
    		<td colspan="2" class="title"><fmt:message key="mi.add.file"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.lable.file.explain"/>:</th>
    		<td><form:input path="fileName" id="fileName" size="60"/></td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="mi.choose.upload.file"/>:</th>
    		<td><input type="file" name="newFile" id="newFile" size="60"/></td>
    	</tr>
    	<tr>
    		<th>&nbsp;</th>
    		<td>
    			<fmt:message key="mi.uploadFile.layout"/>:
    			<c:forEach items="${allowedUploadFileTypes }" var="fileTypeVar">${fileTypeVar} </c:forEach>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="fileId"/>
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='miBlacklists.jhtml?strAction=miBlacklistList&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.fileName.value==""){
		alert("<fmt:message key='mi.file.explain.null.requie'/>。");
		theForm.fileName.focus();
		return false;
	}
	if(theForm.newFile.value==""){
		alert("<fmt:message key='mi.choose.upload.file.indexof'/>");
		theForm.newFile.focus();
		return false;
	}
	showLoading();
	return true;
}
</script>