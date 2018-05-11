<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="label.backoffice"/></title>
    <meta name="heading" content="<fmt:message key="label.backoffice"/>"/>
    
    <script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/bootstrap.min.js"></script>
   	<script type="text/javascript" src="${ctx}/scripts/utils.js"></script>

   	<script type="text/javascript" src="${ctx}/scripts/jquery.layout.min.js"></script>
	<!-- Loading Bootstrap -->
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/corp_index.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/corp_menu.css" />
</head>

<script language="JavaScript">
	var outerLayout, innerLayout;
	
	$(document).ready( function() {
		outerLayout = $("body").layout( layoutSettings_Outer );
		$("#northNav").css("z-index","99");
		$('.dropdown-toggle').dropdownHover({});
		
		$('.content li.button a').click(function(e){
			
			/* Finding the drop down list that corresponds to the current section: */
			var dropDown = $(this).parent().next();
			
			/* Closing all other drop down sections, except the current one */
			$('.content .dropdown').not(dropDown).slideUp('fast');
			dropDown.slideToggle('fast');
			
			/* Preventing the default event (which would be to navigate the browser to the link's address) */
			e.preventDefault();
		})
	});

	var layoutSettings_Outer = {
		name: "outerLayout"
		,maskIframesOnResize:true,	
		defaults: {
				size:					"auto"
			,	minSize:				50
			,	paneClass:				"pane" 		// default = 'ui-layout-pane'
			,	resizerClass:			"resizer"	// default = 'ui-layout-resizer'
			,	togglerClass:			"toggler"	// default = 'ui-layout-toggler'
			,	buttonClass:			"button"	// default = 'ui-layout-button'
			,	contentSelector:		".content"	// inner div to auto-size so only it scrolls, not the entire pane!
			,	contentIgnoreSelector:	"span"		// 'paneSelector' for content to 'ignore' when measuring room for content
			,	togglerLength_open:		0			// WIDTH of toggler on north/south edges - HEIGHT on east/west edges
			,	togglerLength_closed:	-1			// "100%" OR -1 = full height
			,	hideTogglerOnSlide:		true		// hide the toggler when pane is 'slid open'
			,	togglerTip_open:		"关闭此面板"
			,	togglerTip_closed:		"打开此面板"
			,	resizerTip:				"调整大小"
			//	effect defaults - overridden on some panes
			,	fxName:					"slide"		// none, slide, drop, scale
			,	fxSpeed_open:			750
			,	fxSpeed_close:			1500
			,	fxSettings_open:		{ easing: "easeInQuint" }
			,	fxSettings_close:		{ easing: "easeOutQuint" }
		},	
		north: {
				spacing_open:			0
			,	resizable: 				false
			,	slidable:				false
			},	
		west: {
				size:					200
			,	minSize:				100
			,	spacing_open:			0
			,	resizable: 				false
			,	slidable:				false
			},	
		center: {
				minWidth:				200
			,	minHeight:				200
		}
	};
	
	function changeLangCode(theForm){
		theForm.submit();
	}
	
	function changeCompanyCode(theForm){
		theForm.submit();
	}
</script>

<!-- 左边导航栏 -->
<div class="ui-layout-west">
	<div class="content">
		<!-- 竖形菜单 -->
		<ul>
			<c:if test="${not empty sysModules}">
			<c:forEach items="${sysModules}" var="row">
				<c:if test="${row.parent_id==0 }">
				<li class="menu">
          			<ul>
          				<li class="button"><a href="#"><fmt:message key="${row.module_name}"/><span></span></a></li>
          				<li class="dropdown">
			                <ul>
			                	<c:forEach items="${sysModules}" var="subRow">
			                		<c:if test="${subRow.parent_id==row.module_id }">
			                			<c:if test="${not empty subRow.icon_name}"><c:set var="iconAttr" value="${ctx}/themes/${theme }/images/icons/${subRow.icon_name}"/></c:if>
										<c:if test="${empty subRow.icon_name}"><c:set var="iconAttr" value="${ctx}/themes/${theme }/images/1pixil.gif"/></c:if>
				                		<li><a href="${ctx}${subRow.link_url}" target="contentFrame"><img border="0" width="16" height="16" src="${iconAttr }"/> <fmt:message key="${subRow.module_name}"/></a></li>
				                	</c:if>
			                	</c:forEach>
			                </ul>
						</li>
          			</ul>
          		</li>
          		</c:if>
			</c:forEach>
			</c:if>
 		</ul>
	</div>
	<!-- <div class="footer">导航提示栏(备用)</div> -->
</div>
<!-- 上部导航栏 -->
<div class="ui-layout-north" id="northNav">
	<div id="header" class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="${ctx }/corp/welcome.jhtml" target="contentFrame" class="navbar-brand text-center">
				    <img alt="Logo" src="${ctx }/themes/default/images/logo.png">
				</a>
			</div>
			<div class="top-nav">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
                           	${sessionScope.sessionLoginUser.userName}(${sessionScope.sessionLoginUser.userCode})
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="${ctx}/corp/logout.jsp"><fmt:message key = "menu.logout"/></a></li>
						</ul>
					</li>
					
					 <%--<li class="dropdown">--%>
						<%--<c:forEach items="${alLangCodes}" var="alLangCodeVar">--%>
							<%--<c:if test="${alLangCodeVar.langCode==sessionScope.sessionLoginUser.locale }">--%>
								<%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
		                           	<%--${alLangCodeVar.langName }--%>
									<%--<b class="caret"></b>--%>
								<%--</a>--%>
							<%--</c:if>--%>
		                <%--</c:forEach>--%>
						<%----%>
						<%--<ul class="dropdown-menu">--%>
							<%--<c:forEach items="${alLangCodes}" var="alLangCodeVar">--%>
								<%--<c:if test="${alLangCodeVar.langCode!=sessionScope.sessionLoginUser.locale }">--%>
									<%--<li><a href="<c:url value="/corp/index.jhtml?selLangCode=${alLangCodeVar.langCode}"/>">${alLangCodeVar.langName }</a></li>--%>
								<%--</c:if>--%>
							<%--</c:forEach>--%>
						<%--</ul>--%>
					<%--</li>--%>

					<li class="dropdown">
						<c:forEach items="${alCompanys}" var="alCompanyVar"> 
							<c:if test="${alCompanyVar.companyCode==sessionScope.sessionLoginUser.companyCode }">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
										${alCompanyVar.englistName }${alCompanyVar.companyName }
									<b class="caret"></b>
								</a>
							</c:if>
		                </c:forEach>
		                
		                <ul class="dropdown-menu">
		                	<c:forEach items="${alCompanys}" var="alCompanyVar"> 
								<c:if test="${alCompanyVar.companyCode!=sessionScope.sessionLoginUser.companyCode }">
									<li><a href="<c:url value="/corp/index.jhtml?selCompanyCode=${alCompanyVar.companyCode}"/>">${alCompanyVar.englistName }${alCompanyVar.companyName }</a></li>
								</c:if>
			                </c:forEach>
		                </ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- 主要内容栏 -->
<div class="ui-layout-center" id="mainContent">
	<iframe src="${ctx}/corp/welcome.jhtml" name="contentFrame" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
</div>
