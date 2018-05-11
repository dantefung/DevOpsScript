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
	<script type="text/javascript" src="${ctx}/scripts/select2.min.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.blockUI.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/tips.js"></script>
	<%-- <script type="text/javascript" src="${ctx}/scripts/language.jsp"></script> --%>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<link href="/css/bootstrap-ie8.css" rel="stylesheet">
	<script src="/scripts/html5shiv.min.js"></script>
	<script src="/scripts/respond.min.js"></script>
	<![endif]-->

	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/font-awesome-4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/select2.min.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/member.css" />


	<link rel="stylesheet" href="${ctx}/themes/${theme }/styles/flexy-menu.css" type="text/css">
	<script type="text/javascript" src="${ctx}/scripts/flexy-menu.js"></script>
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/> <decorator:getProperty property="body.class" writeEntireProperty="true"/>>
<div id="topDiv">
	<div class="container">
		<div class=" clearfix">
			<div class="pull-left" id="logoDiv">
				<img alt="" src="<%--${ctx }/themes/default/images/member/logo.png--%>" height="60">
			</div>
			<%-- <div class="pull-left" id="appname-title">
                <fmt:message key="webapp.name"/><hr style="margin-top: 9px; margin-bottom: 5px;"/>
                <small>TRADE INFO MANAGEMENT SYSTEM</small>
            </div> --%>
			<div class="pull-right" id="topBar">
				${sessionScope.sessionLoginUser.nickName}(${sessionScope.sessionLoginUser.userCode}) <fmt:message key="mi.welcome.login"/>&nbsp;&nbsp;
				<%--<select id="theSelect" onchange="switchLanguage(this)">--%>
					<%--<c:forEach items="${alLangCodes}" var="alLangCodeVar">--%>
						<%--<c:if test="${alLangCodeVar.langCode==sessionScope.sessionLoginUser.locale }">--%>
							<%--<option value="${alLangCodeVar.langCode}" checked>--%>
									<%--${alLangCodeVar.langName }--%>
							<%--</option>--%>
						<%--</c:if>--%>
					<%--</c:forEach>--%>

					<%--<c:forEach items="${alLangCodes}" var="alLangCodeVar">--%>
						<%--<c:if test="${alLangCodeVar.langCode!=sessionScope.sessionLoginUser.locale }">--%>
							<%--<option value="${alLangCodeVar.langCode}">${alLangCodeVar.langName }</option>--%>
						<%--</c:if>--%>
					<%--</c:forEach>--%>
				<%--</select>--%>
				<a class="btn btn-danger btn-sm" role="button" href="${ctx}/member/logout.jsp"><fmt:message key="menu.logout"/></a>
				<c:if test="${sessionScope.sessionLoginUser.userCode!=sessionScope.sessionProxyUser.userCode}">
					<br/><fmt:message key="mi.agency.user"/>：${sessionScope.sessionProxyUser.userName}(${sessionScope.sessionProxyUser.userCode})&nbsp;&nbsp;
					<a class="btn btn-warning btn-sm" role="button" href="index.jhtml?doType=loginBack"><fmt:message key="mi.return.backstage"/></a>
				</c:if>
			</div>
			<div>

			</div>
		</div>
	</div>
</div>

<div id="navBar">
	<div class="container">
		<div class="row">
			<div class="col-md-9" id="menuBar">
				<ul class="flexy-menu orange">
					<li>
						<a href="<c:url value="/member/index.jhtml"/>"><fmt:message key="button.homepage"/></a>
					</li>
					<c:if test="${not empty sysModules}">
						<c:forEach items="${sysModules}" var="row">
							<c:if test="${row.parent_id==0}">
								<li>
									<a href="javascript:return false;"><fmt:message key="${row.module_name}"/></a>
									<ul>
										<c:forEach items="${sysModules}" var="row2">
											<c:if test="${row2.parent_id==row.module_id}">
												<c:if test="${row2.is_split==1 }">
													<li class="divider"></li>
												</c:if>
												<li><a href="<c:url value="${row2.link_url}"/>"><fmt:message key="${row2.module_name}"/></a></li>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${sessionScope.sessionLoginUser.companyCode eq 'CN'}">
				<%--	<li>
						<a href="http://sc.foryou-b.com" target="_blank">责任消费商城</a>
					</li>--%>
					</c:if>
				</ul>
			</div>
			<div class="col-md-3" id="langBar">
			</div>
		</div>
	</div>
</div>

<div style="padding-top: 10px;">
	<div class="container">

		<div class="row">
			<c:choose>
				<c:when test="${leftNavVar==null && isShowSubModules==0}">
					<div class="col-md-12">
						<ol class="breadcrumb">
							<li><a href="<c:url value="/member/index.jhtml"/>"><fmt:message key="button.homepage"/></a></li>
							<li class="active"><decorator:getProperty property="meta.heading" /></li>
						</ol>
						<div class="panel panel-default">
							<div class="panel-body content-div">
								<%@ include file="/common/messages.jsp"%>
								<decorator:body />
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-3">
						<c:if test="${isShowSubModules!=0 }">
							<div class="panel panel-default">
								<div class="panel-heading"><fmt:message key="${topestSysModule.moduleName }"/></div>
								<c:if test="${not empty sysModules}">
									<div class="list-group">
										<c:forEach items="${sysModules}" var="row2">
											<c:if test="${row2.parent_id==topestSysModule.moduleId}">
												<a class="list-group-item" href="<c:url value="${row2.link_url}"/>"><fmt:message key="${row2.module_name}"/></a>
											</c:if>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</c:if>
							${leftNavVar}
					</div>

					<div class="col-md-9">
						<c:if test="${isShowSubModules==0 }">
							<div class="panel panel-default">
								<div class="panel-body content-div">
									<%@ include file="/common/messages.jsp"%>
									<decorator:body />
								</div>
							</div>
						</c:if>
						<c:if test="${isShowSubModules!=0 }">
							<ol class="breadcrumb">
								<li><a href="<c:url value="/member/index.jhtml"/>"><fmt:message key="button.homepage"/></a></li>
								<li class="active"><decorator:getProperty property="meta.heading" /></li>
							</ol>

							<div class="panel panel-default">
								<div class="panel-body content-div">
									<%@ include file="/common/messages.jsp"%>
									<decorator:body />
								</div>
							</div>

						</c:if>
					</div>
				</c:otherwise>
			</c:choose>
		</div>

	</div>
</div>

<div class="container-fluid text-center text-muted" style="padding:10px 0;">
	<p/><p/><p/><p/>
	<%--<p>ICP备案号：闽ICP备 17015053 号</p>--%>
	<%--
            <p>公司客服电话：400 766 9797 或 020-83283268</p>
    --%>
	<%--<p><win:code listCode="member.csr.phone.no" value="${sessionScope.sessionLoginUser.companyCode}"/></p>--%>
	<p>建议使用Firefox、Chrome、Opera等浏览器访问系统</p>
	Copyright © 2017.
</div>

<c:if test="${sessionScope.sessionLoginUser.companyCode eq 'CN'}">
<div id="divAlertModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" id="divAlertModalContent"></div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</c:if>
<script type="text/javascript">
    function switchLanguage(o){
        var langCode = $(o).val();
        window.location.href = '${ctx}/member/index.jhtml?selLangCode='+langCode;
    }

    $(document).ready(function() {

        $(".flexy-menu").flexymenu({speed: 200});
    });
</script>
</body>
</html>