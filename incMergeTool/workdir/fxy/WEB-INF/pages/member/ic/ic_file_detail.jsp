<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>


<head>
    <title><fmt:message key="ic.ckwjmx"/></title>
    <meta name="heading" content="<fmt:message key="ic.ckwjmx"/>"/>
</head>

<div class="contentBody">
	<form method="post" action="ic_file_detail.jhtml" onsubmit="return validateDeleteMessage(this)" id="icFileForm">
		<table class="detail" width="100%">
			<tr>
	    		<td><fmt:message key="file.name"/>：<b>${icFile.fileName }</b></td>
	    	</tr>
	    	<tr>
	    		<td><fmt:message key="icFile.fileDesc"/>：${icFile.fileDesc }</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<fmt:message key="ic.oldfilename"/>：${icFile.oldFileName }
	    		</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			 <fmt:message key="icFile.downloadedTimes"/>：${icFile.downloadedTimes } &nbsp;&nbsp;&nbsp; <button type="submit" name="downLoad"  onclick="bCancel=false"><fmt:message key="ic.download"/></button>  
	    		</td>
	    	</tr>　
	    	<tr>
	    		<td>
	    		<input type="hidden" name="fileId" value="${icFile.fileId }"/>
	    		
	    	</tr>
	    </table>
    </form>
    
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
} 
</script>