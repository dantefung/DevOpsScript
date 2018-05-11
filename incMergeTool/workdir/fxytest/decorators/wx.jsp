<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML>

<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head>
        <%@ include file="/common/meta.jsp" %>
        <meta name="keywords" content="<fmt:message key="webapp.name"/>" />
		<meta name="description" content="<fmt:message key="webapp.name"/>" />
        <title><decorator:title/></title>
        <decorator:head/>
        
        <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery-1.11.2.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/jquery.validate.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/utils.js"></script>
        <script type="text/javascript" src="${ctx}/scripts/tips.js"></script>
        
        <link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap.css" />
		<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/bootstrap/bootstrap-theme.min.css" />
		<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/mobile.css" />
        
        <script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/ShoppingCartAjax.js"></script>
    </head>
<body onselectstart="return true;" ondragstart="return false;"<decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>

<%-- <c:set var="showHeadNav">
	<decorator:getProperty property="meta.showHeadNav"/>
</c:set>

<c:if test="${not empty showHeadNav }">
	<c:set var="headNavBackUrl">
		<decorator:getProperty property="meta.headNavBackUrl"/>
	</c:set>
	<c:if test="${empty headNavBackUrl }">
		<c:set var="headNavBackUrl" value="javascript:history.go(-1);"/>
	</c:if>
	<div id="head">
		<ul>
			<li><a href="${headNavBackUrl }"><img src="${ctx}/themes/${theme }/images/wx-img/return.png" />&nbsp;</a></li>
			<li class="title"><h1><decorator:getProperty property="meta.heading"/></h1></li>
			<li><a href="/wx/index.jhtml"><img src="${ctx}/themes/${theme }/images/wx-img/home.png" />&nbsp;</a></li>
	    </ul>
	</div>
</c:if> --%>

<decorator:body/>

<!-- <div id="footer">
	<div class="copy">
		<p>客服热线：　　　400-0906-888</p>
		<p>客服热线：020-66811883</p>
		<p>富佑网络科技有限公司</p>
		<p>版权所有 粤ICP备11102901号</p>
	</div>
</div> -->
<div id="gotop">
	<a href="#content"><span class="gotop-link"></span></a>
</div>

<nav class="navbar navbar-inverse navbar-fixed-bottom nav-bottom">
	<div role="group" class="btn-group btn-group-justified">
		<a role="button" class="btn" href="<c:url value="/wx/index.jhtml"/>" id="home">
			<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
			<br/>
			首&nbsp;&nbsp;&nbsp;&nbsp;页
		</a>
		<a role="button" class="btn"href="<c:url value="/wx/shoppingCart.jhtml"/>" id="shopping-cart">
			<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
			<br/>
			购  物  车
		</a>
		<a role="button" class="btn" href="<c:url value="/wx/member/index.jhtml"/>" id="user-center">
			<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			<br/>
			会员中心
		</a>
		<a role="button" class="btn" href="<c:url value="/wx/member/poOrderWxs.jhtml"/>" id="orders">
			<span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>
			<br/>
			我的订单
		</a>
    </div>
</nav>
<%-- <ul class="nav nav-pills nav-justified navbar-fixed-bottom nav-bottom">
	<li role="presentation">
		<a href="<c:url value="/wx/index.jhtml"/>" id="home">
			<img src="${ctx}/themes/${theme }/images/jquery-mobile/icons-png-custom/home.png" height="60"/>
		</a>
	</li>
	<li role="presentation">
		<a href="<c:url value="/wx/shoppingCart.jhtml"/>" id="shopping-cart">
			<img src="${ctx}/themes/${theme }/images/jquery-mobile/icons-png-custom/shopping-cart.png" height="60"/>
		</a>
	</li>
	<li role="presentation">
		<a href="<c:url value="/member/index.jhtml"/>" id="user-center">
			<img src="${ctx}/themes/${theme }/images/jquery-mobile/icons-png-custom/user-center.png" height="60"/>
		</a>
	</li>
	<li role="presentation">
		<a href="<c:url value="/member/poOrderWxs.jhtml"/>" id="orders">
			<img src="${ctx}/themes/${theme }/images/jquery-mobile/icons-png-custom/orders.png" height="60"/>
		</a>
	</li>
	<li role="presentation">
		<a href="<c:url value="/member/miRecommends.jhtml"/>" id="sponse">
			<img src="${ctx}/themes/${theme }/images/jquery-mobile/icons-png-custom/sponse.png" height="60"/>
		</a>
	</li>
</ul> --%>

<!-- 设定分享内容 -->
<c:set var="shareTitle">
	<decorator:getProperty property="meta.shareTitle"/>
</c:set>
<c:if test="${empty shareTitle}">
	<c:set var="shareTitle"><decorator:title/></c:set>
</c:if>

<c:set var="shareContent">
	<decorator:getProperty property="meta.shareContent"/>
</c:set>
<c:if test="${empty shareContent}">
	<c:set var="shareContent" value=""/>
</c:if>

<c:set var="shareImg">
	<decorator:getProperty property="meta.shareImg"/>
</c:set>

<c:if test="${empty shareImg}">
	<c:set var="shareImg" value="${fullPath }/themes/${theme }/images/wx-img/share_logo.jpg"/>
