<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
    <title><fmt:message key="货币管理"/></title>
    <meta name="heading" content="<fmt:message key="货币管理"/>"/>
</head>

<div class="searchBar">
	<form method="get" action="alCurrencys.jhtml" onsubmit="return validateSearch(this)">
		<dl>
			<dd>货币编码</dd>
			<dd><input type="text" name="currencyCode" id="currencyCode" value="${param.currencyCode}"/></dd>
		</dl>
		<dl>
			<dd>货币名称</dd>
			<dd><input type="text" name="currencyName" id="currencyName" value="${param.currencyName}"/></dd>
		</dl>
		<dl>
			<dt></dt>
			<dd>
				<button type="submit" name="search">搜索</button>
				<input type="hidden" name="strAction" value="listAlCurrencys"/>
			</dd>
		</dl>
	</form>
</div>

<div class="contentBody">
	<form name="alCurrencyFunctionForm" id="alCurrencyFunctionForm" action="editAlCurrency.jhtml" method="post" >
		<%@ include file="/common/messages.jsp" %>
		
		<div class="functionBar">
			<win:power powerCode="addAlCurrency">
				<a href="editAlCurrency.jhtml?strAction=addAlCurrency" name="add">
                    <fmt:message key="operation.button.add"/>
				</a>
				<span class="divider">&nbsp;</span>
			</win:power>
		</div>
		<input type="hidden" name="selectedCurrencyCodes">
		<input type="hidden" name="strAction">
		<input type="hidden" name="_form_uniq_id" value="${form.token}" />
	</form>
	
	<form id="alCurrencyListTableForm" method="get" >
		<ec:table 
			tableId="alCurrencyListTable"
			items="alCurrencys"
			var="alCurrencyVar"
			action="alCurrencys.jhtml"
			width="100%" method="get"
			autoIncludeParameters="true"
			retrieveRowsCallback="limit"
			rowsDisplayed="20" sortable="true" form="alCurrencyListTableForm">
			<ec:row>
				<win:power powerCode="editAlCurrency">
					<ec:column property="1" title="sysOperationLog.moduleName" sortable="false" styleClass="centerColumn">
						<a href="editAlCurrency.jhtml?strAction=editAlCurrency&currencyCode=${alCurrencyVar.currencyCode}" name="edit"><fmt:message key="button.edit"/></a>
					</ec:column>
				</win:power>
				<ec:column property="currencyCode" title="货币编码" />
				<ec:column property="currencyName" title="货币名称" />
				<%--<ec:column property="inRate" title="汇率(入)" />--%>
				<ec:column property="outRate" title="汇率(出)" />
				<ec:column property="lastUpdateTime" title="最后更新时间" />
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