<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>团队业绩报表</title>
    <meta name="heading" content="团队业绩报表"/>
</head>

<div class="contentBody">
    <form:form commandName="bdBonusSub" method="post" action="bdTeamBonus.jhtml" onsubmit="return validateForm(this)" id="bdTeamBonusForm">
    
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
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title"><fmt:message key="common.information"/></td>
    	</tr>
    	<tr>
    		<td style="text-align: right;">批量查询:</td>
    		<td><input type="checkbox" id="flag" name="flag" /></td>
    	</tr>
		<tr id="trId">
			<td style="text-align: right;">会员编号:</td>
			<td>
				<input type="text" name="memberNo" id="memberNo" value="${param.memberNo }"/>
			</td>
		</tr>
		<tr>
    		<td>请选择日期范围:</td>
    		<td> 
				<fmt:message key="from"/>&nbsp;<input type="text" name="startDate" id="startDate" value="${param.startDate }" style="width:80px;" readonly="readonly"/>
				<fmt:message key="to"/>&nbsp;<input type="text" name="endDate" id="endDate" value="${param.endDate }" style="width:80px;" readonly="readonly"/>
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<input type="hidden" name="isBatch" id="isBatch" value="0">
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.report"/></button>&nbsp;&nbsp;&nbsp;
    				
                    <button type="button" name="save" onclick="window.location='bdTeamBonusImport.jhtml?needReload=1'"><fmt:message key="button.import"/></button>
                </div>
    		</td>
    	</tr>
    </table>

      
		<table width="100%" border="0" cellspacing="1" cellpadding="0"  bgcolor="#E7E7E7" style="font-size: 14px;margin-top: 10px;">
			<tr height="22" style="text-align: center;">
			    <td bgcolor="#F0F0F0" width="50%"><fmt:message key="销售ID"/></td>
    			<td bgcolor="#F0F0F0" width="50%"><fmt:message key="会员编号"/></td>
			</tr>
			<c:forEach var="item" items="${dataItems}" >
			<tr height="25" >
			    <td bgcolor="white" style="text-align: center; padding-left: 5px;">${item.sales_id }</td>
			    <td bgcolor="white" style="text-align: center; padding-right: 5px;">${item.member_no }</td>
			</tr>
			</c:forEach>
	    </table>

    
    </form:form>
</div>
<script type="text/javascript"><!--
function validateForm(theForm) {
	if(theForm.memberNo.value==""){
		alert("<fmt:message key='im.memberNo.see.null.requie'/>.");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.startDate.value==""){
		alert("请选择日期范围.");
		//theForm.startDate.focus();
		return false;
	}
	if(theForm.endDate.value==""){
		alert("请选择日期范围.");
		//theForm.endDate.focus();
		return false;
	}
	
	if(bCancel){
		showLoading();
		return true;
	}
	showLoading();
	return true;
}

$(function() {
	$( "#startDate,#endDate" ).datepicker();
	
	var $theForm = $('#bdTeamBonusForm');
	var $theTr = $theForm.find('#trId');
	var str = $theTr.html();
	
 	$theForm.find('#flag').click(function(){
		if($(this).attr('checked')){
			$theTr.html('');
			$theForm.find('#isBatch').val('1');
		}else{
			$theTr.html(str);
			$theForm.find('#isBatch').val('0');
		}
 	});
});
</script>