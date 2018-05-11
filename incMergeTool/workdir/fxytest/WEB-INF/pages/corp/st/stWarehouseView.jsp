<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="查看仓库资料"/></title>
    <meta name="heading" content="<fmt:message key="查看仓库资料"/>"/>
</head>

<div class="contentBody">
    <form:form commandName="stWarehouse" method="post" id="stWarehouseForm">
    
    <table class="detail">
    	<tr>
    		<td colspan="2" class="title">基本信息<!--视情况可以删除--></td>
    	</tr>
    	<tr>
    		<th><fmt:message key="所属公司"/>:</th>
    		<td>${stWarehouse.companyCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="仓库编号"/>:</th>
    		<td>${stWarehouse.warehouseCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="仓库名称"/>:</th>
    		<td>${stWarehouse.warehouseName }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="所在地址"/>:</th>
    		<td>${stWarehouse.address }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="邮编"/>:</th>
    		<td>${stWarehouse.zipcode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="联系电话"/>:</th>
    		<td>${stWarehouse.phone }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建人"/>:</th>
    		<td>${stWarehouse.creatorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="创建时间"/>:</th>
    		<td>${stWarehouse.createTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="最后修改人"/>:</th>
    		<td>${stWarehouse.editorCode }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="最后修改时间"/>:</th>
    		<td>${stWarehouse.editTime }</td>
    	</tr>
    	<tr>
    		<th><fmt:message key="是否使用"/>:</th>
    		<td><win:code listCode="yesno" value="${stWarehouse.isActive }"/></td>
    	</tr>
    	<tr>
    		<td colspan="2" class="title">用户权限</td>
    	</tr>
    	<tr>
			<td colspan="2">
				<table>
					<c:forEach items="${stWarehouseUsers }" var="stWarehouseUserVar" varStatus="varStatus">
						<c:if test="${varStatus.index%6==0}"><tr></c:if>
							<td>
								${stWarehouseUserVar.user_code }（${stWarehouseUserVar.user_name }）
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
    				<form:hidden path="waId"/>
    				<input type="hidden" name="strAction" value="${param.strAction }"/>
    				<button type="button" name="return" onclick="window.location='stWarehouses.jhtml?needReload=1'"><fmt:message key="operation.button.return"/></button>
                </div>
    		</td>
    	</tr>
    </table>
    
    </form:form>
</div>
<script type="text/javascript">
//
</script>