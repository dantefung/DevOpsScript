<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="leftNavVar" scope="request">
	<ul id="sliding-navigation">
		<win:power powerCode="memberIcMessageSend">
			<li class="sliding-element"><a href="${ctx }/member/ic_message_send.jhtml"><fmt:message key="ic.send.message.title"/></a></li>
		</win:power>
	    <win:power powerCode="memberIcMessageInbox">
			<li class="sliding-element"><a href="${ctx }/member/ic_message_inbox.jhtml"><fmt:message key="ic.recived"/></a></li>
		</win:power>
		<win:power powerCode="memberIcMessageOutbox">
			<li class="sliding-element"><a href="${ctx }/member/ic_message_outbox.jhtml"><fmt:message key="ic.lable.out.boxes"/></a></li>
		</win:power>
		<win:power powerCode="memberIcMessageTrashbox">
			<li class="sliding-element"><a href="${ctx }/member/ic_message_trashbox.jhtml"><fmt:message key="ic.message.dustbin.title"/></a></li>
		</win:power>
	</ul>
</c:set>