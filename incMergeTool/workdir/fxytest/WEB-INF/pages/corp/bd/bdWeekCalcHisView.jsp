<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看周结收益明细"/></title>
    <meta name="heading" content="<fmt:message key="查看周结收益明细"/>"/>
</head>

<link rel="stylesheet" type="text/css" media="all" href="${ctx}/themes/${theme }/styles/colorbox.css" />
<script src="${ctx}/scripts/jquery.colorbox-min.js"></script>

<style>
table.detail th{
	text-align: center;
	background-color: #F0F0F0;
	border: 1px solid #fff;
}
table.detail td{
}

table.detail .list th{
	text-align: center;
	background-color: #F0F0F0;
	border: 1px solid #fff;
	width: inherit;
}
</style>

<div class="contentBody">
    <form:form commandName="bdWeekCalcHis" method="post" id="bdWeekCalcHisForm">
    
	    <table class="detail">
	    	<tr>
	    		<th><fmt:message key="工作周"/></th>
	    		<th><fmt:message key="会员编号"/></th>
	    		<th><fmt:message key="姓名"/></th>
	    		<th><fmt:message key="荣誉级别"/></th>
	    		<th>全球分红级别</th>
	    		<th colspan="2"></th>
	    	</tr>
	    	<tr>
	    		<td>${bdWeekCalcHis.wweek }</td>
	    		<td>${bdWeekCalcHis.memberNo }</td>
	    		<td>${bdWeekCalcHis.lastName }</td>
	    		<td><win:code listCode="stars_level" value="${bdWeekCalcHis.star }"/></td>
	    		<td>${bdWshareList.shareLevel }</td>
	    		<td colspan="2"></td>
	    	</tr>
	    	<tr>
	    		<th>当周个人消费积分</th>
	    		<th>当周部门消费积分</th>
	    		<th>累计部门消费积分</th>
	    		<th>应发收益</th>
	    		<th>扣复投积分</th>
	    		<th>扣购物券</th>
	    		<th>实发收益</th>
	    	</tr>
	    	<tr>
	    		<td align="right">${bdWeekCalcHis.perSell }</td>
	    		<td align="right">${bdWeekCalcHis.groupSellRe }</td>
	    		<td align="right">${bdWeekCalcHis.acGroupSellRe }</td>
	    		<td align="right">${bdWeekCalcHis.bonusMoney }</td>
	    		<td align="right">${bdWeekCalcHis.deductReSell }</td>
	    		<td align="right">${bdWeekCalcHis.deductCoupon }</td>
	    		<td align="right">${bdWeekCalcHis.sendMoney }</td>
	    	</tr>
	    	<tr>
	    		<td colspan="7">
	    			<table class="detail list" width="100%">
				    	<tr>
				    		<th style="width:30px;">操作</th>
				    		<th style="width:150px;">奖项</th>
				    		<th>收益积分</th>
				    	</tr>
				    	<tr>
				    		<td><a name="view" href="bdBonusSubDetails.jhtml?wweek=${bdWeekCalcHis.wweek }&memberNo=${bdWeekCalcHis.memberNo}&bonusType=W01">查看明细</a></td>
				    		<td>进货折扣奖励</td>
				    		<td>${bdWeekCalcHis.bonusSell }</td>
				    	</tr>
				    	<tr>
				    		<td><a name="view" href="bdBonusSubDetails.jhtml?wweek=${bdWeekCalcHis.wweek }&memberNo=${bdWeekCalcHis.memberNo}&bonusType=W02">查看明细</a></td>
				    		<td>商铺管理奖</td>
				    		<td>${bdWeekCalcHis.bonusManager }</td>
				    	</tr>
				    	<tr>
				    		<td><a name="view" href="bdBonusSubDetails.jhtml?wweek=${bdWeekCalcHis.wweek }&memberNo=${bdWeekCalcHis.memberNo}&bonusType=W03">查看明细</a></td>
				    		<td>销售管理奖</td>
				    		<td>${bdWeekCalcHis.bonusLevel }</td>
				    	</tr>
				    	<tr>
				    		<td><a name="view" href="bdBonusSubDetails.jhtml?wweek=${bdWeekCalcHis.wweek }&memberNo=${bdWeekCalcHis.memberNo}&bonusType=W04">查看明细</a></td>
				    		<td>代理费用</td>
				    		<td>${bdWeekCalcHis.bonusHelp }</td>
				    	</tr>
				    	<tr>
				    		<td></td>
				    		<td>全球分红</td>
				    		<td>${bdWeekCalcHis.bonusWshare }</td>
				    	</tr>
				    	<%-- <th>
				    		<td></td>
				    		<td>福利奖金</td>
				    		<td>${bdWeekCalcHis.bonusSell }</td>
				    	</th>
				    	<th>
				    		<td></td>
				    		<td>稳健积分奖</td>
				    		<td>${bdWeekCalcHis.bonusSell }</td>
				    	</th> --%>
				    </table>
	    		</td>
	    	</tr>
	    	<tr>
	    		<td colspan="7">
	    			<div class="buttonBar">
	    				<form:hidden path="id"/>
	    				<input type="hidden" name="strAction" value="${param.strAction }"/>
	    				<button type="button" name="return" onclick="history.back();"><fmt:message key="operation.button.return"/></button>
	                </div>
	    		</td>
	    	</tr>
	    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("a[name='view']").colorbox({width:"700px", height:"500px", iframe:true});
	$("a[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        },
        text: false
    });

});
</script>