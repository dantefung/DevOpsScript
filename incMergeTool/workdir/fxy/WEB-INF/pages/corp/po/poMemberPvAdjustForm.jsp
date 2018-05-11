<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="会员累积消费调整"/></title>
    <meta name="heading" content="<fmt:message key="会员累积消费调整"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="poMemberPvAdjust" method="post" action="editPoMemberPvAdjust.jhtml" onsubmit="return validateForm(this)" id="poMemberPvAdjustForm" name="poMemberPvAdjustForm">
    
    <spring:bind path="poMemberPvAdjust.*">
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
    		<th class="required">会员编号:</th>
    		<td><form:input path="userCode" id="userCode" onchange="getMemberInfo(this);"/></td>
    	</tr>
    	<tr>
    		<th>会员姓名:</th>
    		<td><span id="lastName"></span></td>
    	</tr>
    	<tr>
    		<th>当前累积消费PV:</th>
    		<td><span id="totalPv"></span></td>
    	</tr>
    	<tr>
    		<th class="required">调整额度:</th>
    		<td><form:input path="adjustPv" id="adjustPv"/></td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" id="remark" rows="6" cols="60"/></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="adjustCode"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty poMemberPvAdjust.adjustCode && poMemberPvAdjust.status==0}">
    					<win:power powerCode="deletePoMemberPvAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'PoMemberPvAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='poMemberPvAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	if(theForm.userCode.value==""){
		alert("请输入会员编号");
		theForm.userCode.focus();
		return false;
	}
	if(theForm.adjustPv.value=="" || !isNumeric(theForm.adjustPv.value)){
		alert("请输入需要调整的额度，必须为数字");
		theForm.adjustPv.focus();
		return false;
	}
	showLoading();
	return true;
}

$(document).ready(function(){
    getMemberInfo(document.poMemberPvAdjustForm.userCode);
});

function getMemberInfo(obj){
	if(obj.value==""){
		$("#totalPv").html("");
		return;
	}
	MiMemberAjax.getPlMemberOrderData(obj.value, function(data){
		if(data==null){
			$("#totalPv").html("");
			$("#lastName").html("");
		}else{
			$("#totalPv").html(data.totalPv);
			$("#lastName").html(data.lastName);
		}
	});
	MiMemberAjax.getMiMemberInfo(obj.value, function(data){
		if(data==null){
			$("#lastName").html("");
		}else{
			$("#lastName").html(data.lastName);
		}
	});
}
</script>