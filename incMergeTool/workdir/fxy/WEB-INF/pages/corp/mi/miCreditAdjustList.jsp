<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="贷款状态管理"/></title>
    <meta name="heading" content="<fmt:message key="贷款状态管理"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="miCreditAdjusts.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt><fmt:message key="miMember.memberNo"/></dt>
			<dd><input type="text" name="memberNo" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt>变更时间</dt>
			<dd>
				<input type="text" name="startDate" id="startDate" value="${param.startDate }" size="10"/>
				 - 
				<input type="text" name="endDate" id="endDate" value="${param.endDate }" size="10"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listMiCreditAdjusts"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="miCreditAdjustFunctionForm" id="miCreditAdjustFunctionForm" action="editMiCreditAdjust.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addMiCreditAdjust">
				<a href="editMiCreditAdjust.jhtml?strAction=addMiCreditAdjust" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteMiCreditAdjust">
				<a href="javascript:multiDeleteMiCreditAdjust()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="miCreditAdjustListTableForm" method="get" >
		<ec:table 
			tableId="miCreditAdjustListTable"
			items="miCreditAdjusts"
			var="miCreditAdjustVar"
			action="miCreditAdjusts.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="miCreditAdjustListTableForm">
			<ec:row>
				<ec:column property="member_no" title="会员编号" />
				<ec:column property="last_name" title="会员姓名" />
				<ec:column property="star" title="荣誉级别">
					<win:code listCode="stars_level" value="${miCreditAdjustVar.star }"/>
				</ec:column>
				<ec:column property="join_time" title="加入时间"/>
				<ec:column property="old_status" title="是否贷款(旧)" styleClass="centerColumn">
					<win:code listCode="yesno" value="${miCreditAdjustVar.old_status }"/>
				</ec:column>
				<ec:column property="new_status" title="是否贷款(新)" styleClass="centerColumn">
					<win:code listCode="yesno" value="${miCreditAdjustVar.new_status }"/>
				</ec:column>
				<ec:column property="credit_amount" title="贷款金额" cell="currency" format="###,##0.00" styleClass="numberColumn"/>
				<ec:column property="creator_code" title="变更时间">
					${miCreditAdjustVar.creator_code } - ${miCreditAdjustVar.create_time }
				</ec:column>
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

function multiDeleteMiCreditAdjust(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.miCreditAdjustFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteMiCreditAdjust";
	
	showLoading();
	theForm.submit();
}
</script>