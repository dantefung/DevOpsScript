<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title>审核收益条目</title>
    <meta name="heading" content="审核收益条目"/>
</head>

<script language="javascript" src="scripts/validate.js"></script>

<div class="searchBar">
	<form action="fiBonusChangesChk.jhtml" method="get" name="fiBonusChangeSearchForm" id="fiBonusChangeSearchForm">
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
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="10"/></dd>
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
				<input type="hidden" name="strAction" value="listFiBonusChangesChk"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form action="fiBonusChangesChk.jhtml" method="post" name="fiBonusChangeTitleForm" id="fiBonusChangeTitleForm">
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="verifyFiBonusChange">
				<a href="javascript:verify(document.fiBonusChangeTitleForm);" name="check">
                    <fmt:message  key='button.verify'/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
		
	    <input type="hidden" name="strAction" value=""/>
	    <input type="hidden" name="strItemIds" value=""/>
	</form>
	
	<c:set var="footTotalVar">
		<tr>
			<td align="right" class="footer" colspan="10"><fmt:message key="report.allTotal"/>(<b><fmt:formatNumber pattern="###,##0.00">${totalBalance.incTotal-totalBalance.expTotal}</fmt:formatNumber></b>)</td>
			<td align="right" class="footer"><b>
				<c:if test="${not empty totalBalance.incTotal}">
					<fmt:formatNumber pattern="###,##0.00">${totalBalance.incTotal}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty totalBalance.incTotal}">
					0.00
				</c:if></b>
			</td>
			<td align="right" class="footer"><b>
				<c:if test="${not empty totalBalance.expTotal}">
					<fmt:formatNumber pattern="###,##0.00">${totalBalance.expTotal}</fmt:formatNumber>
				</c:if>
				<c:if test="${empty totalBalance.expTotal}">
					0.00
				</c:if></b>
			</td>
			<td class="footer" colspan="3">&nbsp;</td>
		</tr>
	</c:set>
	
	<%
	request.setAttribute("vEnter", "\n");
	%>
	
	<ec:table 
		tableId="fiBonusChangeListTable"
		items="fiBonusChanges"
		var="fiBonusChange"
		autoIncludeParameters="true"
		action="fiBonusChangesChk.jhtml"
		width="100%" method="get"
		retrieveRowsCallback="limit"
		rowsDisplayed="20" sortable="false" footer="${footTotalVar}">
		<ec:exportXls fileName="fiBonusChanges.xls"/>
		<ec:row>
			<ec:column alias="selectedId" headerCell="selectAll" style="width:5px;" viewsAllowed="html">
				<c:if test="${fiBonusChange.status!=1}">
					<input type="checkbox" name="selectedId" value="${fiBonusChange.item_id}" class="checkbox"/>
				</c:if>
				<c:if test="${fiBonusChange.status==1}">
					&nbsp;
				</c:if>
	  		</ec:column>
	  		<ec:column property="Bonus_type" title="收益类型" styleClass="centerColumn" width="100">
				<win:code listCode="bonus.type" value="${fiBonusChange.bonus_type }"/>
			</ec:column>
			<ec:column property="member_no" title="fiPayAdvice.userCode" />
			<ec:column property="Bal_type" title="pdAdjustStock.astNo">
				<win:code listCode="bonus_bal_type" value="${fiBonusChange.bal_type}"/>
			</ec:column>
			<ec:column property="Order_type" title="fiBankbookJournal.dealType">
				<win:code listCode="fibonusacitem.ordertype" value="${fiBonusChange.order_type}"/>
			</ec:column>
			<ec:column property="deal_date" title="comm.busi.deal.transaction.date" styleClass="centerColumn">
				${fiBonusChange.deal_date}
			</ec:column>
			<ec:column property="create_time" title="pd.createTime" styleClass="centerColumn">
				${fiBonusChange.create_time }
			</ec:column>
			<ec:column property="notes" title="poSell.notes" sortable="false">
				${fn:replace(fiBonusChange.notes, vEnter, '<br>')}
			</ec:column>
			<ec:column property="remark" title="busi.common.remark" sortable="false">
				${fn:replace(fiBonusChange.remark, vEnter, '<br>')}
			</ec:column>
			
			<ec:column property="money1" title="fibankbooktemp.dealtype.A" styleClass="numberColumn" width="60">
				<c:if test="${fiBonusChange.change_type=='A'}"><fmt:formatNumber value="${fiBonusChange.money}" type="number" pattern="###,###,##0.00"/></c:if>
				<c:if test="${fiBonusChange.change_type=='D'}">0.00</c:if>
			</ec:column>
			<ec:column property="money2" title="fibankbooktemp.dealtype.D" styleClass="numberColumn" width="60">
				<c:if test="${fiBonusChange.change_type=='A'}">0.00</c:if>
				<c:if test="${fiBonusChange.change_type=='D'}"><fmt:formatNumber value="${fiBonusChange.money}" type="number" pattern="###,###,##0.00"/></c:if>
			</ec:column>
			<ec:column property="Status" title="fi.status" styleClass="centerColumn">
				<win:code listCode="bonus_item_status" value="${fiBonusChange.status}"/>
			</ec:column>
			<ec:column property="check_time" title="pd.confirmUserNo">
				${fiBonusChange.checker_name }<br>${fiBonusChange.check_time }
			</ec:column>
			<ec:column property="create_no" title="fiPayData.createNo" >
				${fiBonusChange.create_no }
			</ec:column>
		</ec:row>
	</ec:table>	
	
</div>

<script type="text/javascript">
$(function() {
	$( "#startTime, #endTime" ).datepicker();
	$("button[name='export']").button({
        icons: {
            primary: "ui-icon-export"
        }
    });
});

function validateSearch(theForm) {
	showLoading();
	return true;
}

function verify(theForm){
	if(!confirm("<fmt:message key="fiBankbookTemp.confirm.verify"/>")){
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
	theForm.strAction.value="verifyFiBonusChange";
	showLoading();
	theForm.submit();
}
</script>