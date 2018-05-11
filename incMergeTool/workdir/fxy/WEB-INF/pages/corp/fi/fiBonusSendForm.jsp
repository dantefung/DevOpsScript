<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="收益发放计划管理"/></title>
    <meta name="heading" content="<fmt:message key="收益发放计划管理"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusSend" method="post" action="editFiBonusSend.jhtml" id="fiBonusSendForm">
	<input type="hidden" name="strAction" value="${param.strAction }"/>
	<input type="hidden" name="bonusType" 		value="${bonusType}"/>
	
	<spring:bind path="fiBonusSend.*">
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
	
	<table class='detail' width="100%">
		<tr>
			<th><font style="font-weight: normal;">发放计划编号:</font></th>
		    <td>${fiBonusSend.operNo}<form:hidden path="operNo"/></td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">建立者账号:</font></th>
		    <td>${fiBonusSend.operCode}</td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">建立者名称:</font></th>
		    <td>${fiBonusSend.operName}</td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">建立日期:</font></th>
		    <td>${fiBonusSend.operDate}</td>
		</tr>
		<tr>
			<th><fmt:message  key="bdSendRecord.remittanceMoneyScope"/></th>
		    <td>${fiBonusSend.amountLow} - ${fiBonusSend.amountUp}</td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">计划状态:</font></th>
		    <td><win:code listCode="bonus_send_status" value="${fiBonusSend.status}"/></td>
		</tr>
		
	    
	    <tr>
		    <th class="command">
		        <fmt:message key="sysOperationLog.moduleName"/>
		    </th>
		    <td class="command">
		    	<win:power powerCode="verifyFiBonusSend">
		    		<c:if test="${fiBonusSend.status==0}">
						<button type="button" name="verify" onclick="verifyFiBonusSend(this.form)">确认发放</button>
					</c:if>
				</win:power>
				<win:power powerCode="deleteFiBonusSend">
					<c:if test="${fiBonusSend.status==0}">
						<button type="button" name="delete" onclick="deleteFiBonusSend(this.form)"><fmt:message key="operation.button.delete"/></button>
					</c:if>
				</win:power>
				<win:power powerCode="exportSendingFiBonusSend">
					<button type="button" name="export"  onclick="exportSendingFiBonusSend(this.form);">导出发放清单</button>
				</win:power>
				<button type="button" name="cancel" onclick="window.location='fiBonusSends.jhtml?strAction=listFiBonusSends&needReload=1'"><fmt:message key="operation.button.return"/></button>
		    </td>
		</tr>
	
	</table>
	
	</form:form>
	
	<br/>
	
	<b>计划所含收益领取申请:</b><br/>
	<table width="100%" border="0">
		<tr>
			<td width="50%" height="460"><iframe name="srcFrm" frameborder="0" src="fiBonusApplsForSend.jhtml?strAction=listFiBonusApplsForSend&operNo=${fiBonusSend.operNo}" width="100%"  height="100%" scrolling="auto"></iframe></td>
		</tr>
	</table>
</div>
<script type="text/javascript">
$(function() {
	$("button[name='export']").button({
        icons: {
            primary: "ui-icon-report"
        }
    });
	$("button[name='verify']").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
});
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	showLoading();
	return true;
}

function verifyFiBonusSend(theForm){
	if(confirm("确定执行“确认发放”？确定之后将不再允许执行申请的增删操作！")){
		theForm.strAction.value="verifyFiBonusSend";
		theForm.submit();
	}
}

function deleteFiBonusSend(theForm){
	if(confirm("确定删除该计划？")){
		theForm.strAction.value="deleteFiBonusSend";
		theForm.submit();
	}
}

function exportSendingFiBonusSend(theForm){
	theForm.strAction.value="exportSendingFiBonusSend";
	theForm.submit();
}
</script>