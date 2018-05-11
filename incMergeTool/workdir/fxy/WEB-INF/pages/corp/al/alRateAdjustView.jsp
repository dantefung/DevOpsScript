<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看汇率调整单"/></title>
    <meta name="heading" content="<fmt:message key="查看汇率调整单"/>"/>
</head>
<style>
table.innerTable {
	font-weight: normal;
	border-collapse:collapse;
	position: relative;
	border: 1px solid #dadada;
	width:100%;
}

table.innerTable th {
	border: 1px solid #dadada;
	color: #333333;
	text-align: center;
	background: #f0f0f0;
	height: 20px;
	padding: 4px;
	white-space: nowrap;
}

table.innerTable td {
	border: 1px solid #dadada;
	color: black;
	padding: 4px;
}

</style>
<div class="contentBody">
    <form:form commandName="alRateAdjust" method="post" action="viewAlRateAdjust.jhtml" onsubmit="return validateForm(this)" id="alRateAdjustForm">
    
    <spring:bind path="alRateAdjust.*">
        <c:if test="${not empty status.errorMessages}">
    	<div class="error">
            <ul>
                <c:forEach var="error" items="${status.errorMessages}">
                    <li>${error}</li>
                </c:forEach>
            </ul>
        </div>
        </c:if>
    </spring:bind>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息</td>
    	</tr>
    	<tr>
    		<th>调整单号:</th>
    		<td>${alRateAdjust.adjustCode }</td>
    	</tr>
    	<tr>
    		<th>调整类型:</th>
    		<td><win:code listCode="rate_adjust_type" value="${alRateAdjust.adjustType }"/></td>
    	</tr>
    	<tr>
    		<th>计划调整时间:</th>
    		<td>${alRateAdjust.preAdjustTime } (此时间仅针对“定时”有效)</td>
    	</tr>
    	<tr>
    		<th>创建时间:</th>
    		<td>${alRateAdjust.createTime }&nbsp;${alRateAdjust.creatorCode }</td>
    	</tr>
    	<tr>
    		<th>状态:</th>
    		<td><win:code listCode="rate_adjust_status" value="${alRateAdjust.status }"/></td>
    	</tr>
    	<tr>
    		<th>审核时间:</th>
    		<td>${alRateAdjust.checkTime }&nbsp;${alRateAdjust.checkerCode }</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">各货币汇率</td>
    	</tr>
    	<tr>
    		<th class="required">&nbsp;</th>
    		<td>
    			<table class="innerTable">
    				<tr>
    					<th>货币</th>
    					<th>汇率(入)</th>
    					<th>汇率(出)</th>
    				</tr>
	    			<c:forEach items="${alRateAdjustItems}" var="alRateAdjustItemVar">
	    				<tr>
	    					<td>${alRateAdjustItemVar.currency_code}&nbsp;${alRateAdjustItemVar.currency_name }
	    					</td>
	    					<td>${alRateAdjustItemVar.in_rate }</td>
	    					<td>${alRateAdjustItemVar.out_rate }</td>
	    				</tr>
	    			</c:forEach>
    			</table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value=""/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<c:if test="${alRateAdjust.status=='0' }">
	    				<win:power powerCode="checkAlRateAdjust">
	    					<button type="submit" name="check" onclick="bCancel=false;this.form.strAction.value='checkAlRateAdjust';">审核</button>
	    				</win:power>
	    				<win:power powerCode="deleteAlRateAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'AlRateAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='alRateAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
	$(function() {
		$("button[name='check']").button({
	        icons: {
	            primary: "ui-icon-check"
	        }
	    });
	});
	function validateForm(theForm) {
		if (bCancel) {
			showLoading();
			return true;
		}
		//其它验证
		showLoading();
		return true;
	}
</script>