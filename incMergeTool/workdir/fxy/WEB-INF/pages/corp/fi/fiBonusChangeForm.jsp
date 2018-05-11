<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>增加/编辑收益条目</title>
    <meta name="heading" content="增加/编辑收益条目"/>
</head>

<script type='text/javascript' src='<c:url value="/dwr/interface/FiAjax.js"/>'></script>	
<script type='text/javascript' src='<c:url value="/dwr/engine.js"/>'></script>
<script type='text/javascript' src='<c:url value="/dwr/util.js"/>'></script>
<script language="javascript" src="${ctx }/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="fiBonusChange" method="post" action="editFiBonusChange.jhtml" onsubmit="return validateForm(this)" id="fiBonusChangeForm">
    
    <spring:bind path="fiBonusChange.*">
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
    		<th class="required"><fmt:message key="fiPayAdvice.userCode"/></th>
	    	<td>
	        	<form:input path="memberNo" id="memberNo"/>
	    	</td>
    	</tr>
    
	    <tr>
	    	<th class="required"><fmt:message key="label.company"/></th>
		    <td>
		        <select name="companyCode">
		        	<c:forEach items="${alCompanys}" var="acVar">
			        	<option value="${acVar.companyCode}">${acVar.companyName}</option>
		        	</c:forEach>
		        </select>
		    </td>
	    </tr>
		<tr>
			<th class="required">收益类型</th>
		    <td>
		    	<select name="bonusType">
		    		<c:forEach items="${bonusTypes}" var="bonusTypeVar">
			        	<option value="${bonusTypeVar.key}" <c:if test="${bonusTypeVar.key==fiBonusChange.bonusType}">selected</c:if>>${bonusTypeVar.value}</option>
		        	</c:forEach>
		    	</select>
		    </td>
	    </tr>
		<tr>
			<th class="required"><fmt:message  key="pdAdjustStock.astNo"/></th>
		    <td>
		    	<win:list listCode="bonus_bal_type" name="balType" id="balType" value="${fiBonusChange.balType}" defaultValue="1"/>
		    </td>
	    </tr>
	    
		<tr>
			<th class="required"><fmt:message key="fiBankbookTemp.dealType"/></th>
		    <td>
		        <win:list listCode="fibankbooktemp.dealtype" name="changeType" id="changeType" value="${fiBonusChange.changeType}" defaultValue="A"/>
		    </td>
	    </tr>
	    
	    <tr>
	    	<th class="required"><fmt:message key="fiBankbookJournal.dealType"/></th>
		    <td>
		    	<select name="orderType">
		    		<c:forEach items="${orderTypes}" var="orderTypeVar">
			        	<option value="${orderTypeVar.key}" <c:if test="${orderTypeVar.key==fiBonusChange.orderType}">selected</c:if>>${orderTypeVar.value}</option>
		        	</c:forEach>
		    	</select>
		    </td>
	    </tr>
	
	    <tr>
	    	<th class="required"><fmt:message  key="fiBankbookJournal.money"/></th>
		    <td>
		        <form:input path="money" id="money"/> 
		    </td>
	    </tr>
	
	    <tr>
	    	<th><fmt:message  key="poSell.notes"/></th>
		    <td>
		    	<form:textarea path="notes" id="notes" rows="6" cols="50" htmlEscape="true"/>
		    	<br/>
		    	摘要显示在会员系统
		    </td>
	    </tr>
	    <tr>
	    	<th><fmt:message  key="busi.common.remark"/></th>
		    <td>
		    	<form:textarea path="remark" id="remark" rows="6" cols="50" htmlEscape="true"/>
		    </td>
	    </tr>
    
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="itemId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiBonusChange.itemId }">
    					<win:power powerCode="deleteFiBonusChange">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusChange')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusChanges.jhtml?strAction=listFiBonusChanges&needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	//其它验证
	if(theForm.memberNo.value==""){
		alert("<fmt:message key="memberNo.required"/>");
		theForm.memberNo.focus();
		return false;
	}
	
	if(theForm.orderType.value==""){
		alert("<fmt:message key="deal.type.required"/>");
		return false;
	}
	
	if(theForm.money.value=="" || theForm.money.value==0 || !isUnsignedNumeric(theForm.money.value)){
		alert("<fmt:message key="fiPayAdvice.payMoney.required"/>");
		theForm.money.focus();
		return false;
	}
	
	if(theForm.wmonth.value!="" && theForm.wweek.value!=""){
		alert("<fmt:message key="wmonthWweek.type.oneMax"/>");
		return false;
	}
	//
	showLoading();
	return true;
}
</script>