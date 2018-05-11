<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="新增收益发放计划"/></title>
    <meta name="heading" content="<fmt:message key="新增收益发放计划"/>"/>
</head>

<div class="searchBar">
	<form action="newFiBonusSend.jhtml" method="get" name="fiBonusAcBalanceSearchForm" id="fiBonusAcBalanceSearchForm">
		<dl>
			<dt>用户编号</dt>
			<dd><input name="userCode" type="text" value="${param.userCode}" size="14"/></dd>
		</dl>
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue=""/></dd>
		</dl>
		<dl>
			<dt>申请类型</dt>
			<dd><win:list listCode="fibonusappl.appltype" name="applType" value="${param.applType}" defaultValue=""/></dd>
		</dl>
		<dl>
			<dt>申请金额范围</dt>
			<dd>
				<input name="startMoney" type="text" value="${param.startMoney}" size="10"/> - 
				<input name="endMoney" type="text" value="${param.endMoney}" size="10"/>		
			</dd>
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
				<button type="submit" name="search"><fmt:message key="operation.button.search"/></button>
				<win:power powerCode="newFiBonusSend">
					<button type="submit" name="btnNewFiBonusSend" onclick="return confirm('<fmt:message key="info.send.matched.bonus"/>');"><fmt:message key="busi.send.matched.bonus"/></button>
		  		</win:power>
		  		<input type="hidden" name="strAction" value="newFiBonusSend"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusApplFunctionForm" id="fiBonusApplFunctionForm" action="editFiBonusAppl.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<c:set var="footTotalVar">
	<tr>
		<td align="left" class="footer"><b><fmt:message key="report.allTotal"/>:</b></td>
		<td align="right" class="footer"></td>
		<td align="left" class="footer">
			<b><c:if test="${not empty totalAmount.total_amount}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_amount}"/></c:if>
			<c:if test="${empty totalAmount.total_amount}">0.00</c:if></b>
		</td>
		<td align="left" class="footer">
			<b><c:if test="${not empty totalAmount.total_fees}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_fees}"/></c:if>
			<c:if test="${empty totalAmount.total_fees}">0.00</c:if></b>
		</td>
		<td align="left" class="footer">
			<b><c:if test="${not empty totalAmount.total_send_amt}"><fmt:formatNumber pattern="###,##0.00" value="${totalAmount.total_send_amt}"/></c:if>
			<c:if test="${empty totalAmount.total_send_amt}">0.00</c:if></b>
		</td>
		<td align="right" class="footer" colspan="7"></td>
	</tr>
	</c:set>
	
	<form id="fiBonusApplListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusApplListTable"
			items="fiBonusAppls"
			var="fiBonusApplVar"
			action="newFiBonusSend.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusApplListTableForm" footer="${footTotalVar}">
			<ec:row>
				<ec:column property="user_code" title="用户编号" />
		    	<ec:column property="appl_type" title="申请类型" >
		    		<win:code listCode="fibonusappl.appltype" value="${fiBonusApplVar.appl_type}"/>
		    	</ec:column>
		    	<ec:column property="amount" title="申请金额" styleClass="numberColumn">
		    		<fmt:formatNumber pattern="###,##0.00" value="${fiBonusApplVar.amount}"/>
		    	</ec:column>
		    	<ec:column property="fees" title="手续费" styleClass="numberColumn">
		    		<fmt:formatNumber pattern="###,##0.00" value="${fiBonusApplVar.fees}"/>
		    	</ec:column>
		    	<ec:column property="send_amt" title="实发金额" styleClass="numberColumn">
		    		<fmt:formatNumber pattern="###,##0.00" value="${fiBonusApplVar.send_amt}"/>
		    	</ec:column>
		    	<ec:column property="creater_code" title="申请人编号" />
		    	<ec:column property="creater_name" title="申请人名称" />
		    	<ec:column property="create_time" title="申请时间" />
		    	<ec:column property="status" title="申请状态" >
		    		<win:code listCode="fibonusappl.status" value="${fiBonusApplVar.status}"/>
		    	</ec:column>
		    	<ec:column property="checker_code" title="审核人编号" />
		    	<ec:column property="checker_name" title="审核人名称" />
		    	<ec:column property="check_time" title="审核时间" />
			</ec:row>
		</ec:table>
	</form>
</div>

<script type="text/javascript">
$(function() {
	$( "#startCreateTime, #endCreateTime, #startCheckTime, #endCheckTime" ).datepicker();
	$("button[name='btnNewFiBonusSend']").button({
        icons: {
            primary: "ui-icon-check"
        }
    });
});
function setFiBonusAcBalance(theForm){
	var elements=document.getElementsByName("selectedId");
	if(elements==undefined){
		alert("<fmt:message key="please.select.bdBounsDeduct"/>");
		return false;
	}
	var selectedOne=false;
	for(var i=0;i<elements.length;i++){
		if(elements[i].checked){
			selectedOne=true;
			theForm.strItemIds.value+=","+elements[i].value;
		}
	}
	
	if(!selectedOne){
		alert("<fmt:message key="please.select.bdBounsDeduct"/>");
		return false;
	}
	theForm.strAction.value="setFiBonusAcBalance";
	showLoading();
	theForm.submit();
}
</script>