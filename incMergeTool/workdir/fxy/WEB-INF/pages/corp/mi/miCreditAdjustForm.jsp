<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="贷款状态管理"/></title>
    <meta name="heading" content="<fmt:message key="贷款状态管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miCreditAdjust" method="post" action="editMiCreditAdjust.jhtml" onsubmit="return validateForm(this)" id="miCreditAdjustForm">
    
    <spring:bind path="miCreditAdjust.*">
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
    		<td>
    			<c:if test="${not empty miCreditAdjust.id }">
    				<form:hidden path="memberNo" id="memberNo"/>${miCreditAdjust.memberNo }
    			</c:if>
    			<c:if test="${empty miCreditAdjust.id }">
    				<form:input path="memberNo" id="memberNo"/>&nbsp;
    				<button type="button" name="view" onclick="showMemberInfo();">查看</button>
    			</c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>会员姓名:</th>
    		<td><span id="memberName"></span></td>
    	</tr>
    	<tr>
    		<th>荣誉级别:</th>
    		<td><span id="starName"></span></td>
    	</tr>
    	<tr>
    		<th>当前是否贷款:</th>
    		<td>
    			<span id="isCredit"></span>
    		</td>
    	</tr>
    	<tr>
    		<th class="required">是否贷款:</th>
    		<td><win:list name="newStatus" id="newStatus" listCode="yesno" defaultValue="" value="${miCreditAdjust.newStatus }" onchange="switchStatus();"/> </td>
    	</tr>
    	<tr>
    		<th class="required">贷款金额:</th>
    		<td><form:input path="creditAmount" id="creditAmount"/></td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" id="remark" cols="60" rows="4"/></td>
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
    				<c:if test="${not empty miCreditAdjust.id }">
    					<win:power powerCode="deleteMiCreditAdjust">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiCreditAdjust')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miCreditAdjusts.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("button[name='view']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        },
        text: false
    });
	
	showMemberInfo();
	switchStatus();
});

function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(theForm.memberNo.value==""){
		alert("请输入会员编号");
		theForm.memberNo.focus();
		return false;
	}
	if(theForm.newStatus.value=="1" && !isUnsignedNumeric(theForm.creditAmount.value)){
		alert("请输入正确的贷款金额");
		theForm.creditAmount.focus();
		return false;
	}
	
	showLoading();
	return true;
}

function switchStatus(){
	if($("#newStatus").val()=="1"){
		$("#creditAmount").prop("disabled","");
	}else{
		$("#creditAmount").prop("disabled","true");
	}
}

function showMemberInfo() {
	var memberNo=$("#memberNo").val();
	if(memberNo==""){
		$("#memberName").html("");
		$("#starName").html("");
		$("#isCredit").html("");
	}
	MiMemberAjax.getMiMemberInfo(memberNo,function(data) {
		if(data!=null){
			$("#memberName").html(data.lastName);
			$("#starName").html(data.star);
			$("#isCredit").html(data.isCredit);
		}else{
			$("#memberName").html("");
			$("#starName").html("");
			$("#isCredit").html("");
		}
	});
}
</script>