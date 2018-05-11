<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>收益结算统计表</title>
    <meta name="heading" content="收益结算统计表"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSub" method="get" action="bdJiangJinJieSuanTongJiReportForm.jhtml" onsubmit="return validateForm(this)" id="bdJiangJinJieSuanTongJiReportForm">
    
    <spring:bind path="bdBonusSub.*">
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
    		<td colspan="2" class="title"><fmt:message key="common.information"/><!--���������ɾ��--></td>
    	</tr>
    	
    	<tr>
    		<th><fmt:message key="bd.search.month"/>:</th>
    		<td> 
					<select name="startWmonth">
						<option value=""></option>
						<c:forEach items="${bdMonthStatus }" var="bdMonthStatusVar">
							<option value="${bdMonthStatusVar.wmonth }"<c:if test="${param.startWmonth==bdMonthStatusVar.wmonth }"> selected</c:if>>${bdMonthStatusVar.wmonth }</option>
						</c:forEach>
					</select>
    		</td>
    	</tr>
   
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    			
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.report"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//������֤
	showLoading();
	return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
});
</script>