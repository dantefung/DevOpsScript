<%@ include file="/common/taglibs.jsp"%>
<%@page import="com.cn1win.tjc.web.util.LocaleUtil" %>

<page:applyDecorator name="blank">

<head>
    <title><%=LocaleUtil.getText("403.title", request.getLocale()) %></title>
    <meta name="heading" content="<%=LocaleUtil.getText("403.title", request.getLocale()) %>"/>
</head>

<p>
    <%=LocaleUtil.getText("403.title", request.getLocale()) %>
</p>

</page:applyDecorator>