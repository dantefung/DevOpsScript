<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="sys.pm.editPmProductSale"/></title>
    <meta name="heading" content="<fmt:message key='sys.pm.editPmProductSale'/>"/>
</head>
<script type="text/javascript" src="${ctx}/scripts/jquery.idTabs.min.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/jquery.idTabs.css" />
<style>
iframe{
	width:100%;
	border: none;
	height:450px;
}
</style>
<div class="contentBody">
	<div id="productTabs" class="idTabs">
		<ul>
			<li><a class="selected" href="#tab1"><fmt:message key="pmProductForm.addOrDelete.product.title"/></a></li>
			<c:if test="${not empty param.productId }">
				<win:power powerCode="editPmProductExtra">
					<li><a href="#tab2"><fmt:message key="menu.editPmProductExtra"/></a></li>
				</win:power>
				
				<li><a href="#tab3">Tab 3</a></li>
			</c:if>
		</ul>
		<div id="tab1">
			<c:if test="${not empty param.productId }">
				<iframe src="editPmProduct.jhtml?strAction=editPmProduct&productId=${param.productId}"></iframe>
			</c:if>
			<c:if test="${empty param.productId }">
				<iframe src="editPmProduct.jhtml?strAction=addPmProduct"></iframe>
			</c:if>
		</div>
		<c:if test="${not empty param.productId }">
			<win:power powerCode="editPmProductExtra">
				<div id="tab2" style="height:450px;">
					<iframe src="editPmProductExtra.jhtml?strAction=editPmProductExtra&productId=${param.productId}"></iframe>
				</div>
			</win:power>
			<div id="tab3">Tab 3 is always last!</div>
		</c:if>
	</div>
</div>

<SCRIPT type="text/javascript">
	$(function() {
		$("#productTabs ul").idTabs(); 
	});
</SCRIPT>