<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="function.menu.downloadfile"/></title>
    <meta name="heading" content="<fmt:message key="function.menu.downloadfile"/>"/>
</head>

<%
request.setAttribute("vEnter", "\n");
%>

<form method="get" action="ic_file_download.jhtml" class="form-inline"  onsubmit="return validateSearch(this)">
	<div class="form-group">
		<div class="input-group">
			<input type="text" class="form-control" name="fileName" id="fileName" value="${param.keyword }" placeholder="<fmt:message key="ic.lable.key.word"/>"/>
			<span class="input-group-btn">
				<button type="submit" class="btn btn-info" name="search"><fmt:message key="operation.button.search"/></button>
			</span>
		</div>
	</div>
</form>
<table class="table table-striped table-hover">
	<thead>
		<tr>
			<th><fmt:message key="mimember.uploadfile.download"/></th>
			<th><fmt:message key="icFile.fileName"/></th>
			<th><fmt:message key="mi.lable.file.explain"/></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${icFiles}" var="icFileVar">
			<tr>
				<%-- <td nowrap="nowrap"><a href="ic_file_detail.jhtml?fileId=${icFileVar.fileId}" name="view"><fmt:message key="function.menu.view"/></a></td> --%>
				<td nowrap="nowrap"><a href="${icFileVar.linkUrl }" name="downLoad" target="_blank"><fmt:message key="ic.download"/></a></td>
				<td>${icFileVar.fileName}</td>
				<td nowrap="nowrap">${fn:replace(icFileVar.fileDesc, vEnter, '<br>')}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<win:page pageId="icFileListTable" action="ic_file_download.jhtml" autoIncludeParameters="true"/>
	 
<form method="post" action="ic_file_detail.jhtml" onsubmit="return validateDeleteMessage(this)" id="icFileForm">
	<input type="hidden" name="fileId" id="fileId" />
</form>
<script type="text/javascript">
$(function() {

	
}); 

function filedownload(fileId){
	document.getElementById("fileId").value=fileId;
	document.getElementById("icFileForm").submit();
}
function validateSearch(theForm) {
	showLoading();
	return true;
}


</script>