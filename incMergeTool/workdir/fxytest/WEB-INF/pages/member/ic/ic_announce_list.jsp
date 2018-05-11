<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>新闻公告</title>
    <meta name="heading" content="新闻公告"/>
</head>

<form method="get" action="ic_announce_list.jhtml" onsubmit="return validateSearch(this)" class="form-inline">
	<div class="input-group">
		<input type="text" class="form-control" name="title" id="title" placeholder="<fmt:message key="ic.lable.key.word"/>" value="${param.title }" size="40">
   		<span class="input-group-btn">
     		<button class="btn btn-info" type="submit" name="search"><fmt:message key="operation.button.search"/></button>
   		</span>
    </div>
</form>

<hr/>

<div class="list-group">
	<c:forEach items="${icAnnounces }" var="icAnnounceVar">
		<fmt:parseDate var="activeData" value="${icAnnounceVar.active_date }"/>
		<a href="ic_announce_detail.jhtml?announceId=${icAnnounceVar.announce_id}" class="list-group-item" style="word-wrap:break-word;word-break:break-all;">
	    	${icAnnounceVar.title }-(<fmt:formatDate value="${activeData }"/>)
	    	<c:if test="${icAnnounceVar.view_count==0 }"><span class="label label-danger">New</span></c:if>
	    	<span class="badge badgeCustom glyphicon glyphicon-menu-right" aria-hidden="true"> </span>
		</a>
	</c:forEach>
</div>
	

<win:page pageId="icAnnounceListPage" action="ic_announce_list.jhtml" autoIncludeParameters="true"/>
	
<script type="text/javascript">

function validateSearch(theForm) {
	showLoading();
	return true;
}


</script>