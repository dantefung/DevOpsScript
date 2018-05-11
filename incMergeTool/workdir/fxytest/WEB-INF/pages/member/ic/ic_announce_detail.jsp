<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="menu.am.amAnnounce"/></title>
    <meta name="heading" content="<fmt:message key="menu.am.amAnnounce"/>"/>
</head>

<div class="text-center">
	<h3>${icAnnounce.title}</h3>
</div>
<div>
	<pre class="newsContent">
		${icAnnounce.content }
	</pre>
</div>

<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
} 
</script>