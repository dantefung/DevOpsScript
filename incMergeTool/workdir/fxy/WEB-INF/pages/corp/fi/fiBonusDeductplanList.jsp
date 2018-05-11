<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>收益扣补计划</title>
    <meta name="heading" content="收益扣补计划"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusDeductplans.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>会员编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}"/></dd>
		</dl>
		<dl>
			<dt>会员名称</dt>
			<dd><input name="userName" type="text" value="${param.userName}"/></dd>
		</dl>
		<dl>
			<dt>建立时间</dt>
			<dd>
				<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime }" size="12" class="readonly" readonly/>
				 - 
				<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime }" size="12" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<input type="hidden" name="strAction" value="listFiBonusDeductplans"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusDeductplanListForm" id="fiBonusDeductplanListForm" action="editFiBonusDeductplan.jhtml" method="post">
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusDeductplan">
				<a href="editFiBonusDeductplan.jhtml?strAction=addFiBonusDeductplan" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="checkFiBonusDeductplan">
				<a href="javascript:checkFiBonusDeductplan()" name="check">
					审核
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusDeductplanListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusDeductplanListTable"
			items="fiBonusDeductplans"
			var="fiBonusDeductplanVar"
			action="fiBonusDeductplans.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusDeductplanListTableForm">
			<ec:row>
				<ec:column alias="selectedId" headerCell="selectAll" style="width:5px;">  
					<c:if test="${fiBonusDeductplanVar.status ==0}">
				    	<win:power powerCode="checkFiBonusDeductplan">
							<input type="checkbox" name="selectedId" id="selectedId" value="${fiBonusDeductplanVar.id}" class="checkbox"/>	
				    	</win:power>
				    </c:if>
				</ec:column>
				
				<ec:column property="edit" title="title.operation" sortable="false" styleClass="centerColumn" viewsAllowed="html">
					<win:power powerCode="viewFiBonusDeductplan">
						<a href="fiBonusDeductplans.jhtml?strAction=viewFiBonusDeductplan&id=${fiBonusDeductplanVar.id}" name="view"><fmt:message key="function.menu.view"/></a>
					</win:power>
					<c:if test="${fiBonusDeductplanVar.status ==0}">
						<win:power powerCode="editFiBonusDeductplan">
							<a href="editFiBonusDeductplan.jhtml?strAction=editFiBonusDeductplan&id=${fiBonusDeductplanVar.id}" name="edit"><fmt:message key="button.edit"/></a>
						</win:power>
					</c:if>
			    </ec:column>
				
    			<ec:column property="user_code" title="会员编号 " />
    			<ec:column property="user_name" title="会员姓名 " />
    			<ec:column property="company_code" title="国别" />
    			<ec:column property="amount" title="需扣款总额" />
    			<ec:column property="start_time" title="开始时间" >
    				${fiBonusDeductplanVar.start_time}
    			</ec:column>
    			<ec:column property="end_time" title="结束时间" >
    				${fiBonusDeductplanVar.end_time}
    			</ec:column>
    			<ec:column property="bonus_type" title="收益类型" >
    				<win:code listCode="bonus.type" value="${fiBonusDeductplanVar.bonus_type}"/>
    			</ec:column>
    			<ec:column property="deduct_percent" title="扣款比例" >
    				${fiBonusDeductplanVar.deduct_percent}%
    			</ec:column>
    			<ec:column property="status" title="状态" >
    				<win:code listCode="fibonusdeductplan.status" value="${fiBonusDeductplanVar.status}"/>
    			</ec:column>
    			<ec:column property="deduct_amt" title="已扣款金额" />
    			<ec:column property="creater_code" title="建立者帐号" />
    			<ec:column property="creater_name" title="建立者名称 " />
    			<ec:column property="create_time" title="建立时间" >
    				${fiBonusDeductplanVar.create_time}
    			</ec:column>
    			<ec:column property="checker_code" title="审核者帐号 " />
    			<ec:column property="checker_name" title="审核者名称" />
    			<ec:column property="check_time" title="审核时间" >
    				${fiBonusDeductplanVar.check_time}
    			</ec:column>
    			
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime" ).datepicker();
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function checkFiBonusDeductplan(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("selectedId"));
	if(!selectedValues){
		alert("请选择需要审核的扣补单");
		return;
	}
	if(!confirm("确认审核选择的扣补单？")){
		return;
	}
	var theForm=document.fiBonusDeductplanListForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="checkFiBonusDeductplan";
	
	showLoading();
	theForm.submit();
}
</script>