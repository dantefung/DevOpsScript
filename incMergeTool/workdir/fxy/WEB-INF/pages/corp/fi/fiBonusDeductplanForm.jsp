<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>增加/编辑扣补计划</title>
    <meta name="heading" content="增加/编辑扣补计划"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusDeductplan" method="post" action="editFiBonusDeductplan.jhtml" onsubmit="return validateForm(this)" id="fiBonusDeductplanForm">
    
    <spring:bind path="fiBonusDeductplan.*">
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
    		<th class="required">用户编号</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}"><form:input path="userCode" id="userCode" cssClass="text medium"/></c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}"><form:input path="userCode" id="userCode" cssClass="readonly" readonly="true"/></c:if>
		    </td>
	    </tr>
	
	    <tr>
		    <th class="required">需扣款总额</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}"><form:input path="amount" id="amount" cssClass="text medium"/></c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}"><form:input path="amount" id="amount" cssClass="readonly" readonly="true"/></c:if>
		    </td>
	    </tr>
	
	    <tr>
	    <th class="required">开始时间</th>
		    <td>
		        <form:input path="startTime" id="startTime" cssClass="readonly" readonly="true"/>
		    </td>
	    </tr>
	
	    <tr>
	    <th class="required">结束时间</th>
		    <td>
		        <form:input path="endTime" id="endTime" cssClass="readonly" readonly="true"/>
		    </td>
	    </tr>
	
	    <tr>
	    <th class="required">收益类型</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}">
		        	<win:list name="bonusType" listCode="bonus.type" value="${fiBonusDeductplan.bonusType }" defaultValue=""/>
		        </c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}">
		        	<form:hidden path="bonusType"/>
		        	<win:code listCode="bonus.type" value="${fiBonusDeductplan.bonusType }"/>
		        </c:if>
		    </td>
	    </tr>
	    
	    <tr>
		    <th class="required">扣款比例</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}"><form:input path="deductPercent" id="deductPercent" cssClass="text medium"/>%</c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}"><form:input path="deductPercent" id="deductPercent" cssClass="readonly" readonly="true"/>%</c:if>
		    </td>
	    </tr>

	    <tr>
		    <th>摘要</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}"><textarea cols="60" rows="5" name="notes" id="notes" cssClass="text medium">${fiBonusDeductplan.notes }</textarea></c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}"><textarea cols="60" rows="5" name="notes" id="notes" cssClass="readonly" readonly="true">${fiBonusDeductplan.notes }</textarea></c:if>
		    </td>
	    </tr>
	
	    <tr>
		    <th>备注</th>
		    <td>
		        <c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}"><textarea cols="60" rows="5" name="remark" id="remark" cssClass="text medium">${fiBonusDeductplan.remark }</textarea></c:if>
		        <c:if test="${fiBonusDeductplan.id!=null && fiBonusDeductplan.status!=0}"><textarea cols="60" rows="5" name="remark" id="remark" cssClass="readonly" readonly="true">${fiBonusDeductplan.remark }</textarea></c:if>
		    </td>
	    </tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiBonusDeductplan.id && fiBonusDeductplan.status==0}">
    					<win:power powerCode="deleteFiBonusDeductplan">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusDeductplan')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusDeductplans.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
<c:if test="${fiBonusDeductplan.id==null || fiBonusDeductplan.status==0}">
$(function() {
	$( "#startTime, #endTime" ).datepicker();
});
</c:if>
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.deductPercent.value=="" || !isNum(theForm.deductPercent.value)){
		alert("扣款比例请填写数字");
		return false;
	}
	showLoading();
	return true;
}

function isNum(num){
  var reNum=/^\d*$/;
  return(reNum.test(num));
}
</script>