</c:if>
<script type="text/javascript">
$(function(){
	$(document).scroll(function(){ //只要窗口滚动,就触发下面代码
		var scrollt = document.documentElement.scrollTop + document.body.scrollTop; //获取滚动后的高度
		if( scrollt >100 ){ //判断滚动后高度超过200px,就显示
			$("#gotop").fadeIn(400); //淡出
		}else{
			$("#gotop").stop().fadeOut(400); //如果返回或者没有超过,就淡入.必须加上stop()停止之前动画,否则会出现闪动
		}
	});
	
	$("#gotop").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部
		$("html,body").animate({scrollTop:"0px"},200);
	});
}); 
$(document).ready(function(){
});
wx.config({
    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    appId: '${jsConfig.appid}', // 必填，公众号的唯一标识
    timestamp: ${jsConfig.timestamp}, // 必填，生成签名的时间戳
    nonceStr: '${jsConfig.noncestr}', // 必填，生成签名的随机串
    signature: '${jsConfig.signature}',// 必填，签名，见附录1
    jsApiList: ["onMenuShareTimeline","onMenuShareAppMessage"] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
});

wx.ready(function(){
});

function AddUrlParam(url,str){
    if(url.indexOf('?') > -1){
        return url.replace('?','?'+str+'&').replace('sfrom=bm','');//替换链接和去掉来源
    }else{
        return url+'?'+str;
    }
}
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
    window.shareData = {
        "imgUrl": "${shareImg}",
        "timeLineLink": AddUrlParam(window.location.href,'sponsorId=${sessionScope.sessionLoginUser.userCode}&sharetoken='),
        "sendFriendLink": AddUrlParam(window.location.href,'sponsorId=${sessionScope.sessionLoginUser.userCode}&sharetoken='),
        "weiboLink": AddUrlParam(window.location.href,'sponsorId=${sessionScope.sessionLoginUser.userCode}&sharetoken='),
        "tTitle": "${shareTitle}",
        "tContent": "${shareContent}",
        "fTitle": "${shareTitle}",
        "fContent": "${shareContent}",
        "wContent": "${shareContent}"
    };
     // 发送给好友
    WeixinJSBridge.on('menu:share:appmessage', function (argv) {
        WeixinJSBridge.invoke('sendAppMessage', {
            "img_url": window.shareData.imgUrl,
            "img_width": "640",
            "img_height": "640",
            "link": window.shareData.sendFriendLink,
            "desc": window.shareData.fContent,
            "title": window.shareData.fTitle
        }, function (res) {
//            _report('send_msg', res.err_msg);
        })
    });
     
    wx.onMenuShareAppMessage({
        title: window.shareData.fTitle, // 分享标题
        desc: window.shareData.fContent, // 分享描述
        link: window.shareData.sendFriendLink, // 分享链接
        imgUrl: window.shareData.imgUrl, // 分享图标
        type: '', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function () { 
            // 用户确认分享后执行的回调函数
        	 //alert("分享成功");
        },
        cancel: function () { 
            // 用户取消分享后执行的回调函数
        	//alert("取消分享");
        }
    });

    // 分享到朋友圈
    WeixinJSBridge.on('menu:share:timeline', function (argv) {
        WeixinJSBridge.invoke('shareTimeline', {
            "img_url": window.shareData.imgUrl,
            "img_width": "640",
            "img_height": "640",
            "link": window.shareData.timeLineLink,
            "desc": window.shareData.tContent,
            "title": window.shareData.tTitle
        }, function (res) {
//            _report('timeline', res.err_msg);
        });
    });
    
    wx.onMenuShareTimeline({
        title: window.shareData.tTitle, // 分享标题
        link: window.shareData.timeLineLink, // 分享链接
        imgUrl: window.shareData.imgUrl, // 分享图标
        success: function () { 
            // 用户确认分享后执行的回调函数
            //alert("分享成功");
        },
        cancel: function () { 
            // 用户取消分享后执行的回调函数
            //alert("取消分享");
        }
    });

    // 分享到微博
    WeixinJSBridge.on('menu:share:weibo', function (argv) {
        WeixinJSBridge.invoke('shareWeibo', {
            "content": window.shareData.wContent,
            "url": window.shareData.weiboLink,
        }, function (res) {
//            _report('weibo', res.err_msg);
        });
    });
}, false);

function refreshShoppingCartNotice(){
	ShoppingCartAjax.buildShoppingCartNotice(function(data){
		$("#shoppingCartTotalQuantity").html(data.shoppingCartTotalQuantity);
		$("#shoppingCartTotalPrice").html(data.shoppingCartTotalPrice);
		$("#leftPrice").html(data.leftPrice);
	});
}

function addToCart(productCode,quantity){
	ShoppingCartAjax.addProduct(productCode,quantity,function(data){
		if(data=="OK"){
			//refreshShoppingCartNotice();
			showMsg('已成功加入购物车。数量：'+quantity);
		}else if(data!=""){
			showMsg(data);
		}
	});
}

function buyNow(productCode,quantity){
	ShoppingCartAjax.addProduct(productCode,quantity,function(data){
		if(data=="OK"){
			window.location="shoppingCart.jhtml";
		}else if(data!=""){
			showMsg(data);
		}
	});
}

function testDialog(){
	return $("#simplebool").trigger('click');
}
</script>
</body>
</html>