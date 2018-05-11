<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="交易盘代理申请管理"/></title>
    <meta name="heading" content="<fmt:message key="交易盘代理申请管理"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miTradeAgent" method="post" action="handleMiTradeAgent.jhtml" onsubmit="return validateForm(this)" id="miTradeAgentForm" name="miTradeAgentForm">
    
    <spring:bind path="miTradeAgent.*">
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
    		<th><fmt:message key="公司"/>:</th>
    		<td>
    			${miTradeAgent.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th>申请单号:</th>
    		<td>
    			${miTradeAgent.applCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${miTradeAgent.userCode }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘用户名:</th>
    		<td>
    			${miTradeAgent.tradeUserName }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘ID:</th>
    		<td>
    			${miTradeAgent.tradeId }
    		</td>
    	</tr>
    	<tr>
    		<th>交易盘姓名:</th>
    		<td>
    			${miTradeAgent.tradeTrueName }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td>
    			${fn:replace(miTradeAgent.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${miTradeAgent.creatorCode } - ${miTradeAgent.createTime }</td>
    	</tr>
    	<c:if test="${miTradeAgent.status==1 }">
	    	<tr>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${miTradeAgent.checkerCode } - ${miTradeAgent.checkTime }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${miTradeAgent.status==9 }">
	    	<tr>
	    		<th><fmt:message key="取消/退回时间"/>:</th>
	    		<td>${miTradeAgent.cancleCode } - ${miTradeAgent.cancleTime }</td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedApplCodes" id="selectedApplCodes" value="${miTradeAgent.applCode }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${miTradeAgent.status==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkMiTradeAgent' }">
	    						<button type="submit" name="save" onclick="bCancel=false">审核</button>
	    					</c:if>
    					</c:if>
    					<c:if test="${miTradeAgent.status==1 || miTradeAgent.status==0}">
    						<!-- 已审核 -->
   							<c:if test="${param.strAction=='uncheckMiTradeAgent' }">
	    						<button type="submit" name="save" onclick="bCancel=false">取消此申请单</button>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='miTradeAgents.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkMiTradeAgent' }">
	<c:set var="confirmMsg">确认审核当前申请单</c:set>
</c:if>
<c:if test="${param.strAction=='uncheckMiTradeAgent' }">
	<c:set var="confirmMsg">确认取消当前申请单</c:set>
</c:if>
    	
<script type="text/javascript">
function validateForm(theForm) {
	if(bCancel){
		showLoading();
		return true;
	}
	//其它验证
	if(!confirm("${confirmMsg}？")){
		return false;
	}
	showLoading();
	return true;
}
</script>