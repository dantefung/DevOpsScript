<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="button.homepage"/></title>
</head>
<c:set var="isShowSubModules" scope="request" value="0"/>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/awards.css" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/liMarquee.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="${ctx }/scripts/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctx }/scripts/jquery.liMarquee.js"></script>

<c:set var="leftNavVar" scope="request">
	<div class="panel panel-default">
		<div class="panel-heading"><fmt:message key="me.userzl"/></div>
		<div class="panel-body">
			<span class="redFont"><fmt:message key="me.hello"/></span><span class="greenFont">${sessionScope.sessionLoginUser.nickName }</span><br/>
			<br/>
			<fmt:message key="po.current.cardType"/>：<win:code listCode="member.card.type" value="${miMember.cardType }"/>
			<%-- <br/>
			<fmt:message key="mi.starType"/>：
			<win:code listCode="stars_level" value="${miMember.star }"/> --%>
			<br/>
			<fmt:message key="mi.joindate"/>：<span class="greenFont"><fmt:formatDate value="${miMember.createTime }" pattern="yyyy-MM-dd"/></span><br/>
			<fmt:message key="me.agologin"/>：<fmt:formatDate value="${sessionScope.sessionLoginUser.lastLoginTime}" pattern="yyyy-MM-dd"/><%-- <br/>
			累积消费：<span class="redFont"><fmt:formatNumber pattern="###0.00">${personTotalPaid}</fmt:formatNumber></span> --%>
		</div>
	</div>
	
	<div class="panel panel-default">
		<div class="panel-heading"><fmt:message key="label.my.account"/></div>
		<div class="panel-body">
			<ul class="member-index-balance">
			<c:forEach items="${fiAcBalancesMap }" var="fiAcBalanceVar" varStatus="varStatus">
					<li>
						<span class="glyphicon glyphicon-stop balance-title" aria-hidden="true"></span>
						<win:code listCode="bank_account_types" value="${fiAcBalanceVar.key }"/>：
						<a href="fiAcBalanceItems.jhtml?acType=${fiAcBalanceVar.key }">
							<strong>
								<c:set var="totalBalanceVar" value="${fiAcBalanceVar.value.balance+fiAcBalanceVar.value.freezeBalance }"/>
								<c:if test="${fn:indexOf(totalBalanceVar,'.')>0 }">
									<fmt:formatNumber pattern="###0.00">${fn:substring(totalBalanceVar,0,fn:indexOf(totalBalanceVar,'.')+3) }</fmt:formatNumber>
								</c:if>
								<c:if test="${fn:indexOf(totalBalanceVar,'.')<=0 }">
									<fmt:formatNumber pattern="###0.00">${totalBalanceVar}</fmt:formatNumber>
								</c:if>
							</strong>
						</a>
					</li>
			</c:forEach>
			</ul>
		</div>
	</div>
</c:set>

<!-- 公告 -->
<div class="panel panel-default">
	<div class="panel-heading">
		<div class="row">
			<div class="col-md-6">
  				<fmt:message key="menu.am.amAnnounce"/>
  			</div>
  			<div class="col-md-6 blockquote-reverse">
  				<a href="ic_announce_list.jhtml"><fmt:message key="me.seemore"/></a>
  			</div>
		</div>
	</div>

	<div class="list-group">
		<c:forEach items="${icAnnounces }" var="icAnnounceVar">
			<fmt:parseDate var="activeData" value="${icAnnounceVar.active_date }" parseLocale="zh_CN"/>
			<a href="ic_announce_detail.jhtml?announceId=${icAnnounceVar.announce_id}" class="list-group-item" style="word-wrap:break-word;word-break:break-all;">
		    	${icAnnounceVar.title }-(<fmt:formatDate value="${activeData}" pattern="yyyy-MM-dd"/>)
		    	<c:if test="${icAnnounceVar.view_count==0 }"><span class="glyphicon glyphicon-certificate" aria-hidden="true"></span></c:if>
		    	<span class="badge badgeCustom glyphicon glyphicon-menu-right" aria-hidden="true"> </span>
			</a>
		</c:forEach>
	</div>
</div>

<c:if test="${not empty loginContentIcOnePage && sessionScope.sessionLoginUser.companyCode eq 'CN'}">
	<div style="display:none">
		<div id="inline-content">
			<h4>${loginContentIcOnePage.pageTitle }</h4>
			<pre class="agreement">${fn:replace(loginContentIcOnePage.pageText, vEnter, '<br>')}</pre>
		</div>
	</div>
</c:if>

<script>
$(function () {

	$('[data-toggle="tooltip"]').tooltip();
	<c:if test="${not empty loginContentIcOnePage && not empty loginContentIcOnePage.pageText && sessionScope.sessionLoginUser.companyCode eq 'CN'}">
	$.colorbox({inline:true, width:"80%;", href:"#inline-content"});
	</c:if>
	$.cookie("cAfterLogin", null,{path: '/' });
	
	$(".balance-title").each(function(index) {
		var getRandomColor = function() {
			return '#' + (function(color) { 
			return (color += '0123456789abcdef' [Math.floor(Math.random() * 16)]) 
				&& (color.length == 6) ? color: arguments.callee(color); //将''字符串传给color
			})('');
		};
	    $(this).css("color",getRandomColor);
	});
	$('.marquee-notice').liMarquee({
		drag: false
	});
});

$(document).ready(function () {
    
});
</script>
