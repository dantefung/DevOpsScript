<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>管理用户权限</title>
    <meta name="heading" content="管理用户权限"/>
</head>

<div class="contentBody">
    <form:form commandName="stWarehouseUser" method="post" action="editStWarehouseUser.jhtml" onsubmit="return validateForm(this)" id="stWarehouseUserForm">
    
    <spring:bind path="stWarehouseUser.*">
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
    		<th class="required"><fmt:message key="仓库编码"/>:</th>
    		<td>${stWarehouse.warehouseCode }</td>
    	</tr>
    	<tr>
    		<th class="required"><fmt:message key="仓库名称"/>:</th>
    		<td>${stWarehouse.warehouseName }</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">设置用户权限</td>
    	</tr>
    	<tr>
			<th><fmt:message key="notice.select.user"/>:</th>
			<td>
				<table>
					<c:forEach items="${stWarehouseUsers }" var="stWarehouseUserVar" varStatus="varStatus">
						<c:if test="${varStatus.index%6==0}"><tr></c:if>
							<td>
								<input type="checkbox" name="slaveUserCode" id="slaveUserCode_${stWarehouseUserVar.user_code }" value="${stWarehouseUserVar.user_code }"<c:if test="${not empty stWarehouseUserVar.id }"> checked</c:if>>
								<label for="slaveUserCode_${stWarehouseUserVar.user_code }">${stWarehouseUserVar.user_code }（${stWarehouseUserVar.user_name }）</label>
							</td>
						<c:if test="${(varStatus.index+1)%6==0}"></tr></c:if>
						<c:if test="${varStatus.last && (varStatus.index+1)%6!=0}">
							<c:forEach begin="0" end="${(5-((varStatus.index+1)%6))}">
								<td>&nbsp;</td>
							</c:forEach>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</td>
		</tr>
    	<tr>
    		<td colspan="2">
    			<div class="buttonBar">
    				<form:hidden path="id"/>
    				<input type="hidden" name="waId" value="${stWarehouse.waId }"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<input type="hidden" value="${form.token}" name="_form_uniq_id" />
    				<win:power powerCode="${param.strAction }">
    					<button type="submit" name="save" onclick="bCancel=false"><fmt:message key="button.save"/></button>
    				</win:power>
    				<button type="button" name="cancel" onclick="window.location='stWarehouses.jhtml?needReload=1'"><fmt:message key="operation.button.cancel"/></button>
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