<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="收益帐户管理"/></title>
    <meta name="heading" content="<fmt:message key="收益帐户管理"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="manageFiBonusAc.jhtml" name="fiBonusAcBalanceSearchForm" id="fiBonusAcBalanceSearchForm" onsubmit="return validateSearch(this)">
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
			<dt><fmt:message key="fiPayAdvice.userCode"/></dt>
			<dd><input name="memberNo" type="text" value="${param.memberNo }" size="14"/></dd>
		</dl>
		<dl>
			<dt>收益类型</dt>
			<dd><win:list name="bonusType" listCode="bonus.type" value="${param.bonusType }" defaultValue="" showBlankLine="true" /></dd>
		</dl>
		<dl>
			<dt><fmt:message key="fi.status"/></dt>
			<dd><win:list name="status" listCode="bonus_account_status" value="${param.status }" defaultValue="" showBlankLine="true" /></dd>
		</dl>
		<dl>
			<dt><fmt:message key="bonus.send.percent"/></dt>
			<dd>
				<input name="startSendPercent" type="text" value="${param.startSendPercent }" size="6"/>
				 -
	    		<input name="endSendPercent" type="text" value="${param.endSendPercent }" size="6"/>
			</dd>
		</dl>
		<dl>
			<dt><fmt:message key="bonus.send.lowest"/></dt>
			<dd>
				<input name="startSendLow" type="text" value="${param.startSendLow }" size="10"/>
				 -
	    		<input name="endSendLow" type="text" value="${param.endSendLow }" size="10"/> 
			</dd>
		</dl>

		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="manageFiBonusAc"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form id="fiBonusAcBalanceListTableForm" method="get" >
		<ec:table 
			tableId="fiBonusAcBalanceListTable"
			items="fiBonusAcBalanceList"
			var="fiBonusAcBalance"
			action="manageFiBonusAc.jhtml"
			width="100%" method="get"
			retrieveRowsCallback="limit"
			autoIncludeParameters="true"
			rowsDisplayed="20" sortable="false" form="fiBonusAcBalanceListTableForm">
			<ec:row>
				<ec:column property="1" title="title.operation" sortable="false" styleClass="centerColumn" width="30" >
					<c:if test="${fiBonusAcBalance.bonus_type!='4' }">
						<win:power powerCode="editFiBonusAcBalance">
							<a href="editFiBonusAcBalance.jhtml?id=${fiBonusAcBalance.id}&strAction=editFiBonusAcBalance" name="edit">编辑</a>
						</win:power>
					</c:if>
					<c:if test="${fiBonusAcBalance.bonus_type=='4' }">
						&nbsp;
					</c:if>
				</ec:column>
				<ec:column property="member_no" title="fiPayAdvice.userCode">
					${fiBonusAcBalance.member_no}
				</ec:column>
				<ec:column property="bonus_type" title="收益类型" styleClass="centerColumn" width="100">
					<win:code listCode="bonus.type" value="${fiBonusAcBalance.bonus_type }"/>
				</ec:column>
				<ec:column property="status" title="fi.status" styleClass="centerColumn" width="100">
					<win:code listCode="bonus_account_status" value="${fiBonusAcBalance.status }"/>
				</ec:column>
				<ec:column property="send_percent" title="bonus.send.percent" styleClass="numberColumn" width="100">
					${fiBonusAcBalance.send_percent}%
				</ec:column>
				<ec:column property="send_low" title="bonus.send.lowest" styleClass="numberColumn" width="100">
					<fmt:formatNumber pattern="###,##0.00" value="${fiBonusAcBalance.send_low}"/>
				</ec:column>
				<ec:column property="last_eit_time" title="fiBankbookTemp.lastUpdateTime" width="300">
					${fiBonusAcBalance.last_editor_name}
					${fiBonusAcBalance.last_eit_time} 
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
</script>