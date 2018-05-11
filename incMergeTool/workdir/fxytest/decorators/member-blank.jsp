<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@page import="com.cn1win.tjc.web.util.LocaleUtil" %>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/common/meta.jsp" %>
        <title><decorator:title/> | <%=LocaleUtil.getText("webapp.name", request.getLocale()) %></title>
        
        <!-- Loading Bootstrap -->
		<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap.css" />
		<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/select2.min.css" />
		<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/member.css" />
		
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
		  <script src="http://apps.bdimg.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		
        <script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/select2.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery.blockUI.js"></script>
    	<script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
		
        <decorator:head/>
    </head>
<body<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
	<decorator:body/>
	
	<div id="divAlertModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body" id="divAlertModalContent"></div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<script type="text/javascript">
	$(document).ready(function() {
		$("select").select2({
			  minimumResultsForSearch: Infinity
		});
	});
	</script>
</body>
</html>
