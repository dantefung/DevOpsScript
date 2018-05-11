<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<c:if test="${not empty scancodeType }">
	<page:apply-decorator name="member">
		
		<head>
		    <title><fmt:message key="fi.zhcz"/></title>
		    <meta name="heading" content="<fmt:message key="fi.zhcz"/>"/>
		</head>
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/FiAcBalanceAjax.js"></script>
		
		<script type="text/javascript" src="${ctx}/scripts/jquery.qrcode.min.js"></script>
		
		<style>
		#wxQrcode{
			position: relative;
			width: 200px;
			margin:0 auto;
		}
		#alipay-logo{
			position: absolute;
			top: 80px;
			left:80px;
			width: 40px;
		}
		</style>
		
		<c:if test="${scancodeType=='WECHAT' }">
			<c:if test="${not empty barcode }">
				
				<div class="text-center">
					<p>微信扫码支付，支付金额：<strong class="text-danger"><fmt:formatNumber pattern="###,##0.00">${param.chargeMoney }</fmt:formatNumber></strong></p>
					<div id="wxQrcode"></div>
					<p>
						<img src="${ctx }/themes/default/images/payment/wxpay-desc.png" width="200"/>
					</p>
					<br/>
					<a class="btn btn-default" href="editFiMemberCharge.jhtml">返回</a>
					<a class="btn btn-success" href="fiAcBalanceItems.jhtml">支付成功</a>
				</div>
				
				<script type="text/javascript">
				$(document).ready(function(){
					$("#wxQrcode").qrcode({ 
					    render: "canvas", //table方式 
					    width: 200, //宽度 
					    height:200, //高度 
					    text: "${barcode}" //任意内容 
					});
					setInterval(noticePaymentStatus,5000);
				});
				</script>
			</c:if>
		</c:if>
		
		<c:if test="${scancodeType=='ALIPAY' }">
			<c:if test="${not empty barcode }">
				
				<div class="text-center">
					<p>支付宝扫码支付，支付金额：<strong class="text-danger"><fmt:formatNumber pattern="###,##0.00">${param.chargeMoney }</fmt:formatNumber></strong></p>
					<div id="wxQrcode">
						<div id="alipay-logo">
							<img src="${ctx }/themes/default/images/payment/alipay-small.png" width="100%"/>
						</div>
					</div>
					<p>
						<img src="${ctx }/themes/default/images/payment/alipay-tips.png" width="120"/>
					</p>
					<br/>
					<a class="btn btn-default" href="editFiMemberCharge.jhtml">返回</a>
					<a class="btn btn-success" href="fiAcBalanceItems.jhtml">支付成功</a>
				</div>
				
				<script type="text/javascript">
				$(document).ready(function(){
					$("#wxQrcode").qrcode({ 
					    render: "canvas", //table方式 
					    width: 200, //宽度 
					    height:200, //高度 
					    text: "${barcode}" //任意内容 
					});
					setInterval(noticePaymentStatus,5000);
				});
				</script>
			</c:if>
		</c:if>
		
		<script type="text/javascript">
		function noticePaymentStatus(){
			FiAcBalanceAjax.getFiOnlinePayStatus("${outTradeNo}",function(data) {
				if(data==1 || data==2){
					window.location="editFiMemberCharge.jhtml?success=1";
				}
			});
		}
		</script>
	</page:apply-decorator>
</c:if>