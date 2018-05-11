<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="回填单管理"/></title>
    <meta name="heading" content="<fmt:message key="回填单管理"/>"/>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/engine.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/dwr/interface/MiMemberAjax.js"></script>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miMemberFree" method="post" action="editMiMemberFree.jhtml" onsubmit="return validateForm(this)" id="miMemberFreeForm">
    
    <spring:bind path="miMemberFree.*">
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
    			<form:input path="memberNo" id="memberNo"/>
    			<button type="button" name="showMemberDetail" onclick="showName();">查看</button>
    		</td>
    	</tr>
    	<tr>
    		<th>会员姓名:</th>
    		<td><span id="memberName"></span></td>
    	</tr>
    	<tr>
    		<th class="required">回填金额:</th>
    		<td><form:input path="totalAmount" id="totalAmount"/></td>
    	</tr>
    	<tr>
    		<th class="required">回填PV:</th>
    		<td><form:input path="totalPv" id="totalPv"/></td>
    	</tr>
    	<tr>
    		<th>备注:</th>
    		<td><form:textarea path="remark" cols="60" rows="6"/> </td>
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
    				<c:if test="${not empty miMemberFree.id }">
    					<win:power powerCode="deleteMiMemberFree">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'MiMemberFree')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='miMemberFrees.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("button[name='showMemberDetail']",".detail").button({
        icons: {
            primary: "ui-icon-search"
        },
        text: false
    });
	showName();
});

function showName() {
	var memberNo=$("#memberNo").val();
	if(memberNo==""){
		$("#memberName").html("");
		return;
	}
	MiMemberAjax.getMiMemberInfo(memberNo,function(data) {
		if(data!=null){
			$("#memberName").html(data.lastName);
		}else{
			$("#memberName").html("");
		}
	});
}
	
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
	if(theForm.totalAmount.value=="" || !isUnsignedNumeric(theForm.totalAmount.value)){
		alert("请输入正确的回填金额");
		theForm.totalAmount.focus();
		return false;
	}
	if(theForm.totalPv.value=="" || !isUnsignedNumeric(theForm.totalPv.value)){
		alert("请输入正确的回填PV");
		theForm.totalPv.focus();
		return false;
	}

	showLoading();
	return true;
}
</script>