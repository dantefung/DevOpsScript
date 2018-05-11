<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="物流点管理"/></title>
    <meta name="heading" content="<fmt:message key="物流点管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/AlRegionAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="fiPayAdvice" method="post" action="editFiPayAdvice.jhtml" onsubmit="return validateForm(this)" id="fiPayAdviceForm">
    
    <spring:bind path="fiPayAdvice.*">
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
    	<c:if test="${not empty fiPayAdvice.adviceCode }">
	    	<tr>
	    		<th class="required">分公司:</th>
	    		<td>${fiPayAdvice.companyCode}<form:hidden path="companyCode"/> </td>
	    	</tr>
	    </c:if>
	    <c:if test="${not empty fiPayAdvice.adviceCode }">
	    	<tr>
	    		<th class="required">会员编号:</th>
	    		<td>
	    			${fiPayAdvice.userCode }
	    			<form:hidden path="userCode"/>
	    		</td>
	    	</tr>
	    </c:if>
	    <c:if test="${empty fiPayAdvice.adviceCode }">
	    	<tr>
	    		<th class="required">会员编号:</th>
	    		<td><form:input path="userCode" id="userCode"/></td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th class="required">区域:</th>
    		<td>
    			<select name="country" id="country" style="width:135px;display: none;"><option value=""><fmt:message key="list.please.select"/></option></select>
    			<select name="province" id="province" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
    			<select name="city" id="city" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
    			<select name="district" id="district" style="width:135px"><option value=""><fmt:message key="list.please.select"/></option></select>
    		</td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" id="remark" cols="60" rows="6"/></td>
    	</tr>
    	
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adviceCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiPayAdvice.adviceCode && fiPayAdvice.status==0}">
    					<win:power powerCode="deleteFiPayAdvice">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiPayAdvice')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiPayAdvices.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	<c:if test="${not empty province}">
		refreshChildRegions("","${province.regionId}","2860","province");
		<c:if test="${not empty city}">
			refreshChildRegions("","${city.regionId}","${province.regionId}","city");
			<c:if test="${not empty district}">
				refreshChildRegions("","${district.regionId}","${city.regionId}","district");
			</c:if>
			<c:if test="${empty district}">
				refreshChildRegions("","-1","${city.regionId}","district");
			</c:if>
		</c:if>
		<c:if test="${empty city}">
			refreshChildRegions("","-1","${province.regionId}","city");
		</c:if>
	</c:if>
	<c:if test="${empty fiPayAdvice.regionCode}">
	refreshChildRegions("","-1","2860","province");
	</c:if>
	 $('#country').change(function(){
    	refreshChildRegions("","-1",$(this).children('option:selected').val(),"province");
    	refreshChildRegions("","-1","-1","city");
    	refreshChildRegions("","-1","-1","district");
    });
    $('#province').change(function(){
    	refreshChildRegions("","-1",$(this).children('option:selected').val(),"city");
    	refreshChildRegions("","-1","-1","district");
    });
    $('#city').change(function(){
    	refreshChildRegions("","-1",$(this).children('option:selected').val(),"district");
    });

});

function refreshChildRegions(companyCode, selectedValue, regionId, targetObjId){
	dwr.util.removeAllOptions(targetObjId);
	AlRegionAjax.getChildRegionsToMap(regionId,companyCode, function(data){
 		dwr.util.addOptions(targetObjId, data);
 		document.getElementById(targetObjId).value = selectedValue;
	});
}

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.userCode.value==""){
		alert("请输入会员编号");
		theForm.userCode.focus();
		return false;
	}
	if (theForm.province.value == null || theForm.province.value == '' || theForm.province.value == '-1') {
		alert("<fmt:message key='mi.province.null.requie'/>.");
		theForm.province.focus();
		return false;
	}

	showLoading();
	return true;
}
</script>