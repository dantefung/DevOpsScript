<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>修改收益申请</title>
    <meta name="heading" content="修改收益申请"/>
</head>

<div class="contentBody">
    <form:form commandName="fiBonusApplMod" method="post" action="editFiBonusApplMod.jhtml" onsubmit="return validateForm(this)" id="fiBonusApplModForm">
    
    <spring:bind path="fiBonusApplMod.*">
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
			<th class="required">会员编号</th>
		    <td>
		        <input type="text" id="userCode" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;<b id="userName"></b>
		    </td>
		</tr>
		<tr>
			<th class="required">收益类型</th>
		    <td>
		    	<wbs:list name="bonusType" id="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true"/>
		    </td>
		</tr>
		<tr>
			<th class="required">发放计划编号</th>
		    <td>
		        <input type="text" id="operNo" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
		        <input type="button" class="button" style="cursor: pointer; width: 100px; height: 21px;" onclick="showAppl();" value="查询申请"/>
		    </td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">申请状态</font></th>
		    <td>
		    	<wbs:list name="status" id="status" listCode="fibonusappl.statusmod" value="${param.status }" defaultValue="" showBlankLine="true"/>
		    </td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">失败原因</font></th>
		    <td>
		        <input type="text" name="falseReason" id="falseReason" value=""/>
		    </td>
		</tr>
		<tr>
			<th><font style="font-weight: normal;">备注</font></th>
		    <td>
		        <textarea cols="50" rows="4" name="remark" id="remark"></textarea>
		    </td>
		</tr>
		    
		<tr>
			<th><font style="font-weight: normal;">操作</font></th>
			<td>
				<wbs:power powerCode="${param.strAction}">
					<input type="button" class="button" onclick="saveApplMod()" value="<fmt:message key="button.save"/>" />
				</wbs:power>
				<input type="button" class="button" onclick="window.location='fiBonusApplMods.html?strAction=listFiBonusApplMods&needReload=1'" value="<fmt:message key="operation.button.return"/>" />
			</td>
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
    				<c:if test="${not empty fiBonusApplMod.id }">
    					<win:power powerCode="deleteFiBonusApplMod">
    						<button type="submit" name="delete" onclick="bCancel=true;return confirmDelete(this.form,'FiBonusApplMod')"><fmt:message key="operation.button.delete"/></button>
    					</win:power>
    				</c:if>
    				<button type="button" name="cancel" onclick="window.location='fiBonusApplMods.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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
</script>