<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>收益发放统计</title>
    <meta name="heading" content="收益发放统计"/>
</head>

<script type="text/javascript" src="${ctx }/scripts/validate.js"> </script> 

<div class="contentBody">
<form method="post" action="fiBonusSendWeekReport.jhtml" onsubmit="return validateOthers(this)" id="bdPeriodForm">
	<span class="form-tips"><fmt:message key="item.in.bold.required"/></span>
	<table class="detail">
		<c:if test="${sessionScope.sessionLoginUser.companyCode=='AA'}">
			<tr>
				<th class="required"><fmt:message key="bdReconsumMoneyReport.company"/>:</th>
				<td>
					<select name="companyCode">
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</c:if>
		<tr>
			<th class="required">
        	 收益类型
	    	</th>
	    	<td>
	    		<win:list listCode="bonus.type" name="bonusType" id="bonusType" value="${param.bonusType}" defaultValue="3"/>
	    	</td>
	    </tr>
		<tr>
			<th class="required"><fmt:message key="title.accout.type" />:</th>
			<td><win:list listCode="bonus_account_type" name="accountType" id="accountType" value="${param.accountType}" defaultValue="normal"/>
			</td>
		</tr>
		<tr>
			<th><fmt:message key="fiAwardTemp.week" />:</th>
			<td>
				<input name="dateMethod" type="radio" id="dateMethodWeek" value="week" checked="checked"/>
				<select name="formatedWeek" id="formatedWeek">
					<c:forEach items="${bdPeriods }" var="bdPeriodVar">
						<option value="${bdPeriodVar.wweek }">${bdPeriodVar.wweek }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th><fmt:message key="label.or"/></th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th><fmt:message key="bdPeriod.wmonth" />:</th>
			<td>
				<input name="dateMethod" type="radio" id="dateMethodMonth" value="month"/>
				<select name="formatedMonth" id="formatedMonth">
					<c:forEach items="${bdMonthStatuss }" var="bdMonthStatusVar">
						<option value="${bdMonthStatusVar.wmonth }">${bdMonthStatusVar.wmonth }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th><fmt:message key="label.or"/></th>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<th><fmt:message key="saFiIncomeReport.dataSection" />:</th>
			<td>
				<input name="dateMethod" type="radio" id="dateMethodDate" value="date"/>
				<input name="startDate" type="text" id="startDate" size="16" readonly="readonly"/> 
				- 
				<input name="endDate" type="text" id="endDate" size="16" readonly="readonly"/>
			</td>
		</tr>
		
		<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="strAction" value="fiBonusSendWeekReport"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="fiBonusSendWeekReport">
    					<button type="submit" name="submit" onclick="bCancel=false"><fmt:message key="button.report"/></button>
    				</win:power>
                </div>
    		</td>
    	</tr>
	</table>
	
</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startDate, #endDate" ).datepicker();
	
	$("#formatedWeek").bind("click", function(){  
		$("#dateMethodWeek").prop("checked","checked");
		$("#dateMethodMonth").prop("checked",false);
		$("#dateMethodDate").prop("checked",false);
	});
	
	$("#formatedMonth").bind("click", function(){
		$("#dateMethodWeek").prop("checked",false);
		$("#dateMethodMonth").prop("checked","checked");
		$("#dateMethodDate").prop("checked",false);
	});
	
	$("#startDate, #endDate").bind("click", function(){  
		$("#dateMethodWeek").prop("checked",false);
		$("#dateMethodMonth").prop("checked",false);
		$("#dateMethodDate").prop("checked","checked");
	});
});

function validateOthers(theForm){
	if(document.getElementById("dateMethodDate").checked){
		if(theForm.startDate.value==""){
			alert("<fmt:message key="bdPeriod.startTime.required"/>");
			theForm.startDate.focus();
			return false;
		}
		if(theForm.endDate.value==""){
			alert("<fmt:message key="bdPeriod.endTime.required"/>");
			theForm.endDate.focus();
			return false;
		}
	}
	return true;
}
</script>