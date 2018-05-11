<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>新增收益领取申请</title>
    <meta name="heading" content="新增收益领取申请"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusAppls.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>申请类型</dt>
			<dd><win:list listCode="fibonusappl.appltype" name="applType" value="${param.applType}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>申请人编号</dt>
			<dd><input name="createrCode" type="text" value="${param.createrCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>申请时间</dt>
			<dd>
				<input name="startCreateTime" id="startCreateTime" type="text" value="${param.startCreateTime}" size="12"/>
				 - 
				<input name="endCreateTime" id="endCreateTime" type="text" value="${param.endCreateTime}" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt>申请状态</dt>
			<dd><win:list listCode="fibonusappl.status" 	name="status" value="${param.status}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt>审核人编号</dt>
			<dd><input name="checkerCode" type="text" value="${param.checkerCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>审核时间</dt>
			<dd>
				<input name="startCheckTime" id="startCheckTime" type="text" value="${param.startCheckTime }" size="12"/>
				 - 
				<input name="endCheckTime" id="endCheckTime" type="text" value="${param.endCheckTime }" size="12"/>
			</dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusAppls"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusApplFunctionForm" id="fiBonusApplFunctionForm" action="editFiBonusAppl.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusAppl">
				<a href="editFiBonusAppl.jhtml?strAction=addFiBonusAppl" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiBonusAppl">
				<a href="javascript:multiDeleteFiBonusAppl()" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
			</win:power>
		</div>
		<input type="hidden" name="selectedApplNos">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="fiBonusApplListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusApplListTable"
			items="fiBonusAppls"
			var="fiBonusApplVar"
			action="fiBonusAppls.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm">
			<ec:row>
				<ec:column property="1" title="title.operation" sortable="false" styleClass="centerColumn" width="30" >
					<win:power powerCode="editFiBonusAppl">
						<c:if test="${fiBonusApplVar.status==0}">
							<a href="editFiBonusAppl.html?strAction=editFiBonusAppl&applNo=${fiBonusApplVar.applNo}" name="edit">编辑</a>
						</c:if>
					</win:power>
				</ec:column>
			
    			<ec:column property="userCode" title="会员编号" />
    			<ec:column property="applType" title="申请类型" >
    				<win:code listCode="fibonusappl.appltype" value="${fiBonusApplVar.applType}"/>
    			</ec:column>
    			<ec:column property="amount" title="金额" />
    			<ec:column property="createrCode" title="创建人编号" />
    			<ec:column property="createrName" title="创建人" />
    			<ec:column property="createTime" title="创建时间" />
    			<ec:column property="status" title="状态" >
    				<win:code listCode="fibonusappl.status" value="${fiBonusApplVar.status}"/>
    			</ec:column>
    			<ec:column property="checkerCode" title="审核人编号" />
    			<ec:column property="checkerName" title="审核人" />
    			<ec:column property="checkTime" title="审核时间" />
    			<ec:column property="operNo" title="发放计划编号" />
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
function validateSearch(theForm) {
	showLoading();
	return true;
}

function multiDeleteFiBonusAppl(){
	var selectedValues=getCheckedBoxesValue(document.getElementsByName("chkApplNo"));
	if(!selectedValues){
		alert("<fmt:message key='info.select.need.delete.items'/>.");
		return;
	}
	if(!confirm("<fmt:message key='bdOutWardBank.confirm.delete'/>.")){
		return;
	}
	var theForm=document.fiBonusApplFunctionForm;
	theForm.selectedApplNos.value=selectedValues;
	theForm.strAction.value="multiDeleteFiBonusAppl";
	
	showLoading();
	theForm.submit();
}
</script>