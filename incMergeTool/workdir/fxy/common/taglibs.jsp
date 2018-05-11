<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<%@ taglib uri="/WEB-INF/tld/extremecomponents.tld" prefix="ec" %>
<%@ taglib uri="/WEB-INF/tld/winanet.tld" prefix="win" %>
<%
response.setHeader("Pragma", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", -1);
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="datePattern"><fmt:message key="date.format"/></c:set>

<c:set var="theme" value="default"/>
<c:if test="${not empty sessionScope.sessionLoginUser.theme}">
	<c:set var="theme" value="${sessionScope.sessionLoginUser.theme}"/>
</c:if>
<spring:htmlEscape defaultHtmlEscape="false"/>