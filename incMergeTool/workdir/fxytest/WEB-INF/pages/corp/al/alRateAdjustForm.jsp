<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="货币汇率调整"/></title>
    <meta name="heading" content="<fmt:message key="货币汇率调整"/>"/>
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
    <form:form commandName="alRateAdjust" method="post" action="editAlRateAdjust.jhtml" onsubmit="return validateForm(this)" id="alRateAdjustForm">
    
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
    <span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th class="required">调整类型:</th>
    		<td>
    			<spring:bind path="alRateAdjust.adjustType">
		        	<win:list name="${status.expression}" listCode="rate_adjust_type" value="${status.value}" defaultValue="0"/>
		    	</spring:bind>
    		</td>
    	</tr>
    	<tr>
    		<th>计划调整时间:</th>
    		<td>
    			<select name="preYear" id="preYear">
    				<c:forEach begin="${currentYear }" end="${currentYear+1 }" var="preYearVar">
    					<option value="${preYearVar}">${preYearVar}</option>
    				</c:forEach>
    			</select>
    			<select name="preMonth" id="preMonth">
    				<c:forEach begin="1" end="12" var="preMonthVar">
    					<option value="${preMonthVar}">${preMonthVar}</option>
    				</c:forEach>
    			</select>
    			<select name="preDay" id="preDay">
    				<c:forEach begin="1" end="31" var="preDayVar">
    					<option value="${preDayVar}">${preDayVar}</option>
    				</c:forEach>
    			</select>
    			<select name="preHour" id="preHour">
    				<c:forEach begin="0" end="23" var="preHourVar">
    					<option value="${preHourVar}">${preHourVar}:00</option>
    				</c:forEach>
    			</select>
    			此时间仅针对“定时”有效
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">各货币汇率</td>
    	</tr>
    	<tr>
    		<th class="required">&nbsp;</th>
    		<td>
    			<table class="innerTable">
    				<tr>
    					<th><input type="checkbox" name="chkAll" id="chkAll" value="1" title="选择/取消选择全部"/></th>
    					<th>货币</th>
<%--
    					<th>汇率(入)</th>
--%>
    					<th>汇率(出)</th>
    				</tr>
	    			<c:forEach items="${alCurrencys}" var="alCurrencyVar">
	    				<tr>
	    					<td align="center">
	    						<input type="checkbox" name="chkRate" value="${alCurrencyVar.currencyCode }"/>
	    					</td>
	    					<td>${alCurrencyVar.currencyCode } - ${alCurrencyVar.currencyName }
	    					</td>
	    					<%--<td>
	    						<input type="text" name="txtInRate_${alCurrencyVar.currencyCode }" value="${alCurrencyVar.inRate }" size="30"/>
	    					</td>--%>
	    					<td>
	    						<input type="text" name="txtOutRate_${alCurrencyVar.currencyCode }" value="${alCurrencyVar.outRate }" size="30"/>
	    					</td>
	    				</tr>
	    			</c:forEach>
    			</table>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction}">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty alRateAdjust.adjustCode }">
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
		$("#chkAll").click(function() {
			var checkStatus=$(this).is(':checked');
			$("input[name='chkRate']").each(function() {
				$(this).prop("checked", checkStatus);
			});
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