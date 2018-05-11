<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title>新增收益条目</title>
    <meta name="heading" content="新增收益条目"/>
</head>

<div class="searchBar">
	<form method="get" action="fiBonusChanges.jhtml" onsubmit="return validateSearch(this)">
		<c:if test="${sessionScope.sessionLogin.companyCode=='AA'}">
			<dl>
				<dt><fmt:message key="bdReconsumMoneyReport.company"/></dt>
				<dd>
					<select name="companyCode">
						<option value=""></option>
						<c:forEach items="${alCompanys}" var="alCompanyVar">
							<option value="${alCompanyVar.companyCode }"<c:if test="${alCompanyVar.companyCode==param.companyCode}"> selected</c:if>>${alCompanyVar.companyName }</option>
						</c:forEach>
					</select>
				</dd>
			</dl>
		</c:if>
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true" /></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fiPayAdvice.userCode"/></dt>
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fiBankbookJournal.dealType"/></dt>
			<dd><win:list name="orderType" listCode="fibonusacitem.ordertype" value="${param.orderType }" defaultValue="" showBlankLine="true" /></dd>
		</dl>
		<dl>
			<dt><fmt:message  key="pdAdjustStock.astNo"/></dt>
			<dd><win:list listCode="bonus_bal_type" name="balType" id="balType" value="${fiBonusChange.balType}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="pd.confirmUserNo"/></dt>
			<dd><input name="checkerName" type="text" value="${param.checkerName }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list listCode="bonus_item_status" name="status" value="${param.status}" defaultValue="" showBlankLine="true"/></dd>
		</dl>
		<dl>
			<dt><win:list name="timeRangeType" listCode="fibankbooktemp.timerangetype" defaultValue="" value="${param.timeRangeType }"/></dt>
			<dd>
				<input name="startTime" id="startTime" type="text" value="${param.startTime }" size="12" class="readonly" readonly/>
				 - 
				 <input name="endTime" id="endTime" type="text" value="${param.endTime }" size="12" class="readonly" readonly/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="pmProductSppm.createUser"/></dt>
			<dd><input name="createrName" type="text" value="${param.createrName }" size="14"/></dd>
		</dl>
		<dl>
			<dt><fmt:message  key="fiPayData.createNo"/></dt>
			<dd><input name="createNo" type="text" value="${param.createNo }" size="14"/></dd>
		</dl>
		
		<dl>
			<dt><fmt:message key="operation.button.search"/></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listFiBonusChanges"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="fiBonusChangeFunctionForm" id="fiBonusChangeFunctionForm" action="editFiBonusChange.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addFiBonusChange">
				<a href="editFiBonusChange.jhtml?strAction=addFiBonusChange" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="importFiBonusChange">
				<a href="importFiBonusChange.jhtml" name="add">
					<fmt:message  key='button.import'/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
			<win:power powerCode="multiDeleteFiBonusChange">
				<a href="javascript:doMultiDeleteFiBonusChange(document.fiBonusChangeFunctionForm);" name="multiDelete">
					<fmt:message key="operation.button.delete"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="strItemIds" value=""/>
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<%
	request.setAttribute("vEnter", "\n");
	%>

	<form id="fiBonusChangeListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusChangeListTable"
			items="fiBonusChanges"
			var="fiBonusChangeVar"
			action="fiBonusChanges.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="false" form="fiBonusChangeListTableForm">
			<ec:row>
				<ec:column alias="selectedId" headerCell="selectAll" style="width:5px;">
					<c:if test="${fiBonusChangeVar.status!=1 && fiBonusChangeVar.creater_code==sessionScope.sessionLoginUser.userCode}">
						<input type="checkbox" name="selectedId" value="${fiBonusChangeVar.item_id}"/>
					</c:if>
		  		</ec:column>
				<ec:column property="1" title="title.operation" sortable="false" styleClass="centerColumn" width="30" >
					<win:power powerCode="editFiBonusChange">
						<c:if test="${fiBonusChangeVar.status!=1 && fiBonusChangeVar.creater_code==sessionScope.sessionLoginUser.userCode}">
							<a href="editFiBonusChange.jhtml?itemId=${fiBonusChangeVar.item_id}&strAction=editFiBonusChange" name="edit">编辑</a>
						</c:if>
					</win:power>
					&nbsp;
				</ec:column>
				<ec:column property="bonus_type" title="收益类型" styleClass="centerColumn" width="100">
					<win:code listCode="bonus.type" value="${fiBonusChangeVar.bonus_type }"/>
				</ec:column>
				<ec:column property="member_no" title="fiPayAdvice.userCode" >
					${fiBonusChangeVar.member_no }
				</ec:column>
				<ec:column property="bal_type" title="pdAdjustStock.astNo">
					<win:code listCode="bonus_bal_type" value="${fiBonusChangeVar.bal_type}"/>
				</ec:column>
				
				<ec:column property="order_type" title="fiBankbookJournal.dealType">
					<win:code listCode="fibonusacitem.ordertype" value="${fiBonusChangeVar.order_type}"/>
				</ec:column>
				
				<ec:column property="deal_date" title="comm.busi.deal.transaction.date" styleClass="centerColumn">
					${fiBonusChangeVar.deal_date}
				</ec:column>
				
				<ec:column property="create_time" title="pd.createTime" styleClass="centerColumn">
					${fiBonusChangeVar.create_time }
				</ec:column>
				<ec:column property="notes" title="poSell.notes" sortable="false">
					${fn:replace(fiBonusChangeVar.notes, vEnter, '<br>')}
				</ec:column>
				
				<ec:column property="remark" title="busi.common.remark" sortable="false">
					${fn:replace(fiBonusChangeVar.remark, vEnter, '<br>')}
				</ec:column>
				
				<ec:column property="money" title="fibankbooktemp.dealtype.A" styleClass="numberColumn" width="60">
					<c:if test="${fiBonusChangeVar.change_type=='A'}"><fmt:formatNumber value="${fiBonusChangeVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
					<c:if test="${fiBonusChangeVar.change_type=='D'}">0.00</c:if>
				</ec:column>
				<ec:column property="money" title="fibankbooktemp.dealtype.D" styleClass="numberColumn" width="60">
					<c:if test="${fiBonusChangeVar.change_type=='A'}">0.00</c:if>
					<c:if test="${fiBonusChangeVar.change_type=='D'}"><fmt:formatNumber value="${fiBonusChangeVar.money}" type="number" pattern="###,###,##0.00"/></c:if>
				</ec:column>
				
				<ec:column property="status" title="fi.status" styleClass="centerColumn">
					<win:code listCode="bonus_item_status" value="${fiBonusChangeVar.status}"/>
				</ec:column>
				
				<ec:column property="checker_name" title="pd.confirmUserNo">
					${fiBonusChangeVar.checker_name }<br>${fiBonusChangeVar.check_time }
				</ec:column>
				
				<ec:column property="create_no" title="fiPayData.createNo" >
					${fiBonusChangeVar.create_no }
				</ec:column>
				
			</ec:row>
		</ec:table>
	</form>
</div>
	
<script type="text/javascript">
$(function() {
	$( "#startTime, #endTime" ).datepicker();
	$("button[name='import']").button({
        icons: {
            primary: "ui-icon-export"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function doMultiDeleteFiBonusChange(theForm){
	if(!confirm("<fmt:message key="bdOutWardBank.confirm.delete"/>")){
		return false;
	}
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
	theForm.strAction.value="multiDeleteFiBonusChange";
	showLoading();
	theForm.submit();
}
</script>