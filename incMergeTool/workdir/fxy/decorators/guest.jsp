<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/common/meta.jsp"%>
	<title><decorator:title /> | <fmt:message key="webapp.name" /></title>
	<decorator:head />
	<!-- Loading Bootstrap -->
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap.css" />
	
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/tips.js"></script>
	
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/guest.css" />
	
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// --> 
    <!--[if lt IE 9]>
      <link href="/css/bootstrap-ie8.css" rel="stylesheet">
      <script src="/scripts/html5shiv.min.js"></script>
      <script src="/scripts/respond.min.js"></script>
    <![endif]-->
	
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/font-awesome-4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/flexy-menu-guest.css" type="text/css">
	<script type="text/javascript" src="${ctx}/scripts/flexy-menu.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/ShoppingCartAjax.js"></script>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
	<div class="content-div">
		<%@ include file="/common/messages.jsp"%>
		<decorator:body />
	</div>
	
	<div id="divAlertModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body" id="divAlertModalContent"></div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<script type="text/javascript">
	$(document).ready(function() {
	}); 
	</script>
</body>
</html>