<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="导出FCF管理"/></title>
    <meta name="heading" content="<fmt:message key="导出FCF管理"/>"/>
</head>
<%
request.setAttribute("vEnter", "\n");
%>

<div class="contentBody">
    <form:form commandName="fiAcAppl" method="post" action="handleFiAcApplToETB.jhtml" onsubmit="return validateForm(this)" id="fiAcApplForm" name="fiAcApplForm">
    
    <spring:bind path="fiAcAppl.*">
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
    		<th>申请单号:</th>
    		<td>
    			${fiAcAppl.applNo }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="公司"/>:</th>
    		<td>
    			${fiAcAppl.companyCode }
    		</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="会员编号"/>:</th>
    		<td>
    			${fiAcAppl.memberNo }
    			<c:if test="${miMember.isCredit==1 }"><span class="important">[<fmt:message key="lang.credit"/>]</span></c:if>
    		</td>
    	</tr>
    	<tr>
    		<th>申请导出积分:</th>
    		<td>${fiAcAppl.amount }</td>
    	</tr>
    	<tr>
    		<th>FCF账户地址:</th>
    		<td>${fiAcAppl.caddress }</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">其它信息</td>
    	</tr>
    	<tr>
    		<th>当前状态:</th>
    		<td>
    			<win:code listCode="coin2kmc_appl_status" value="${fiAcAppl.status }"/>
    		</td>
    	</tr>
    	<c:if test="${not empty fiAcAppl.memo }">
	    	<tr>
	    		<th>备注:</th>
	    		<td>${fn:replace(fiAcAppl.memo, vEnter, '<br>')}</td>
	    	</tr>
    	</c:if>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${fiAcAppl.createrCode } - ${fiAcAppl.createTime }</td>
    	</tr>
    	<c:if test="${fiAcAppl.status==1 || fiAcAppl.status==3 || fiAcAppl.status==4}">
	    	<tr>
	    		<th><fmt:message key="审核时间"/>:</th>
	    		<td>${fiAcAppl.checkerCode } - ${fiAcAppl.checkTime }</td>
	    	</tr>
    	</c:if>
    	<c:if test="${fiAcAppl.status==9}">
	    	<tr>
	    		<th>退回时间:</th>
	    		<td>${fiAcAppl.returnCode } - ${fiAcAppl.returnTime }</td>
	    	</tr>
	    	<c:if test="${not empty fiAcAppl.returnRemark }">
		    	<tr>
		    		<th>退回备注:</th>
		    		<td>${fn:replace(fiAcAppl.returnRemark, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
    	</c:if>
    	<c:if test="${fiAcAppl.status==3 || fiAcAppl.status==4}">
	    	<tr>
	    		<th>处理时间:</th>
	    		<td>${fiAcAppl.sendCode } - ${fiAcAppl.sendTime }</td>
	    	</tr>
	    	<c:if test="${not empty fiAcAppl.falseReason }">
		    	<tr>
		    		<th>失败原因:</th>
		    		<td>${fn:replace(fiAcAppl.falseReason, vEnter, '<br>')}</td>
		    	</tr>
	    	</c:if>
    	</c:if>
    	<c:if test="${param.strAction=='failFiAcApplToETB' }">
    	<tr>
    		<th>失败原因:</th>
    		<td><form:textarea path="falseReason" cols="60" rows="4"/></td>
    	</tr>
    	</c:if>
    	
    	<tr>
    		<td colspan="4">
    			<div class="buttonBar">
    				<input type="hidden" name="selectedIds" id="selectedIds" value="${fiAcAppl.id }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<c:if test="${fiAcAppl.status==0}">
    						<!-- 未审核 -->
	    					<c:if test="${param.strAction=='checkFiAcApplToETB' }">
	    						<button type="submit" name="save" onclick="bCancel=false">审核</button>
	    					</c:if>
	    					<c:if test="${param.strAction=='returnFiAcApplToETB' }">
	    						<button type="submit" name="save" onclick="bCancel=false">退回此申请单</button>
	    					</c:if>
    					</c:if>
    					<c:if test="${fiAcAppl.status==1}">
    						<c:if test="${param.strAction=='successFiAcApplToETB' }">
	    						<button type="submit" name="save" onclick="bCancel=false">处理成功</button>
	    					</c:if>
	    					<c:if test="${param.strAction=='failFiAcApplToETB' }">
	    						<button type="submit" name="save" onclick="bCancel=false">处理失败</button>
	    					</c:if>
    					</c:if>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='fiAcApplToETBs.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>

<c:if test="${param.strAction=='checkFiAcApplToETB' }">
	<c:set var="confirmMsg">确认审核当前申请单</c:set>
</c:if>
<c:if test="${param.strAction=='returnFiAcApplToETB' }">
	<c:set var="confirmMsg">确认退回当前申请单</c:set>
</c:if>
<c:if test="${param.strAction=='successFiAcApplToETB' }">
	<c:set var="confirmMsg">确认将当前申请单标为处理成功</c:set>
</c:if>
<c:if test="${param.strAction=='failFiAcApplToETB' }">
	<c:set var="confirmMsg">确认将当前申请单标为处理失败</c:set>
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