<%@ include file="/common/taglibs.jsp"%>

<%
session.removeAttribute(com.cn1win.Constants.SESSION_LOGIN_USER);
session.removeAttribute(com.cn1win.Constants.SESSION_PROXY_USER);
%>

<c:redirect url="/corp/index.jhtml"/>