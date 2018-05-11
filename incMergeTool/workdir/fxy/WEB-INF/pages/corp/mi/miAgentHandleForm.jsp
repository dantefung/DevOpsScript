<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="报单中心管理"/></title>
    <meta name="heading" content="<fmt:message key="报单中心管理"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>
<script type="text/javascript" src="${ctx}/scripts/validate.js"></script>

<div class="contentBody">
    <form:form commandName="miAgent" method="post" action="handleMiAgent.jhtml" onsubmit="return validateForm(this)" id="miAgentForm" name="miAgentForm">
    
    <spring:bind path="miAgent.*">
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
    			${miAgent.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${miAgent.userCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="区域"/>:</th>
    		<td>
    			${fullRegionName}
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="备注"/>:</th>
    		<td>
    			${fn:replace(miAgent.remark, vEnter, '<br>')}
    		</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${miAgent.creatorCode } - ${miAgent.createTime }</td>
    	</tr>
    	<c:if test="${miAgent.status==1 }">
	    	<tr>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${miAgent.checkerCode } - ${miAgent.checkTime }</td>
	    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedAgentIds" id="selectedAgentIds" value="${miAgent.agentId }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${miAgent.status==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkMiAgent' }">
	    						<button type="submit" name="save" onclick="bCancel=false">审核</button>
	    					</c:if>
    					</c:if>
    					<c:if test="${miAgent.status==1}">
    						<!-- 已审核 -->
   							<c:if test="${param.strAction=='uncheckMiAgent' }">
	    						<button type="submit" name="save" onclick="bCancel=false">取消此报单中心</button>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='miAgents.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkMiAgent' }">
	<c:set var="confirmMsg">确认审核当前报单中心</c:set>
</c:if>
<c:if test="${param.strAction=='uncheckMiAgent' }">
	<c:set var="confirmMsg">确认取消当前报单中心</c:set>
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