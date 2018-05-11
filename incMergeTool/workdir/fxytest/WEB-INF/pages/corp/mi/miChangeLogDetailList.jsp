<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="miMember.edit.log"/></title>
    <meta name="heading" content="<fmt:message key="miMember.edit.log"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miChangeLogDetails.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${not empty alCompanys}">
			<dl>
				<dt><fmt:message key="label.company"/></dt>
				<dd>
					<select name="companyCode" id="companyCode">
			        	<option value=""></option>
			        	<c:forEach items="${alCompanys}" var="alCompanyVar">
		        			<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode } - ${alCompanyVar.companyName }</option>
			    		</c:forEach>
			        </select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt><fmt:message key="busi.edit.no"/></dt>
			<dd><input type="text" name="changeCode" value="${param.changeCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="userCode" value="${param.userCode }"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.edit.content"/></dt>
			<dd><win:list name="changeColumn" listCode="mi_change_log_name" defaultValue="" value="${param.changeColumn }" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="busi.order.editTime"/></dt>
			<dd><input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/> - <input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="button.search"/></button>
				<input type="hidden" name="strAction" value="listMiChangeLogDetails"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miChangeLogDetailFunctionForm" id="miChangeLogDetailFunctionForm" action="editMiChangeLogDetail.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiChangeLogDetail">
				<a href="editMiChangeLogDetail.jhtml?strAction=addMiChangeLogDetail" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiChangeLogDetail">
				<a href="javascript:multiDeleteMiChangeLogDetail()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedDetailIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miChangeLogDetailListTableForm" method="get" >
		<ec:table 
			tableId="miChangeLogDetailListTable"
			items="miChangeLogDetails"
			var="miChangeLogDetailVar"
			action="miChangeLogDetails.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miChangeLogDetailListTableForm">
			<ec:row>
				<ec:column property="change_code" title="busi.edit.changeNo" />
				<ec:column property="user_code" title="miMember.memberNo" />
				<ec:column property="last_name" title="poOrder.memberName" />
				<ec:column property="tableName" title="busi.edit.changeContent">
					<win:code listCode="mi_change_log_name" value="${miChangeLogDetailVar.change_column }"/>
				</ec:column>
				<ec:column property="old_Value" title="busi.edit.beforeChange">
					<c:choose>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.ID_TYPE' }">
							<win:code listCode="member.cardtype" value="${miChangeLogDetailVar.old_value}"/>
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.IS_AGENT' }">
							<win:code listCode="yesno" value="${miChangeLogDetailVar.old_value}"/>
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.AREA_CODE' }">
							${miChangeLogDetailVar.old_area_name }
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='SYS_USER_ROLE.ROLE_ID' }">
							${miChangeLogDetailVar.old_role_name }
						</c:when>
						<c:otherwise>${miChangeLogDetailVar.old_value}</c:otherwise>
					</c:choose>
				</ec:column>
				<ec:column property="new_Value" title="busi.edit.afterChange">
					<c:choose>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.ID_TYPE' }">
							<win:code listCode="member.cardtype" value="${miChangeLogDetailVar.new_value}"/>
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.IS_AGENT' }">
							<win:code listCode="yesno" value="${miChangeLogDetailVar.new_value}"/>
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='MI_MEMBER.AREA_CODE' }">
							${miChangeLogDetailVar.new_area_name }
						</c:when>
						<c:when test="${miChangeLogDetailVar.change_column=='SYS_USER_ROLE.ROLE_ID' }">
							${miChangeLogDetailVar.new_role_name }
						</c:when>
						<c:otherwise>${miChangeLogDetailVar.new_value}</c:otherwise>
					</c:choose>
				</ec:column>
				<ec:column property="changer_code" title="mi.time.update">
					${miChangeLogDetailVar.changer_code } - ${miChangeLogDetailVar.change_time }
				</ec:column>
				<ec:column property="remark" title="busi.common.remark" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startDate,#endDate" ).datepicker({
		dateFormat: "yy-mm-dd"
	});
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

</script>