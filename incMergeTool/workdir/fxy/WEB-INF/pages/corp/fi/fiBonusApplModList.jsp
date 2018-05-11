<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>修改收益申请</title>
    <meta name="heading" content="修改收益申请"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusApplMods.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>修改人编号</dt>
			<dd><input name="createrCode" type="text" value="${param.createrCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusApplMods"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusApplModFunctionForm" id="fiBonusApplModFunctionForm" action="editFiBonusApplMod.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusApplMod">
				<a href="editFiBonusApplMod.jhtml?strAction=addFiBonusApplMod" name="add">
					修改申请
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedIds">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusApplModListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusApplModListTable"
			items="fiBonusApplMods"
			var="fiBonusApplModVar"
			action="fiBonusApplMods.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusApplModListTableForm">
			<ec:row>
			
				<ec:column property="1" title="title.operation" sortable="false" styleClass="centerColumn" width="30" >
					<win:power powerCode="viewFiBonusApplMod">
						<a href="viewFiBonusApplMod.html?strAction=viewFiBonusApplMod&id=${fiBonusApplModVar.id}" name="view">
							<fmt:message key="function.menu.view"/>
						</a>
					</win:power>
				</ec:column>
			
    			<ec:column property="bonus_type" title="收益类型" >
    				<win:code listCode="bonus.type" value="${fiBonusApplModVar.bonus_type }"/>
    			</ec:column>
    			<ec:column property="user_code" title="用户编号" />
    			<ec:column property="b_name" title="银行户名" />
    			<ec:column property="amount" title="申请金额" />
    			<ec:column property="oper_no" title="发放计划编号" />
    			<ec:column property="old_status" title="申请原状态" >
    				<win:code listCode="fibonusappl.statusmod" value="${fiBonusApplModVar.old_status}"/>
    			</ec:column>
    			<ec:column property="new_status" title="申请新状态" >
    				<win:code listCode="fibonusappl.statusmod" value="${fiBonusApplModVar.new_status}"/>
    			</ec:column>
    			<ec:column property="old_false_reason" title="原失败原因" />
    			<ec:column property="new_false_reason" title="新失败原因" />
    			<ec:column property="creater_code" title="修改人编号" />
    			<ec:column property="creater_name" title="修改人姓名" />
    			<ec:column property="create_time" title="修改时间" />
    			<ec:column property="remark" title="修改备注" >
    				${fn:replace(fiBonusApplModVar.remark, vEnter, '<br>')}
    			</ec:column>
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusApplMod(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkId"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusApplModFunctionForm;
	theForm.selectedIds.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusApplMod";
	
	showLoading();
	theForm.submit();
}
</script>