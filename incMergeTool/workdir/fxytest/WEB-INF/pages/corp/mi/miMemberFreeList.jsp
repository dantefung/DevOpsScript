<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="回填单管理"/></title>
    <meta name="heading" content="<fmt:message key="回填单管理"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miMemberFrees.jhtml" onsubmit="return validateSearch(this)">
		<%-- <c:if test="${not empty alCompanys}">
			<dl>
				<dd>
					<fmt:message key="label.company" />
				</dd>
				<dd>
					<select name="companyCode" id="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }" <c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyCode} - ${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if> --%>
		<dl>
			<dt>会员编号</dt>
			<dd>
				<input type="text" name="memberNo" value="${param.memberNo }" />
			</dd>
		</dl>
		<dl>
			<dt>
				<win:list name="dateType" listCode="member_free_date" defaultValue="" value="${param.dateType }" showBlankLine="true"/>
			</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="12" />
				 - 
				 <input type="text"	name="endDate" id="endDate"	value="${param.endDate }" size="12" />
			</dd>
		</dl>
		<dl>
			<dt>状态</dt>
			<dd>
				<win:list name="status" listCode="member_free_status" defaultValue="" value="${param.status }" showBlankLine="true" />
			</dd>
		</dl>
		<%-- <dl>
			<dt>原荣誉级别</dt>
			<dd>
				<win:list name="oldStar" listCode="stars_level" defaultValue="" value="${param.oldStar }" showBlankLine="true" />
			</dd>
		</dl>
		<dl>
			<dt>新荣誉级别</dt>
			<dd>
				<win:list name="star" listCode="stars_level" defaultValue="" value="${param.star }" showBlankLine="true" />
			</dd>
		</dl> --%>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiMemberFrees"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miMemberFreeFunctionForm" id="miMemberFreeFunctionForm" action="editMiMemberFree.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiMemberFree">
				<a href="editMiMemberFree.jhtml?strAction=addMiMemberFree" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkMiMemberFree">
				<a href="javascript:checkMiMemberFree()" name="check">
					审核
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miMemberFreeListTableForm" method="get" >
		<ec:table 
			tableId="miMemberFreeListTable"
			items="miMemberFrees"
			var="miMemberFreeVar"
			action="miMemberFrees.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miMemberFreeListTableForm">
			<ec:row>
				<ec:column alias="chkId" headerCell="selectAll" style="width:5px;">
					<c:if test="${miMemberFreeVar.status==0 }">
						<input type="checkbox" name="chkId" value="${miMemberFreeVar.id}" class="checkbox"/>
					</c:if>
		  		</ec:column>
				
				<ec:column property="1" title="sysOperationLog.moduleName" sortable="false">
					<%-- <win:power powerCode="viewMiMemberFree">
						<a href="viewMiMemberFree.jhtml?strAction=viewMiMemberFree&id=${miMemberFreeVar.id}" name="view"><fmt:message key="button.view"/></a>
					</win:power> --%>
					<c:if test="${miMemberFreeVar.status==0 }">
						<win:power powerCode="editMiMemberFree">
							<a href="editMiMemberFree.jhtml?strAction=editMiMemberFree&id=${miMemberFreeVar.id}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
				</ec:column>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="user_name" title="会员姓名" />
				<%-- <ec:column property="oldStar" title="原荣誉级别">
					<win:code listCode="stars_level" value="${miMemberFreeVar.old_star }"/>
				</ec:column>
				<ec:column property="star" title="新荣誉级别">
					<win:code listCode="stars_level" value="${miMemberFreeVar.star }"/>
				</ec:column> --%>
				<ec:column property="total_amount" title="回填金额" cell="currency" format="###,##0.00" styleClass="numberColumn"/>
				<ec:column property="total_pv" title="回填PV" cell="currency" format="###,##0.00" styleClass="numberColumn" />
				<ec:column property="creator_code" title="创建时间">
					${miMemberFreeVar.creator_code } - ${miMemberFreeVar.create_time }
				</ec:column>
				<ec:column property="checkerCode" title="审核时间">
					${miMemberFreeVar.checker_code } - ${miMemberFreeVar.check_time }
				</ec:column>
				<ec:column property="status" title="状态">
					<win:code listCode="member_free_status" value="${miMemberFreeVar.status }"/>
				</ec:column>
				<ec:column property="orderNo" title="相关订单号"/>
				<ec:column property="remark" title="备注"/>
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

function checkMiMemberFree(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("请选择需要审核的条目.");
		return;
	}
	if(!confirm("确认审核所选择的条目 ?")){
		return;
	}
	var theForm=document.miMemberFreeFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkMiMemberFree";
	
	showLoading();
	theForm.submit();
}
</script>