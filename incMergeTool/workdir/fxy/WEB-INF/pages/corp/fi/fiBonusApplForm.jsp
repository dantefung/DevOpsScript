<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>新增收益提现</title>
    <meta name="heading" content="新增收益提现"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusAppl" method="post" action="editFiBonusAppl.jhtml" onsubmit="return validateForm(this)" id="fiBonusApplForm">
    
    <spring:bind path="fiBonusAppl.*">
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
			<th>用户编号</th>
		    <td>
		        <form:input path="userCode" id="userCode" cssClass="text medium"/>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        <input type="button" class="button" style="cursor: pointer; width: 100px; height: 21px;" onclick="showName();" value="<fmt:message key='operation.button.search'/>"/>
				<b id="linkName"></b>
		    </td>
	    </tr>
	    <tr>
		    <th>申请类型</th>
		    <td><win:list name="applType" listCode="fibonusappl.appltype" defaultValue="" value="${fiBonusAppl.applType}" onchange="applTypeChange(this.form);"/>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        <b id="applTypeMsgDiv" style="display: <c:if test="${!showAgentNoMsg}">none</c:if>;">${agentNoMsg}</b>
		    </td>
	    </tr>
	    <tr>
		    <th>申请金额</th>
		    <td>
		        <form:input path="amount" id="amount" cssClass="text medium"/>
		        &nbsp;&nbsp;&nbsp;&nbsp;
		        <b id="usableBalanceMsg"></b>
		    </td>
	    </tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="applNo"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<c:if test="${not empty fiBonusAppl.applNo }">
    					<win:power powerCode="deleteFiBonusAppl">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusAppl')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusAppls.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
	showLoading();
	return true;
}

function applTypeChange(theForm){
	if(theForm.applType.value=="2"){
		document.getElementById("applTypeMsgDiv").style.display = "";
	}else{
		document.getElementById("applTypeMsgDiv").style.display = "none";
	}
}

function showName(){
	var memberNo = document.getElementById("userCode").value;
	fiBonusApplManager.getMemberInfoForBonusAppl(memberNo, function(data) {
		var returnMsg;
		var usableBalance;
		if (data != null && data['memberName'] != null) {
			returnMsg = "<fmt:message key="fiBonusAppl.memberName"/>:"+data['memberName'];
			if(data['agentNo'] != null){
				returnMsg = returnMsg + "&nbsp;&nbsp;<fmt:message key="fiBonusAppl.memberAgentNo"/>:" + data['agentNo'];
			}
			if(data['usableBalance'] != null){
				usableBalance = data['usableBalance'];
			}
		} else {
			returnMsg = "can't find!";
		}
		document.getElementById('linkName').innerHTML = "<b>" + returnMsg + "</b>";
		document.getElementById('usableBalanceMsg').innerHTML = "<b><fmt:message key="fiBonusAppl.memberBalanceMsg"/>:" + usableBalance + "</b>";
	});
}
</script>