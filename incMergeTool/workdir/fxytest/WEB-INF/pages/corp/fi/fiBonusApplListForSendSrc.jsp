<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<title><fmt:message key="fiBonusApplList.title"/></title>
<content tag="heading"><fmt:message key="fiBonusApplList.heading"/></content>
<meta name="menu" content="FiBonusApplMenu"/>

<link rel="stylesheet" href="./styles/calendar/calendar-blue.css" /> 
<script type="text/javascript" src="./scripts/calendar/calendar.js"> </script> 
<script type="text/javascript" src="./scripts/calendar/calendar-setup.js"> </script> 
<script type="text/javascript" src="./scripts/calendar/lang.jsp"> </script> 

<form action="fiBonusApplsForSend.jhtml" method="get" name="fiBonusApplChkSearchForm" id="fiBonusApplChkSearchForm">
	<div class="searchBar">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="12"/></dd>
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
			<dt>审核人编号</dt>
			<dd><input name="checkerCode" type="text" value="${param.checkerCode}" size="12"/></dd>
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
				<button name="search" type="submit"><fmt:message key="operation.button.search"/></button>
				<button name="cancel" type="button" onclick="window.location='fiBonusApplsForSend.jhtml?strAction=listFiBonusApplsForSend&operNo=${operNo}'"><fmt:message key="返回"/></button>
				<input type="hidden" name="strAction" value="addFiBonusApplsForSendSrc"/>
				<input type="hidden" name="operNo" value="${operNo}"/>
			</dd>
		</dl>
	</div>
</form>

<div class="contentBody">
	<div class="functionBar">
		<form action="fiBonusApplsForSend.jhtml" method="post" name="fiBonusApplsForSendSrcSaveTitleForm" id="fiBonusApplsForSendSrcSaveTitleForm">
		    <input type="hidden" id="strAction" 	name="strAction" 	value=""/>
		    <input type="hidden" 					name="operNo" 		value="${operNo}"/>
		    <input type="hidden" id="strApplNos" 	name="strApplNos" 	value=""/>
		    <table class='grid_table'>
				<tr class='grid_span'>
					<td>
						<win:power powerCode="addFiBonusApplsForSend">
							<a href="#" onclick="addFiBonusApplsForSendSrc(document.fiBonusApplsForSendSrcSaveTitleForm);" name="add">
								新增
							</a>
						</win:power>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<ec:table 
		tableId="fiBonusApplListTable"
		items="fiBonusAppls"
		var="fiBonusAppl"
		action="fiBonusApplsForSend.jhtml"
		width="100%"
		retrieveRowsCallback="limit"
		autoIncludeParameters="true"
		rowsDisplayed="20" sortable="false" imagePath="/wbs/images/extremetable/*.gif">
				<ec:row>
				
					<ec:column alias="selectedNo" headerCell="selectAll" style="width:5px;">
						<c:if test="${fiBonusAppl.status==1}">
							<input type="checkbox" name="selectedNo" value="${fiBonusAppl.appl_no}"/>
						</c:if>
			  		</ec:column>
				
	    			<ec:column property="user_code" title="用户编号" />
	    			<ec:column property="appl_type" title="申请类型" >
	    				<win:code listCode="fibonusappl.appltype" value="${fiBonusAppl.appl_type}"/>
	    			</ec:column>
	    			<ec:column property="amount" title="申请金额" />
	    			<ec:column property="b_name" title="银行户名" />
	    			<ec:column property="open_bank" title="开户银行" />
	    			<ec:column property="b_branch" 	title="开户行支行" />
	    			<ec:column property="b_num" title="银行账号" />
	    			<ec:column property="create_time" 	title="申请时间" />
	    			<ec:column property="status" title="申请状态" >
	    				<win:code listCode="fibonusappl.status" value="${fiBonusAppl.status}"/>
	    			</ec:column>
	    			<ec:column property="checker_code" title="审核人编号" />
	    			<ec:column property="checker_name" title="审核人名称" />
	    			<ec:column property="check_time" title="审核时间" />
				</ec:row>
	
	</ec:table>	
</div>


<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime, #startCheckTime, #endCheckTime" ).datepicker();
});
function addFiBonusApplsForSendSrc(theForm){
	if(!confirm("确定添加选中的收益领取申请？")){
		return false;
	}
	var elements=document.getElementsByName("selectedNo");
	if(elements==undefined){
		alert("请选择要添加的收益领取申请");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strApplNos.value+=","+elements[i].value;
		}
	}
	if(!selectedOne){
		alert("请选择要添加的收益领取申请");
		return false;
	}
	theForm.strAction.value="addFiBonusApplsForSendSave";
	showLoading();
	theForm.submit();
	window.close();
}		

</script>
