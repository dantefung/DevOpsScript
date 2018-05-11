<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <%@ include file="/common/meta.jsp" %>
        
        <title><decorator:title/> | <fmt:message key="webapp.name"/></title>
        <decorator:head/>
        <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/corp_global.css" />
        <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery-ui-1.8.11.custom.css"/>
        
        <script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery.blockUI.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/language.jsp"></script>
        <script type="text/javascript" src="${ctx}/scripts/corp.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
    </head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

    <div id="mainPage">
        <div class="headerBar">
            <decorator:getProperty property="meta.heading"/>
        </div>
        <%@ include file="/common/messages.jsp" %>
       <decorator:body/>
    </div>
</body>
</html>
